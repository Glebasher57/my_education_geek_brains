a = float(input('Введи первое число: '))
b = float(input('Введи второе число: '))
c = float(input('Введи третье число: '))

m = a
if m < b:
    m = b
if m < c:
    m = c

print(f'{m=}')
