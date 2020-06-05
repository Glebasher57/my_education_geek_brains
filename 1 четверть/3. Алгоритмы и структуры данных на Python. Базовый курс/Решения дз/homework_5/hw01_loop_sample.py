# цикл вместо дублирования 4 строчек кода
from collections import namedtuple

all_comp = []
Comp = namedtuple('Comp', 'name, p1, p2, p3, p4, total')
num = int(input('num = '))
for i in range(num):
    name = input('name = ')
    spam = []
    # p1 = input()
    # p2 = input()
    # p3 = input()
    # p4 = input()
    for j in range(1, 5):
        spam.append(int(input(f'{j} = ')))
    all_comp.append(Comp(name, *spam, sum(spam)))

print(all_comp)
