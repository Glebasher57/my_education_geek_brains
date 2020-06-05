import sys

sys.setrecursionlimit(3000)


def akk(m, n):
    if m == 0:
        return n + 1
    elif m > 0 and n == 0:
        return akk(m - 1, 1)
    return akk(m - 1, akk(m, n - 1))


x = int(input('Введи целое не отрицаиельное число: '))
y = int(input('Введи целое не отрицаиельное число: '))
z = akk(x, y)
print(z)
