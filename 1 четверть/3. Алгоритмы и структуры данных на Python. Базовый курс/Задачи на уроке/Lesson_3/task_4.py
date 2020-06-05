import random

SIZE_A = 4
SIZE_B = 7
MIN_ITEM = 0
MAX_ITEM = 1000
matrix = [[random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE_B)] for _ in range(SIZE_A)]
print(*matrix, sep='\n')

sum_column = [0] * len(matrix[0])
print(sum_column)
print('*' * 50)

for line in matrix:
    sum_line = 0
    for i, item in enumerate(line):
        sum_line += item
        sum_column[i] += item
        print(f'{item:>6}', end='')
    print(f'{sum_line:>6}')

for item in sum_column:
    print(f'{item:>6}', end='')
