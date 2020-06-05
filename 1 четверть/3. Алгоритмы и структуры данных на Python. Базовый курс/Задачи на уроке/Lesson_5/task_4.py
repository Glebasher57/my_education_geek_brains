from collections import deque

a = deque()
b = deque('abrakadabra')
print(a, b, sep='\n')

c = deque([1, 2, 3, 4], maxlen=5)
print(c)
c.append(5)
print(c)
c.appendleft(6)
print(c)
c.extend([7, 8])
print(c)
c.extendleft([9, 10])
print(c)
spam = c.pop()
print(spam)
print(c)
eggs = c.popleft()
print(eggs)
print(c)

print(c[2])

d = [1, 2, 3, 4, 5]
print(d)
print(d[::-1])

c.reverse()
print(c)


