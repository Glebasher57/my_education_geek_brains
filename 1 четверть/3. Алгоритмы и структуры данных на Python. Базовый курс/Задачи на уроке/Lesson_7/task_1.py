array = [5, 6, 8, 0, 4, 9, 1, 3, 2, 7]

n = 1
while n < len(array):
    for i in range(len(array) - 1):
        if array[i] > array[i + 1]:
            array[i], array[i + 1] = array[i + 1], array[i]
    n += 1
    print(array)

print(array)
