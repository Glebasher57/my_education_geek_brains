a = float(input('Введи первое число: '))
b = float(input('Введи второе число: '))
c = float(input('Введи третье число: '))

if a > b:
    if a > c:
        print(f'max = {a}')
    else:
        print(f'max = {c}')
else:
    if b > c:
        print(f'max = {b}')
    else:
        print(f'max = {c}')
