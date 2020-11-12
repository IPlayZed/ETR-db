import mysql.connector
from mysql.connector import errorcode as mysql_errorcode
import tkinter
from tkinter import ttk
from random import choices
from string import ascii_letters, digits


# Returns an alphanumerical string with the length of <length:int>
def mysql_get_random_alphanumeric_str(length):
    return ''.join(choices(ascii_letters + digits, k=length))


# Establishes connection and returns with connection object
def mysql_establish_connection(user_arg='root', password_arg='', host_arg='localhost', database_arg='etrdb'):
    try:
        return mysql.connector.connect(user=user_arg, password=password_arg, host=host_arg, database=database_arg)
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


# Establishes connection and return with connection object cursor
def mysql_get_cursor(user_arg='root', password_arg='', host_arg='localhost', database_arg='etrdb'):
    return mysql_establish_connection(user_arg, password_arg, host_arg, database_arg).cursor()


def mysql_query_select(table, columns=None):
    if columns is None:
        columns = ["*"]
    base_str = "SELECT"
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


if __name__ == '__main__':
    '''
    # weak reference causes bad functionality, look into it!!!
    cursor = mysql_get_cursor()
    query = mysql_query_select("oktato")
    print(cursor.execute(query))
    '''
    query = mysql_query_select("oktato")
    clx = mysql.connector.connect(user="root", password="", host="localhost", database="etrdb")
    curs = clx.cursor()
    curs.execute(query)
    res = curs.fetchall()
    print(res)
    curs.close()
    '''
    root = tkinter.Tk()  # TKINTER TOP LEVEL WIDGET

    # GET SCREEN DIMENSIONS
    calculated_width = str(root.winfo_screenwidth() // 2)
    calculated_height = str(root.winfo_screenheight() // 2)

    # SET THE SCREEN DIMENSIONS
    root.geometry(calculated_width + "x" + calculated_height)
    # SET WINDOW TITLE
    root.title("ETR")

    ttk.Label(root, text="probe").place(x=int(calculated_width) // 2, y=int(calculated_height) // 10)


    root.mainloop()
    '''
