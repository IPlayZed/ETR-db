import tkinter
import tkinter.font
from random import choices, randint, seed
from string import ascii_letters, digits
from tkinter import *
from tkinter import messagebox
from tkinter import ttk

import mysql.connector
from faker import Faker
from mysql.connector import errorcode as mysql_errorcode
from names import get_first_name, get_last_name

___DEBUG_MODE___ = True


# TODO: test this stuff more
class ScrollableFrame(ttk.Frame):
    def __init__(self, container, *args, **kwargs):
        super().__init__(container, *args, **kwargs)
        self.canvas = tkinter.Canvas(self)
        scrollbar_y = ttk.Scrollbar(self, orient='vertical', command=self.canvas.yview)
        scrollbar_x = ttk.Scrollbar(self, orient='horizontal', command=self.canvas.xview)
        self.scrollable_frame = ttk.Frame(self.canvas)

        self.scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(
                scrollregion=self.canvas.bbox("all")
            )
        )

        self.canvas.create_window((0, 0), window=self.scrollable_frame, anchor="nw")

        self.canvas.configure(yscrollcommand=scrollbar_y.set)
        self.canvas.configure(xscrollcommand=scrollbar_x.set)

        self.canvas.grid(row=0, column=0)
        scrollbar_y.grid(row=0, column=1)
        scrollbar_x.grid(row=1, column=0)

    def change_canvas_size_w(self, w):
        self.canvas.configure(width=w)


# Returns an alphanumerical string with the length of <length:int>
def generator_get_random_alphanumeric_str(length):
    return ''.join(choices(ascii_letters + digits, k=length))


def generator_get_random_alphanumeric_str_list(str_len, list_len):
    generated_list = []
    index = 0
    while index < list_len:
        item = generator_get_random_alphanumeric_str(str_len)
        if item in generated_list:
            continue
        else:
            generated_list.append(item)
            index += 1
        if ___DEBUG_MODE___ is True:
            print('generator_get_random_alphanumeric_str_list: ' + str(index) + '/' + str(list_len))
    return generated_list


def generator_get_random_name_list(list_len, firstname=True):
    seed()
    generated_list = []
    for i in range(list_len):
        if firstname:
            generated_list.append(get_first_name())
        elif not firstname:
            generated_list.append(get_last_name())
        if ___DEBUG_MODE___ is True:
            print('generator_get_random_name_list: ' + str(i) + '/' + str(list_len))
    return generated_list


def generator_get_random_binary_choice_list(list_len, likely_choice, unlikely_choice):
    generated_list = []
    for i in range(list_len):
        seed()
        rand_type = randint(0, randint(1, 10))
        if rand_type == 0:
            generated_list.append(unlikely_choice)
        else:
            generated_list.append(likely_choice)
        if ___DEBUG_MODE___ is True:
            print('generator_get_random_binary_choice_list: ' + str(i) + '/' + str(list_len))
    return generated_list


def generator_get_random_int_list(list_len, min_int, max_int):
    generated_list = []
    for i in range(list_len):
        seed()
        generated_list.append(randint(min_int, randint(min_int, max_int)))
        if ___DEBUG_MODE___ is True:
            print('generator_get_random_int_list: ' + str(i) + '/' + str(list_len))
    return generated_list


def generator_get_random_address_list(list_len):
    generated_list = []
    fkr = Faker()
    for i in range(list_len):
        generated_list.append(fkr.address().strip().replace("\n", " "))
        if ___DEBUG_MODE___ is True:
            print('generator_get_random_address_list: ' + str(i) + '/' + str(list_len))
    return generated_list


def generator_concatenate_sql_params(str_list, quoted_params=False):
    index = 1
    returnable_str = ""
    for string in str_list:
        if index != len(str_list):
            if quoted_params is True:
                returnable_str += (" '" + string + "', ")
            else:
                returnable_str += (' ' + string + ', ')
        else:
            if quoted_params is True:
                returnable_str += (" '" + string + "'")
            else:
                returnable_str += (' ' + string + ' ')
        index += 1
    return returnable_str


