# Найти сумму и произведение цифр введённого пользователем трехзначного числа

num = input('Введите трёхзначное число: ')

# решение через долнительные переменные
num = int(num)
a = num // 100
b = num % 100 // 10
c = num % 10
summary = a + b + c
# mult = a * b * c
print(f'Сумма = {summary}')
print(f'Произведение = {a * b * c}')

# решение через цикл для темы урока 2
num = str(num)
summary = 0
mult = 1
for i in num:
    summary += int(i)
    mult *= int(i)
print(f'Сумма = {summary}')
print(f'Произведение = {mult}')

