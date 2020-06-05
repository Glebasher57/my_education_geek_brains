def selection_sort(arr):
    for i in range(len(arr)):
        idx_min = i
        for j in range(i + 1, len(arr)):
            if arr[j] < arr[idx_min]:
                idx_min = j
        arr[idx_min], arr[i] = arr[i], arr[idx_min]
        print(arr)


array = [5, 6, 8, 0, 4, 9, 1, 3, 2, 7]
selection_sort(array)
print(array)
