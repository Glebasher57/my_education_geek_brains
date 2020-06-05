# В массиве найти максимальный отрицательный элемент.
# Вывести на экран его значение и позицию в массиве.

import random
import timeit
import cProfile


def max_below_zero(array):
    i = 0
    index = -1

    while i < len(array):
        if array[i] < 0 and index == -1:
            index = i
        elif 0 > array[i] > array[index]:
            index = i
        i += 1

    if index != -1:
        # print(f'Максимальное отрицательное число {array[index]} '
        #       f'находится в ячейке {index}')
        return f'Максимальное отрицательное число {array[index]} ' \
               f'находится в ячейке {index}'


size = 1
while size != 10000:
    size *= 10
    array = [random.randint(size * -10, size * 10) for _ in range(size)]
    print(timeit.timeit('max_below_zero(array)', number=1000, globals=globals()))

# 0.003008999999999998 - 10
# 0.027393             - 100
# 0.27870900000000004  - 1000
# 3.4331880000000004   - 10000

# python -m timeit -n 100 -s "import hw05_tested_2" "hw05_tested_2.max_below_zero(hw05_tested_2.array)"
# 100 loops, best of 5: 1.66 usec per loop    - 10
# 100 loops, best of 5: 12.7 usec per loop    - 100
# 100 loops, best of 5: 140  usec per loop    - 1000
# 100 loops, best of 5: 1.39 msec per loop    - 10000

# cProfile.run('max_below_zero(array)')
#          15 function calls in 0.000 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw05_tested_2.py:9(max_below_zero)
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
#        11    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
