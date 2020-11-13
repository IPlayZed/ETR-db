from random import choices, randint, seed
from string import ascii_letters, digits
import mysql.connector
from mysql.connector import errorcode as mysql_errorcode
from names import get_first_name, get_last_name
from faker import Faker
import tkinter
from tkinter import ttk


# Returns an alphanumerical string with the length of <length:int>
def generator_get_random_alphanumeric_str(length):
    return ''.join(choices(ascii_letters + digits, k=length))


def generator_get_random_alphanumeric_str_list(str_len, list_len):
    generated_list = []
    index = 0
    while index < list_len:
        item = generator_get_random_alphanumeric_str(6)
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
    targy_targykod_list = generator_get_random_address_list(records_num)
    targy_ajanlott_felev_list = generator_get_random_int_list(records_num, 1, 7)
    targy_nev_list = generator_get_random_alphanumeric_str_list(10, records_num)

    # create data for hallgato
    hallgato_etr_id_list = generator_get_random_alphanumeric_str_list(6, records_num)
    hallgato_lakhely_list = generator_get_random_address_list(records_num)
    hallgato_tagozat_forma_list = generator_get_random_binary_choice_list(records_num, "normál", "levelező")
    hallgato_koltsegteritesi_forma_list = generator_get_random_binary_choice_list(records_num, "állami", "önköltséges")
    hallgato_vezeteknev_list = generator_get_random_name_list(records_num, False)
    hallgato_keresztnev_list = generator_get_random_name_list(records_num)
    hallato_titulus_list = generator_get_random_binary_choice_list(records_num, None, "Dr.")

    for i in range(records_num):
        # fill table oktato
        if oktato_titulus_list[i] is None:
            insertable = (
                oktato_etr_id_list[i], oktato_vezeteknev_list[i], oktato_keresztnev_list[i], oktato_beosztas_list[i])
            cursor.execute(
                "INSERT INTO oktato (oktato_etr_id, vezeteknev, keresztnev, beosztas) VALUES (%s, %s, %s, %s)",
                insertable)
        else:
            insertable = (
                oktato_etr_id_list[i], oktato_vezeteknev_list[i], oktato_keresztnev_list[i], oktato_titulus_list[i],
                oktato_beosztas_list[i])
            cursor.execute(
                "INSERT INTO oktato (oktato_etr_id, vezeteknev, keresztnev, titulus, beosztas) VALUES (%s, %s, %s, %s, %s)",
                insertable)

        # fill table terem
        insertable = (terem_teremszam_list[i], terem_ferohely_list[i], terem_cim_list[i])
        cursor.execute("INSERT INTO terem (teremszam, ferohely, cim) VALUES (%s, %s, %s)", insertable)

        # fill table targy
        insertable = (targy_targykod_list[i], targy_ajanlott_felev_list[i], targy_nev_list[i])
        cursor.execute("INSERT INTO targy (targykod, ajanlott_felev, nev) VALUES (%s, %s, %s)", insertable)

        # fill table
        if hallato_titulus_list[i] is None:
            insertable = (hallgato_etr_id_list[i], hallgato_lakhely_list[i], hallgato_tagozat_forma_list[i],
                          hallgato_koltsegteritesi_forma_list[i], hallgato_vezeteknev_list[i],
                          hallgato_keresztnev_list[i])
            cursor.execute(
                "INSERT INTO hallgato (hallgato_etr_id, lakhely, tagozat_forma, koltsegteritesi_forma, vezeteknev, keresztnev) VALUES (%s, %s, %s, %s, %s, %s)",
                insertable)
        else:
            insertable = (hallgato_etr_id_list[i], hallgato_lakhely_list[i], hallgato_tagozat_forma_list[i],
                          hallgato_koltsegteritesi_forma_list[i], hallgato_vezeteknev_list[i],
                          hallgato_keresztnev_list[i], hallato_titulus_list[i])
            cursor.execute(
                "INSERT INTO hallgato (hallgato_etr_id, lakhely, tagozat_forma, koltsegteritesi_forma, vezeteknev, keresztnev, titulus) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                insertable)

    cursor.close()


if __name__ == '__main__':
    # print(mysql_query(mysql_query_select("oktato")))
    debug_mysql_fill_dummy_data(50)

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
