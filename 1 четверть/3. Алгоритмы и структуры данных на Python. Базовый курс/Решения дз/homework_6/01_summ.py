# Найти сумму и произведение цифр введённого пользователем трехзначного числа
import sum_memory


num = input('Введите трёхзначное число: ')

# решение через долнительные переменные
num = int(num)
a = num // 100
b = num % 100 // 10
c = num % 10
summ = a + b + c
print(f'Сумма = {summ}')
print(f'Произведение = {a * b * c}')

sum_mem = sum_memory.SumMemory()
sum_mem.extend(num, a, b, c, summ)
print(sum_mem)

# решение через цикл
num = str(num)
summa = 0
mult = 1
for i in num:
    summa += int(i)
    mult *= int(i)
print(f'Сумма = {summa}')
print(f'Произведение = {mult}')

sum_mem = sum_memory.SumMemory()
sum_mem.extend(num, summa, mult, i)
print(sum_mem)


"""Реальные затраты памяти под коллекцию"""
print('*' * 50)
my_list = [i for i in range(50)]
sum_mem = sum_memory.SumMemory()
sum_mem.extend(my_list)
print(f'Список хранит 50 значений - {sum_mem}')
my_matrix = [[i for i in range(1000)] for _ in range(5)]
sum_mem = sum_memory.SumMemory()
sum_mem.extend(my_matrix)
print(f'Матрица хранит 5000 значений - {sum_mem}')

