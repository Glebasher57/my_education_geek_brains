# Посчитать четные и нечетные цифры введенного натурального числа.
# Например, если введено число 34560, то у него 3 четные цифры (4, 6 и 0) и 2 нечетные (3 и 5).
import sys

# вариант 1 - на "Не зачёт"
num = int(input('Введите целое число: '))
even, odd = 0, 0

while num > 0:
    if num % 2 == 0:
        even += 1
    else:
        odd += 1
    num = num // 10

print(f"четных - {even}, нечетных - {odd}")
print(sys.getsizeof(num))
print(sys.getsizeof(even))
print(sys.getsizeof(odd))

# вариант 2 - На "Зачёт"
sum_ = 0
num = int(input('Введите целое число: '))
sum_ += sys.getsizeof(num)
even, odd = 0, 0

while num > 0:
    if num % 2 == 0:
        even += 1
    else:
        odd += 1
    num = num // 10

sum_ += sys.getsizeof(even)
sum_ += sys.getsizeof(odd)
print(f"четных - {even}, нечетных - {odd}")
print(sum_)

"""Пример того как неверно некоторые оцениваю размер коллекции"""
print('*' * 50)
my_list = [i for i in range(50)]
my_matrix = [[i for i in range(1000)] for _ in range(5)]
print(f'Список хранит 50 значений - {sys.getsizeof(my_list)}')
print(f'Матрица хранит 5000 значений - {sys.getsizeof(my_matrix)}')
"""Продолжение в следующем файле"""

