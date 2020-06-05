# Пользователь вводит две буквы. Определить их порядковый номер в алфавите и рассчитать число букв между ними

first = ord(input('1-я буква: '))
second = ord(input('2-я буква (не такая, как первая): '))
first = first - ord('a') + 1
second = second - ord('a') + 1
print(f'Порядковый номер 1-й буквы = {first}, 2-й = {second}')
print(f'Число букв между введёнными: {abs(first - second) - 1}')

# длинный способ и как облегчить себе жизнь )))
list_1 = ['a', 'b', 'c', '...']
list_1 = 'abcde..xyz'

import string

a = string.ascii_lowercase
print(a)

