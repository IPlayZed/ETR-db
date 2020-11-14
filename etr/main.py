from random import choices, randint, seed
from string import ascii_letters, digits
import mysql.connector
from mysql.connector import errorcode as mysql_errorcode
from names import get_first_name, get_last_name
from faker import Faker
import tkinter
from tkinter import *
from tkinter import messagebox
from tkinter import ttk


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
    return generated_list


def generator_get_random_name_list(list_len, firstname=True):
    seed()
    generated_list = []
    for i in range(list_len):
        if firstname:
            generated_list.append(get_first_name())
        elif not firstname:
            generated_list.append(get_last_name())
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
    return generated_list


def generator_get_random_int_list(list_len, min_int, max_int):
    generated_list = []
    for i in range(list_len):
        seed()
        generated_list.append(randint(min_int, randint(min_int, max_int)))
    return generated_list


def generator_get_random_address_list(list_len):
    generated_list = []
    fkr = Faker()
    for i in range(list_len):
        generated_list.append(fkr.address().strip().replace("\n", " "))
    return generated_list


def generator_concatenate_sql_params(str_list):
    index = 1
    returnable_str = ''
    for string in str_list:
        if index != len(str_list):
            returnable_str += (' ' + string + ', ')
        else:
            returnable_str += (' ' + string + ' ')
        index += 1
    return returnable_str


# Establishes connection and returns query fetch
def mysql_query(query, user_arg='root', password_arg='', host_arg='localhost', database_arg='etrdb'):
    try:
        clx = mysql.connector.connect(user=user_arg, password=password_arg, host=host_arg,
                                      database=database_arg)
        cursor = clx.cursor()
        cursor.execute(query)
        returnable = cursor.fetchall()
        cursor.close()
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
            print("ERROR:Other error")
            return -3


# implement this more generically!!!
def debug_mysql_query_select(table, columns=None, distinct=False):
    if len(table) == 0:
        return -1
    else:
        if columns is None:
            columns = ["*"]
        base_str = "SELECT"
        if distinct:
            base_str += " DISTINCT"
        if columns == ["*"] or len(columns) == 0:
            base_str += " * "

        concatenable = generator_concatenate_sql_params(table)
        base_str += ("FROM " + concatenable)
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
    if force_truncate is True:
        if len(table_name) != 1:
            mlx.close()
            return "ERROR: Can only truncate one table in a call!"
        cursor.execute('SET FOREIGN_KEY_CHECKS = 0')
        mlx.commit()
        cursor.execute('TRUNCATE table ' + table_name)

    if where_arg is None:
        cursor.execute('DELETE FROM ' + table_name)
    else:
        cursor.execute('DELETE FROM ' + table_name + ' WHERE ' + where_arg)
    cursor.execute('commit')
    mlx.close()
    return 0


def gui_admin_window():
    def gui_call_debug_mysql_fill_dummy_data():
        # TODO: add more case handling for input string
        if dummy_fill_entry.get() == '':
            tkinter.messagebox.showwarning('Warning', 'Entry must be filled!')
        else:
            debug_mysql_fill_dummy_data(int(dummy_fill_entry.get()))
            tkinter.messagebox.showinfo('Info', 'Successful data generation and input!')

    admin_window_root = Toplevel()
    admin_window_root.title("Admin functionalities")
    scr_w_admin = str(admin_window_root.winfo_screenwidth() // 3)
    scr_h_admin = str(admin_window_root.winfo_screenheight() // 3)
    admin_window_root.geometry(scr_w_admin + 'x' + scr_h_admin)
    main_frame = ttk.Frame(admin_window_root, width=scr_w, height=scr_h)
    main_frame.grid(row=0, column=0)
    admin_window_root.columnconfigure(0, weight=1)
    admin_window_root.rowconfigure(0, weight=1)
    title_label = ttk.Label(main_frame, text="Admin functions, only for debugging!")
    dummy_fill_entry = ttk.Entry(admin_window_root)

    dummy_fill_button = ttk.Button(admin_window_root, text="Fill with random dummy info",
                                   command=gui_call_debug_mysql_fill_dummy_data)
    title_label.grid(row=0, column=0)
    dummy_fill_entry.grid(row=1, column=2)
    dummy_fill_button.grid(row=1, column=0)


def gui_home_window(root):
    root.title("ETR-DB")
    main_frame = ttk.Frame(root, width=scr_w, height=scr_h)
    main_frame.grid(row=0, column=0)
    root.columnconfigure(0, weight=1)  # resize columns when window is resized
    root.rowconfigure(0, weight=1)  # resize rows when window is resized
    title_label = ttk.Label(main_frame, text="Home")
    admin_button = ttk.Button(main_frame, text="Admin functions", command=gui_admin_window)
    user_button = ttk.Button(main_frame, text="Make queries")
    title_label.grid(row=0, column=0)
    admin_button.grid(row=1, column=0)
    user_button.grid(row=2, column=0)


if __name__ == '__main__':
    # debug_mysql_fill_dummy_data(12000)

    root_widget = tkinter.Tk()
    scr_w = str(root_widget.winfo_screenwidth() // 2)
    scr_h = str(root_widget.winfo_screenheight() // 2)
    root_widget.geometry(scr_w + 'x' + scr_h)
    root_widget.attributes('-fullscreen', 0)
    gui_home_window(root=root_widget)
    debug_mysql_query_select([])
    root_widget.mainloop()
    root_widget.destroy()