# Establishes connection and returns query fetch
def mysql_query(query, user_arg='root', password_arg='', host_arg='localhost', database_arg='etrdb', fetch=True):
    try:
        clx = mysql.connector.connect(user=user_arg, password=password_arg, host=host_arg,
                                      database=database_arg)
        cursor = clx.cursor()
        cursor.execute(query)
        returnable = None
        if fetch is True:
            returnable = cursor.fetchall()
        else:
            clx.commit()
        clx.close()
        return returnable
    # implement more error handling, for the cursor() as well!!!
    except mysql.connector.Error as connection_error:
        if connection_error == mysql_errorcode.ER_ACCESS_DENIED_ERROR:
            print("ERROR:Bad user/password")
            return -1
        elif connection_error == mysql_errorcode.ER_BAD_DB_ERROR:
            print("ERROR:Database does not exist")
            return -2
        else:
            print("ERROR:Other error: " + str(connection_error))
            return -3


# implement this more generically!!!
def debug_mysql_query_select(table, columns=None, distinct=False, where=None):
    if columns is None:
        columns = ['*']
    base_str = 'SELECT'
    if distinct:
        base_str += ' DISTINCT'
    if columns == ['*'] or len(columns) == 0:
        base_str += ' * '
    else:
        base_str += generator_concatenate_sql_params(columns)
    base_str += ('FROM ' + table)
    if where is not None:
        pass
    return base_str


def debug_mysql_fill_dummy_data(records_num=100):
    # ALWAYS make sure to open a new connection

    # create data for okatato
    oktato_etr_id_list = generator_get_random_alphanumeric_str_list(6, records_num)
    oktato_vezeteknev_list = generator_get_random_name_list(records_num, False)
    oktato_keresztnev_list = generator_get_random_name_list(records_num)
    oktato_titulus_list = generator_get_random_binary_choice_list(records_num, None, "Dr.")
    oktato_beosztas_list = generator_get_random_binary_choice_list(records_num, "gyakorlatvezető", "előadó")

    # create data for terem
    terem_teremszam_list = generator_get_random_alphanumeric_str_list(6, records_num)
    terem_ferohely_list = generator_get_random_int_list(records_num, 10, 400)
    terem_cim_list = generator_get_random_address_list(records_num)

    # create data for targy
    targy_targykod_list = generator_get_random_alphanumeric_str_list(6, records_num)
    targy_ajanlott_felev_list = generator_get_random_int_list(records_num, 1, 7)
    targy_nev_list = generator_get_random_alphanumeric_str_list(10, records_num)

    # create data for hallgato
    hallgato_etr_id_list = generator_get_random_alphanumeric_str_list(6, records_num)
    hallgato_lakhely_list = generator_get_random_address_list(records_num)
    hallgato_tagozat_forma_list = generator_get_random_binary_choice_list(records_num, "normál", "levelező")
    hallgato_koltsegteritesi_forma_list = generator_get_random_binary_choice_list(records_num, "állami", "önköltséges")
    hallgato_vezeteknev_list = generator_get_random_name_list(records_num, False)
    hallgato_keresztnev_list = generator_get_random_name_list(records_num)
    hallgato_titulus_list = generator_get_random_binary_choice_list(records_num, None, "Dr.")

    for i in range(records_num):
        con = mysql.connector.connect(user='root', password='', host='localhost', database='etrdb')
        cursor = con.cursor()
        # fill table oktato
        if oktato_titulus_list[i] is None:
            insertable = (
                oktato_etr_id_list[i], oktato_vezeteknev_list[i], oktato_keresztnev_list[i], oktato_beosztas_list[i])
            cursor.execute(
                'INSERT INTO oktato (oktato_etr_id, vezeteknev, keresztnev, beosztas) VALUES (%s, %s, %s, %s)',
                insertable)
            cursor.execute('commit')
        else:
            insertable = (
                oktato_etr_id_list[i], oktato_vezeteknev_list[i], oktato_keresztnev_list[i], oktato_titulus_list[i],
                oktato_beosztas_list[i])
            cursor.execute(
                'INSERT INTO oktato (oktato_etr_id, vezeteknev, keresztnev, titulus, beosztas) VALUES (%s, %s, %s, '
                '%s, %s)',
                insertable)
            cursor.execute('commit')

        # fill table terem
        insertable = (terem_teremszam_list[i], terem_ferohely_list[i], terem_cim_list[i])
        cursor.execute('INSERT INTO terem (teremszam, ferohely, cim) VALUES (%s, %s, %s)', insertable)
        cursor.execute('commit')

        # fill table targy
        insertable = (targy_targykod_list[i], targy_ajanlott_felev_list[i], targy_nev_list[i])
        cursor.execute('INSERT INTO targy (targykod, ajanlott_felev, nev) VALUES (%s, %s, %s)', insertable)
        cursor.execute('commit')

        # fill table hallgato
        if hallgato_titulus_list[i] is None:
            insertable = (hallgato_etr_id_list[i], hallgato_lakhely_list[i], hallgato_tagozat_forma_list[i],
                          hallgato_koltsegteritesi_forma_list[i], hallgato_vezeteknev_list[i],
                          hallgato_keresztnev_list[i])
            cursor.execute(
                'INSERT INTO hallgato (hallgato_etr_id, lakhely, tagozat_forma, koltsegteritesi_forma, vezeteknev, '
                'keresztnev) VALUES (%s, %s, %s, %s, %s, %s)',
                insertable)
            cursor.execute('commit')
        else:
            insertable = (hallgato_etr_id_list[i], hallgato_lakhely_list[i], hallgato_tagozat_forma_list[i],
                          hallgato_koltsegteritesi_forma_list[i], hallgato_vezeteknev_list[i],
                          hallgato_keresztnev_list[i], hallgato_titulus_list[i])
            cursor.execute(
                'INSERT INTO hallgato (hallgato_etr_id, lakhely, tagozat_forma, koltsegteritesi_forma, vezeteknev, '
                'keresztnev, titulus) VALUES (%s, %s, %s, %s, %s, %s, %s)',
                insertable)
            cursor.execute('commit')
        con.close()


