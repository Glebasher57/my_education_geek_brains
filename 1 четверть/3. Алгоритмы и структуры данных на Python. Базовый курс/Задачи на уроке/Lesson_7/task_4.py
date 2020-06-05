import random


def quick_sort(arr, first, last):
    print(arr[first:last+1])
    if first >= last:
        return

    pivot = arr[random.randint(first, last)]
    i = first
    j = last

    while i <= j:
        while arr[i] < pivot:
            i += 1
        while arr[j] > pivot:
            j -= 1
        if i <= j:
            arr[i], arr[j] = arr[j], arr[i]
            i += 1
            j -= 1

    quick_sort(arr, first, j)
    quick_sort(arr, i, last)


array = [5, 6, 8, 0, 4, 9, 1, 3, 2, 7]
quick_sort(array, 0, len(array) - 1)
print(array)
