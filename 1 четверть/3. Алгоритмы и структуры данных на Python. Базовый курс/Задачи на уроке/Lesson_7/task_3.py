def insertion_sort(arr):
    for i in range(1, len(arr)):
        spam = arr[i]
        j = i
        while arr[j - 1] > spam and j > 0:
            arr[j] = arr[j - 1]
            j -= 1
        arr[j] = spam
        print(arr)


array = [5, 6, 8, 0, 4, 9, 1, 3, 2, 7]
insertion_sort(array)
print(array)