def debug_mysql_delete_table_data(table_name, where_arg=None, force_truncate=False, user_arg='root', password_arg='',
                                  host_arg='localhost',
                                  database_arg='etrdb'):
    mlx = mysql.connector.connect(user=user_arg, password=password_arg, host=host_arg,
                                  database=database_arg)
    cursor = mlx.cursor()
    if isinstance(table_name, str):
        if force_truncate is True:
            cursor.execute('SET FOREIGN_KEY_CHECKS = 0')
            mlx.commit()
            cursor.execute('TRUNCATE table ' + table_name)
            mlx.commit()
            cursor.execute('SET FOREIGN_KEY_CHECKS = 1')
            mlx.commit()
        if where_arg is None:
            cursor.execute('DELETE FROM ' + table_name)
        else:
            cursor.execute('DELETE FROM ' + table_name + ' WHERE ' + where_arg)
        cursor.execute('commit')
        mlx.close()
    else:
        print("\'table_name\' can only be of type str")
        return -1
    return 0


def debug_mysql_get_col_names(table_name):
    columns = []
    if type(table_name) is str:
        processable = mysql_query('DESCRIBE ' + table_name)
        if len(processable) == 0:
            if ___DEBUG_MODE___ is True:
                print('Query resulted in no fetchable data')
            return -1
        else:
            for item in processable:
                columns.append(item[0])
            return columns
    else:
        print('Parameter must be a string!')
        return -2


def debug_mysql_query_insert_into(table, values, columns=None):
    base_str = 'INSERT INTO '
    base_str += (table + ' ')
    if columns is not None:
        base_str += '('
        base_str += generator_concatenate_sql_params(str_list=columns)
        base_str += ')'
    base_str += ' VALUES ('
    base_str += generator_concatenate_sql_params(str_list=values, quoted_params=True)
    base_str += ')'
    base_str = base_str.replace('  ', ' ').replace('( ', '(').replace(' )', ')').strip()
    print(base_str)
    return base_str


def debug_string_is_int(string):
    try:
        int(string)
        return True
    except ValueError:
        return False


