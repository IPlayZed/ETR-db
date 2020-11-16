from random import choices, seed, randint
from string import ascii_letters, digits

from faker import Faker
from names import get_first_name, get_last_name

from etr.main import ___DEBUG_MODE___


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
