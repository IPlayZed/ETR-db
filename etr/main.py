from random import choices, randint, seed
from string import ascii_letters, digits
import mysql.connector
from mysql.connector import errorcode as mysql_errorcode
from names import get_first_name, get_last_name
import tkinter
from tkinter import ttk


# Returns an alphanumerical string with the length of <length:int>
def mysql_get_random_alphanumeric_str(length):
    return ''.join(choices(ascii_letters + digits, k=length))


def mysql_get_random_alphanumeric_str_list(str_len, list_len):
    generated_list = []
    index = 0
    while index < list_len:
        item = mysql_get_random_alphanumeric_str(6)
        if item in generated_list:
            continue
        else:
            generated_list.append(item)
            index += 1
    return generated_list


def mysql_get_random_name_list(list_len, firstname=True):
    seed()
    generated_list = []
    for i in range(list_len):
        if firstname:
            generated_list.append(get_first_name())
        elif not firstname:
            generated_list.append(get_last_name())
    return generated_list


def mysql_get_random_titulus_list(list_len):
    seed()
    generated_list = []
    for i in range(list_len):
        seed()
        rand_type = randint(0, randint(1, 10))
        if rand_type == 0:
            generated_list.append("Dr.")
        else:
            generated_list.append(None)
    return generated_list


def mysql_get_random_beosztas_list(list_len):
    generated_list = []
    for i in range(list_len):
        seed()
        rand_type = randint(0, randint(1, 10))
        if rand_type == 0:
            generated_list.append("előadó")
        else:
            generated_list.append("demonstrátor")
    return generated_list


# Establishes connection and returns query fetch
def mysql_query(query, user_arg='root', password_arg='', host_arg='localhost', database_arg='etrdb'):
    try:
        cursor = mysql.connector.connect(user=user_arg, password=password_arg, host=host_arg,
                                         database=database_arg).cursor()
        cursor.execute(query)
        returnable = cursor.fetchall()
        cursor.close()
        return returnable
    # implement more error handling, for cursor() as well!!!
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
def mysql_query_select(table, columns=None, distinct=False):
    if columns is None:
        columns = ["*"]
    base_str = "SELECT"
    if distinct:
        base_str += " DISTINCT"
    if columns == ["*"] or len(columns) == 0:
        base_str += " * "
    else:
        index = 1
        length = len(columns)
        for column in columns:
            if index != length:
                base_str += (" " + column + ",")
            else:
                base_str += (" " + column + " ")
            index += 1
    base_str += ("FROM " + table)
    return base_str


def debug_mysql_fill_dummy_data(records_num):
    cursor = mysql.connector.connect(user='root', password='', host='localhost', database='etrdb').cursor()
    # fill table okatato
    oktato_etr_id_list = mysql_get_random_alphanumeric_str_list(6, records_num)
    vezeteknev_list = mysql_get_random_name_list(records_num, False)
    keresztnev_list = mysql_get_random_name_list(records_num)
    titulus_list = mysql_get_random_titulus_list(records_num)
    beosztas_list = mysql_get_random_beosztas_list(records_num)

    cursor.close()


if __name__ == '__main__':
    # print(mysql_query(mysql_query_select("oktato")))
    debug_mysql_fill_dummy_data(10)

    '''
    root = tkinter.Tk()  # TKINTER TOP LEVEL WIDGET

    # GET SCREEN DIMENSIONS
    calculated_width = str(root.winfo_screenwidth() // 2)
    calculated_height = str(root.winfo_screenheight() // 2)

    # SET THE SCREEN DIMENSIONS
    root.geometry(calculated_width + "x" + calculated_height)
    # SET WINDOW TITLE
    root.title("ETR")

    # use better implementation with columns!!!
    ttk.Label(root, text="probe").place(x=int(calculated_width) // 2, y=int(calculated_height) // 10)


    root.mainloop()
    '''
