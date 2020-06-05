import random

SIZE = 1_000_000
MIN_ITEM = 0
MAX_ITEM = 10_000_000
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(array)

# в рамках урока для бинарного поиска, но не для ПЗ
array.sort()
print(array)

find = int(input('Что найти: '))

pos = len(array) // 2
left = 0
right = len(array) - 1
count = 1
while array[pos] != find and left <= right:
    count += 1
    if find > array[pos]:
        left = pos + 1
        # pos = (left + right) // 2
    elif find < array[pos]:
        right = pos - 1
    pos = (left + right) // 2

print('Элемент отсутсвует' if left > right else f'Элемент в позиции {pos}')
print(f'{count=}')
