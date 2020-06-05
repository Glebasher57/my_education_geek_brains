from collections import Counter

a = Counter()
b = Counter('arbakadabra')
c = Counter({'red': 10, 'green': 15})
print(a, b, c, sep='\n')

print(b['z'])
b['z'] = 3
print(b)

print(b.most_common(3))

print('*' * 50)
x = Counter(a=3, b=-2, c=1)
y = Counter(a=2, b=4, c=-2)
print(x, y, sep='\n')
print(x + y)
print(x - y)
print(x & y)
print(x | y)
