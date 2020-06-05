from collections import namedtuple
from operator import attrgetter

Person = namedtuple('Person', 'name age')

p_1 = Person('Sam', 31)
p_2 = Person('John', 56)
p_3 = Person('Zed', 41)
p_4 = Person('Ezra', 66)
p_5 = Person('Clint', 90)
p_6 = Person('Sum', 41)

people = [p_1, p_2, p_3, p_4, p_5, p_6]

print(people)
a = sorted(people)
print(a)

b = sorted(people, key=attrgetter('age'), reverse=True)
print(b)

# Не рабочий пример
people = []
a = sorted(people, key=attrgetter('Отчество'))
b = sorted(a, key=attrgetter('Имя'))
c = sorted(b, key=attrgetter('Фамилия'))
print(c)