def gui_normal_window():
    # TODO: implement GUI graphing
    ___INTEGER___ = 'i'
    ___U_INTEGER___ = 'ui'
    ___STRING___ = 'str'

    # functionality lambdas
    def get_column_meta(columns, column_index):
        tmp = columns[column_index][1]
        if tmp.startswith('varchar') is True:
            col_type = ___STRING___
        if tmp.startswith('int') is True:
            col_type = ___INTEGER___
            if tmp.endswith('unsigned') is True:
                col_type = ___U_INTEGER___
        col_len = int(tmp.split('(')[1].split(')')[0])
        tmp = columns[column_index][2]
        if tmp == 'NO':
            col_isnull = False
        if tmp == 'YES':
            col_isnull = True
        col_dict = {'type': col_type, 'length': col_len, 'isnull': col_isnull}
        return col_dict

    def list_db(chosen_table_arg):
        # get the result of query in a list of tuples and meta
        query_res = mysql_query(debug_mysql_query_select(table=chosen_table_arg))
        query_res_column_num = len(query_res)

        # set up main new toplevel window root
        query_window_root = tkinter.Toplevel()
        query_window_root.title('Results from table \'' + chosen_table_arg + '\'')

        # set up base frame in new root
        query_window_mainframe = ttk.Frame(query_window_root)
        query_window_root.columnconfigure(0, weight=1)
        query_window_root.rowconfigure(0, weight=1)
        # query_window_root.rowconfigure(2, weight=1)
        query_window_mainframe.grid(row=0, column=0)

        # create and put queried table title on screen
        query_window_base_label = ttk.Label(query_window_mainframe, text='Table \'' + chosen_table_arg + '\'')
        query_window_base_label.grid(row=0, column=0, columnspan=query_res_column_num)

        # get queried table's columns
        columns = debug_mysql_get_col_names(chosen_table_arg)

        # if the table has columns
        if columns is not []:
            # set up and put labeled screen for grouping the table's columns' names
            query_columns_title_frame = ttk.Labelframe(query_window_mainframe, text='Columns')
            query_columns_title_frame.grid(row=1, column=0, columnspan=query_res_column_num)

            # set up indexes for building
            row_index = 1
            column_index = 0
            # build up table titles
            for column in columns:
                if ___DEBUG_MODE___ is True:
                    print(str(column))
                ttk.Label(query_columns_title_frame, text=column).grid(row=row_index,
                                                                       column=column_index, padx=5, pady=15)
                column_index += 1
            column_index = 0

            # creating data frame root
            query_columns_data_frame = ttk.Labelframe(query_window_mainframe, text='Records')
            query_columns_data_frame.grid(row=2, column=0, columnspan=query_res_column_num)
            # query_columns_data_frame.columnconfigure(0, weight=5)

            # creating scrollable frame instance
            query_columns_data_scrollable_frame = ScrollableFrame(query_columns_data_frame)
            # population
            max_length = 0
            max_c = tkinter.font.Font(weight='normal').measure('0')
            for item in query_res:
                row_index += 1
                max_length_tmp = 0
                for item_column in item:
                    # row was rowindex
                    tmp = ttk.Label(query_columns_data_scrollable_frame.scrollable_frame, text=item_column)
                    tmp.grid(row=row_index, column=column_index, padx=5, pady=10)
                    '''
                    if tmp.winfo_screenwidth() > max_w:
                        max_w = tmp.winfo_screenwidth()
                    '''
                    if item_column is not None:
                        max_length_tmp += len(str(item_column))
                    column_index += 1
                if max_length_tmp > max_length:
                    max_length = max_length_tmp
                column_index = 0
            query_columns_data_scrollable_frame.grid(row=0, column=0, rowspan=query_res_column_num)
            query_columns_data_scrollable_frame.change_canvas_size_w(w=max_length * max_c)
        # if the queried table did not have any columns
        else:
            tkinter.messagebox.showwarning('Warning', 'Queried table has no columns!')

        if ___DEBUG_MODE___ is True:
            print('chosen_table_arg: ' + chosen_table_arg)
            print('query_res: ' + str(query_res))

    def insert(chosen_table_arg):

        def make_query(entry_list, column_list):
            index = 0
            value_list = []
            for item in entry_list:
                col_dict = get_column_meta(columns=column_list, column_index=index)
                col_type = col_dict['type']
                col_len = col_dict['length']
                col_isnull = col_dict['isnull']
                inp = item.get()
                if inp == '' and col_isnull is False:
                    tkinter.messagebox.showwarning('Warning', 'Field ' + column_list[index][0] + ' can not be empty!')
                if debug_string_is_int(inp) is True and (col_type is ___INTEGER___ or col_type is ___U_INTEGER___):
                    if int(inp) < 0 and col_type is ___U_INTEGER___:
                        tkinter.messagebox.showwarning('Warning',
                                                       'Field ' + column_list[index][0] + ' must be positive')
                elif debug_string_is_int(inp) is False and col_type is ___INTEGER___:
                    tkinter.messagebox.showwarning('Warning', 'Field' + column_list[index][0] + ' must be an integer!')
                elif debug_string_is_int(inp) is False and len(inp) > col_len:
                    tkinter.messagebox.showwarning('Warning',
                                                   'Field' + column_list[index][0] + ' can be maximally ' + str(
                                                       col_len) + ' long!')

                value_list.append(inp)
                index += 1
            mysql_query(debug_mysql_query_insert_into(table=chosen_table_arg, values=value_list), fetch=False)

        # set up the basics of insert window
        insert_root = tkinter.Toplevel()
        insert_root.title('Insert data into table ' + chosen_table_arg)
        insert_root.columnconfigure(0, weight=1)
        insert_root.rowconfigure(0, weight=1)

        # set up root frame
        insert_root_frame = tkinter.Frame(insert_root)
        insert_root_frame.grid(row=0, column=1, padx=10, pady=10)

        # get metadata about table
        columns = mysql_query('DESCRIBE ' + chosen_table_arg)
        row_i = 0
        entries = []
        for column in columns:
            tkinter.Label(insert_root_frame, text=column[0]).grid(row=row_i, column=0, padx=5)
            entries.append(tkinter.Entry(insert_root_frame))
            row_i += 1
        row_i = 0
        for entry in entries:
            entry.grid(row=row_i, column=1, padx=5)
            row_i += 1
        btn = tkinter.Button(insert_root_frame, text='Insert into ' + chosen_table_arg,
                             command=lambda: make_query(entry_list=entries, column_list=columns))
        btn.grid(row=row_i, column=0, columnspan=3, pady=5)

    def modify(chosen_table_arg):
        pass

    def delete(chosen_table_arg):
        # TODO: implement making the DELETE query with handling no column or where clause
        def make_query(table, col, where):
            pass

        # get meta about table
        columns_raw = mysql_query('DESCRIBE ' + chosen_table_arg)
        columns = []
        for raw in columns_raw:
            columns.append(raw[0])

        # new toplevel window root setup
        delete_window_root = tkinter.Toplevel()
        delete_window_root.title("Delete from '" + chosen_table_arg)
        delete_window_root.columnconfigure(0, weight=1)
        delete_window_root.rowconfigure(0, weight=1)

        # basic widgets setup
        delete_window_main_frame = ttk.Frame(delete_window_root)
        delete_window_main_frame.grid(row=0, column=0)
        table_label = tkinter.Label(delete_window_main_frame, text='table')
        column_label = tkinter.Label(delete_window_main_frame, text='column')
        where_label = tkinter.Label(delete_window_main_frame, text='WHERE condition')
        table_entry = tkinter.Entry(delete_window_main_frame)
        column_entry = tkinter.Entry(delete_window_main_frame)
        where_entry = tkinter.Entry(delete_window_main_frame)
        table_label.grid(row=0, column=0)
        column_label.grid(row=1, column=0)
        where_label.grid(row=2, column=0)
        table_entry.grid(row=0, column=1)
        column_entry.grid(row=1, column=1)
        where_entry.grid(row=2, column=1)
        tkinter.Button(delete_window_main_frame, text='Delete',
                       command=lambda: make_query(table=table_entry.get(), col=column_entry.get(),
                                                  where=where_entry.get())).grid(row_i=3, column=0, columnspan=3)

    # new toplevel window root setup
    normal_window_root = tkinter.Toplevel()
    normal_window_root.title('SQL queries')
    normal_window_root.columnconfigure(0, weight=1)
    normal_window_root.rowconfigure(0, weight=1)

    # basic widgets setup
    main_frame = ttk.Frame(normal_window_root)
    list_db_button = ttk.Button(main_frame, text='List records from tables',
                                command=lambda: list_db(chosen_table_arg=chosen_table.get()))
    insert_db_button = ttk.Button(main_frame, text='Insert record into table',
                                  command=lambda: insert(chosen_table_arg=chosen_table.get()))
    modify_db_button = ttk.Button(main_frame, text='Modify (update) record in table',
                                  command=lambda: modify(chosen_table_arg=chosen_table.get()))
    delete_db_button = ttk.Button(main_frame, text='Delete record from database',
                                  command=lambda: delete(chosen_table_arg=chosen_table.get()))

    # radio button widgets setup
    radio_b_l_frame = ttk.Labelframe(main_frame, text='Choosable tables')
    chosen_table = tkinter.StringVar()
    chosen_table.set('oktato')
    radio_b_modes = [
        ('table: \'oktato\'', 'oktato'),
        ('table: \'hallgato\'', 'hallgato'),
        ('table: \'targy\'', 'targy'),
        ('table: \'terem\'', 'terem'),
    ]

    def radio_b_clicked(printable=None):
        if ___DEBUG_MODE___ is True and (printable is not None):
            print(printable)

    # normal widgets rendering
    main_frame.grid(row=0, column=0)
    radio_b_l_frame.grid(row=0, column=0, rowspan=4, padx=10)
    list_db_button.grid(row=0, column=1, pady=10)
    insert_db_button.grid(row=1, column=1, pady=10)
    modify_db_button.grid(row=2, column=1, pady=10)
    delete_db_button.grid(row=3, column=1, pady=10)

    # radio buttons rendering
    for rad_b_l_txt, rad_b_l_val in radio_b_modes:
        Radiobutton(radio_b_l_frame, text=rad_b_l_txt, variable=chosen_table, value=rad_b_l_val,
                    command=lambda: radio_b_clicked(chosen_table.get())).pack(anchor=W)
        if ___DEBUG_MODE___ is True:
            print('text:\"' + rad_b_l_txt + '\", value:\"' + rad_b_l_val + '\"')


