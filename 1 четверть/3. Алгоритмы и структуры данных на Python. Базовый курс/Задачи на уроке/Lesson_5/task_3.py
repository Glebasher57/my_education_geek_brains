from collections import defaultdict

a = defaultdict()
print(a)

text = 'klgndkjbnejvndsakjbv sakjkveajeevovnoewivnfjknvekvnkjdvnzlkvndslkzvsdjk'
# b = dict()
b = defaultdict(int)
for char in text:
    b[char] += 1
print(b)

lst = [('cat', 1), ('dog', 5), ('cat', 4), ('dog', 2), ('dog', 4), ('cat', 2), ('dog', 7)]
c = defaultdict(list)
for animal, distance in lst:
    c[animal].append(distance)
print(c)
