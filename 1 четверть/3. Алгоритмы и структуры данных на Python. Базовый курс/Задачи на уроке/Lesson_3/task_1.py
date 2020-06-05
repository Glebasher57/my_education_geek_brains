a = [1, 2, 3]
b = a
a = a + [4, 5]
print(a, b, sep='\n')

a = [1, 2, 3]
b = a
a += [4, 5]   # a.extend([4, 5])
print(a, b, sep='\n')

# 2.
print('*' * 50)
row = ['_'] * 3
print(row)
board = [row] * 3
print(board)
board[1][2] = 'x'
print(board)

board = [['_'] * 3 for _ in range(3)]
print(board)
board[1][2] = 'x'
print(board)

# 3.
s = {1, 2}
lst = [4, 5]
d_1 = {frozenset(s): lst}
print(d_1)
d_2 = {tuple(lst): s}
lst.append(3)
print(d_2)
print(lst)