def gui_admin_window(root):
    # if param is needed to call these functions, could use lambdas to call them and pass params to them in command
    def gui_call_debug_mysql_fill_dummy_data():
        # TODO: handle called debug function record code.
        if dummy_fill_entry.get() == '':
            tkinter.messagebox.showwarning('Warning', 'Entry must be filled!')
        elif debug_string_is_int(dummy_fill_entry.get()) is False:
            tkinter.messagebox.showwarning('Warning', 'Entry must be an integer!')
        else:
            debug_mysql_fill_dummy_data(int(dummy_fill_entry.get()))
            tkinter.messagebox.showinfo('Info', 'Successful creation and insertion!')
        dummy_fill_entry.delete(0, END)
        admin_window_root.destroy()

    def gui_call_debug_mysql_truncate_all_tables():
        tables = ['felvetel', 'gepterem', 'hallgato', 'kurzus', 'leadas', 'oktato', 'targy', 'terem']
        func_ret_code = None
        for table in tables:
            func_ret_code = debug_mysql_delete_table_data(table_name=table, force_truncate=True)
        if func_ret_code == 0:
            tkinter.messagebox.showinfo('Info', 'Successful data deletion!')
        else:
            tkinter.messagebox.showwarning('Warning', 'Something went wrong!')
        admin_window_root.destroy()

    admin_window_root = tkinter.Toplevel()
    admin_window_root.title("Admin functionalities")
    scr_w_admin = str(root.winfo_screenwidth() // 3)
    scr_h_admin = str(root.winfo_screenheight() // 3)
    admin_window_root.geometry(scr_w_admin + 'x' + scr_h_admin)
    main_frame = ttk.Frame(admin_window_root)
    main_frame.grid(row=0, column=0)
    admin_window_root.columnconfigure(0, weight=1)
    admin_window_root.rowconfigure(0, weight=1)
    title_label = ttk.Label(main_frame, text="Admin functions, only for debugging!")
    dummy_fill_entry = ttk.Entry(main_frame)

    dummy_fill_button = ttk.Button(main_frame, text="Fill with random dummy info",
                                   command=gui_call_debug_mysql_fill_dummy_data)
    truncate_tables_button = ttk.Button(main_frame, text="Truncate all tables",
                                        command=gui_call_debug_mysql_truncate_all_tables)
    title_label.grid(row=0, column=0, columnspan=2, pady=10)
    dummy_fill_entry.grid(row=1, column=1, padx=10, pady=5)
    dummy_fill_button.grid(row=1, column=0)
    truncate_tables_button.grid(row=2, column=0)


def gui_home_window(root):
    root.title("ETR-DB")
    main_frame = ttk.Frame(root, width=scr_w, height=scr_h)
    main_frame.grid(row=0, column=0)
    root.columnconfigure(0, weight=1)  # resize columns when window is resized
    root.rowconfigure(0, weight=1)  # resize rows when window is resized

    title_label = ttk.Label(main_frame, text="Home")
    admin_button = ttk.Button(main_frame, text="Admin functions", command=lambda: gui_admin_window(root=root))
    user_button = ttk.Button(main_frame, text="Make queries", command=lambda: gui_normal_window())
    title_label.grid(row=0, column=0, pady=10, sticky=N)
    admin_button.grid(row=1, column=0, pady=5)
    user_button.grid(row=2, column=0, pady=5)


if __name__ == '__main__':
    root_widget = tkinter.Tk()
    scr_w = str(root_widget.winfo_screenwidth() // 3)
    scr_h = str(root_widget.winfo_screenheight() // 3)
    root_widget.geometry(scr_w + 'x' + scr_h)
    root_widget.attributes('-fullscreen', 0)
    # TODO: find out why iconbitmap() does not work!!!
    # root_widget.iconbitmap('icon.ico')
    gui_home_window(root=root_widget)
    root_widget.mainloop()
    root_widget.destroy()
