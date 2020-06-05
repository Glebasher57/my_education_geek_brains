# """Сортировка Шелла"""
# def shell_sort(arr):
#     assert len(arr) < 4000, 'Массив слишком большой'
#
#     def new_increment(arr):
#         incs = [1, 4, 10, 23, 57, 132, 301, 701, 1750]
#         while len(arr) <= incs[-1]:
#             incs.pop()
#         while len(incs) > 0:
#             yield incs.pop()
#
#     for increment in new_increment(arr):
#         for i in range(increment, len(arr)):
#             for j in range(i, increment - 1, -increment):
#                 if arr[j - increment] <= arr[j]:
#                     break
#                 arr[j], arr[j - increment] = arr[j - increment], arr[j]

# """Быстрая сортировка"""
# import random
# def quick_sort(arr, first, last):
#     print(arr[first:last])
#     if first >= last:
#         return
#
#     pivot = arr[random.randint(first, last)]
#     i = first
#     j = last
#
#     while i <= j:
#         while arr[i] < pivot:
#             i += 1
#         while arr[j] > pivot:
#             j -= 1
#         if i <= j:
#             arr[i], arr[j] = arr[j], arr[i]
#             i += 1
#             j -= 1
#
#     quick_sort(arr, first, j)
#     quick_sort(arr, i, last)


# """Сортировка вставками"""
# def insertion_sort(arr):
#     for i in range(1, len(arr)):
#         spam = arr[i]
#         j = i
#         while arr[j - 1] > spam and j > 0:
#             arr[j] = arr[j - 1]
#             j -= 1
#         arr[j] = spam

# """Сортировка выбором"""
# def selection_sort(arr):
#     i = 0
#     while i < len(arr) - 1:
#         idx = i
#         j = i+1
#         while j < len(arr):
#             if arr[idx] > arr[j]:
#                 idx = j
#             j += 1
#         arr[i], arr[idx] = arr[idx], arr[i]
#         i += 1

# """Сортировка пузырьком"""
# i = 0
# while i < len(array):
#     for j in range(len(array) - 1):
#         if array[j] > array[j+1]:
#             array[j+1], array[j] = array[j], array[j+1]
#     i += 1
