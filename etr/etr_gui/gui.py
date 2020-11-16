import tkinter
from tkinter import ttk, Radiobutton, W, N, END

from etr.etr_mysql.mysql import mysql_query, debug_mysql_query_select, debug_mysql_get_col_names, debug_string_is_int, \
    debug_mysql_fill_dummy_data, debug_mysql_delete_table_data
from etr.main import ___DEBUG_MODE___, scr_w, scr_h


def gui_normal_window(root):
    # functionality lambdas
    # TODO: implement GUI formatted listing and graphing
    def list_db(root_arg, chosen_table_arg):
        # get the result of query in a list of tuples and meta
        query_res = mysql_query(debug_mysql_query_select(table=chosen_table_arg))
        query_res_column_num = len(query_res)

        # set up main new toplevel window root
        query_window_root = tkinter.Toplevel()
        query_window_root.title('Results from table \'' + chosen_table_arg + '\'')
        query_window_root.geometry(scr_w_normal + 'x' + scr_h_normal)

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
        columns = []
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
            for item in query_res:
                row_index += 1
                for item_column in item:
                    # row was rowindex
                    ttk.Label(query_columns_data_scrollable_frame.scrollable_frame, text=item_column).grid(
                        row=row_index,
                        column=column_index, padx=5,
                        pady=10)
                    column_index += 1
                column_index = 0
            query_columns_data_scrollable_frame.grid(row=0, column=0, rowspan=query_res_column_num)
        # if the queried table did not have any columns
        else:
            tkinter.messagebox.showwarning('Warning', 'Queried table has no columns!')

        if ___DEBUG_MODE___ is True:
            print('chosen_table_arg: ' + chosen_table_arg)
            print('query_res: ' + str(query_res))

    def insert(root_arg, chosen_table_arg, table):
        insert_window_root = tkinter.Toplevel()
        insert_window_root.title('Insert into: \'' + table)
        insert_window_root.geometry(scr_w_normal + 'X' + scr_h_normal)
        insert_window_root.columnconfigure(0, weight=1)
        insert_window_root.rowconfigure(0, weight=1)

        insert_window_mainframe = ttk.Frame(insert_window_root)

    def modify(root_arg, chosen_table_arg):
        pass

    def delete(root_arg, chosen_table_arg):
        pass

    # root setup
    normal_window_root = tkinter.Toplevel()
    normal_window_root.title('SQL queries')
    scr_w_normal = str(root.winfo_screenwidth() // 2)
    scr_h_normal = str(root.winfo_screenheight() // 2)
    normal_window_root.geometry(scr_w_normal + 'x' + scr_h_normal)
    normal_window_root.columnconfigure(0, weight=1)
    normal_window_root.rowconfigure(0, weight=1)

    # basic widgets setup
    main_frame = ttk.Frame(normal_window_root)
    list_db_button = ttk.Button(main_frame, text='List records from tables',
                                command=lambda: list_db(root_arg=normal_window_root,
                                                        chosen_table_arg=chosen_table.get()))
    insert_db_button = ttk.Button(main_frame, text='Insert record into table',
                                  command=lambda: insert(root_arg=normal_window_root,
                                                         chosen_table_arg=chosen_table.get()))
    modify_db_button = ttk.Button(main_frame, text='Modify (update) record in table',
                                  command=lambda: modify(root_arg=normal_window_root,
                                                         chosen_table_arg=chosen_table.get()))
    delete_db_button = ttk.Button(main_frame, text='Delete record from database',
                                  command=lambda: delete(root_arg=normal_window_root,
                                                         chosen_table_arg=chosen_table.get()))

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

    def radio_b_clicked(val):
        # TODO: find out why does this F up my code if I leave it in it
        # chosen_table.set(value=val)
        if ___DEBUG_MODE___ is True:
            print(chosen_table.get())

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
                    command=lambda: radio_b_clicked(rad_b_l_val)).pack(anchor=W)
        if ___DEBUG_MODE___ is True:
            print('text:\"' + rad_b_l_txt + '\", value:\"' + rad_b_l_val + '\"')


def gui_home_window(root):
    root.title("ETR-DB")
    main_frame = ttk.Frame(root, width=scr_w, height=scr_h)
    main_frame.grid(row=0, column=0)
    root.columnconfigure(0, weight=1)  # resize columns when window is resized
    root.rowconfigure(0, weight=1)  # resize rows when window is resized

    title_label = ttk.Label(main_frame, text="Home")
    admin_button = ttk.Button(main_frame, text="Admin functions", command=lambda: gui_admin_window(root=root))
    user_button = ttk.Button(main_frame, text="Make queries", command=lambda: gui_normal_window(root=root))
    title_label.grid(row=0, column=0, pady=10, sticky=N)
    admin_button.grid(row=1, column=0, pady=5)
    user_button.grid(row=2, column=0, pady=5)


class ScrollableFrame(ttk.Frame):
    def __init__(self, container, *args, **kwargs):
        super().__init__(container, *args, **kwargs)
        canvas = tkinter.Canvas(self)
        scrollbar_y = ttk.Scrollbar(self, orient='vertical', command=canvas.yview)
        scrollbar_x = ttk.Scrollbar(self, orient='horizontal', command=canvas.xview)
        self.scrollable_frame = ttk.Frame(canvas)

        self.scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(
                scrollregion=canvas.bbox("all")
            )
        )

        canvas.create_window((0, 0), window=self.scrollable_frame, anchor="nw")

        canvas.configure(yscrollcommand=scrollbar_y.set)
        canvas.configure(xscrollcommand=scrollbar_x.set)

        canvas.grid(row=0, column=0)
        scrollbar_y.grid(row=0, column=1)
        scrollbar_x.grid(row=1, column=0)


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
