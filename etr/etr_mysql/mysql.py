import mysql.connector
from mysql.connector import errorcode as mysql_errorcode

from etr.etr_generators.generators import generator_concatenate_sql_params, generator_get_random_alphanumeric_str_list, \
    generator_get_random_name_list, generator_get_random_binary_choice_list, generator_get_random_int_list, \
    generator_get_random_address_list
from etr.main import ___DEBUG_MODE___


def mysql_query(query, user_arg='root', password_arg='', host_arg='localhost', database_arg='etrdb'):
    try:
        clx = mysql.connector.connect(user=user_arg, password=password_arg, host=host_arg,
                                      database=database_arg)
        cursor = clx.cursor()
        cursor.execute(query)
        returnable = cursor.fetchall()
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
            print("ERROR:Other error")
            return -3


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
    base_str += generator_concatenate_sql_params(str_list=values)
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
