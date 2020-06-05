# В массиве найти максимальный отрицательный элемент.
# Вывести на экран его значение и позицию в массиве.

import random
import timeit
import cProfile


def max_below_zero(size):
    # SIZE = 10
    # MIN_ITEM = -800
    # MAX_ITEM = -750
    array = [random.randint(size * -10, size * 10) for _ in range(size)]
    # print(array)

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


print(timeit.timeit('max_below_zero(10)', number=1000, globals=globals()))      # 0.014425200000000003
print(timeit.timeit('max_below_zero(100)', number=1000, globals=globals()))     # 0.137323
print(timeit.timeit('max_below_zero(1000)', number=1000, globals=globals()))    # 1.5733725
print(timeit.timeit('max_below_zero(10000)', number=1000, globals=globals()))   # 15.867839900000002

# вариант запуска timeit в командной строке
# "max_below_zero(10)"
# 1000 loops, best of 5: 13.2 usec per loop

# "max_below_zero(100)"
# 1000 loops, best of 5: 128 usec per loop

# "max_below_zero(1000)"
# 1000 loops, best of 5: 1.37 msec per loop

# "max_below_zero(10000)"
# 1000 loops, best of 5: 13.6 msec per loop


# cProfile.run('max_below_zero(10)')
#          68 function calls in 0.000 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw05_tested.py:13(<listcomp>)
#         1    0.000    0.000    0.000    0.000 hw05_tested.py:9(max_below_zero)
#        10    0.000    0.000    0.000    0.000 random.py:200(randrange)
#        10    0.000    0.000    0.000    0.000 random.py:244(randint)
#        10    0.000    0.000    0.000    0.000 random.py:250(_randbelow_with_getrandbits)
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
#        11    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#        10    0.000    0.000    0.000    0.000 {method 'bit_length' of 'int' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
#        12    0.000    0.000    0.000    0.000 {method 'getrandbits' of '_random.Random' objects}


# cProfile.run('max_below_zero(100)')
#          609 function calls in 0.000 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.000    0.000 <string>:1(<module>)
#         1    0.000    0.000    0.000    0.000 hw05_tested.py:13(<listcomp>)
#         1    0.000    0.000    0.000    0.000 hw05_tested.py:9(max_below_zero)
#       100    0.000    0.000    0.000    0.000 random.py:200(randrange)
#       100    0.000    0.000    0.000    0.000 random.py:244(randint)
#       100    0.000    0.000    0.000    0.000 random.py:250(_randbelow_with_getrandbits)
#         1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
#       101    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#       100    0.000    0.000    0.000    0.000 {method 'bit_length' of 'int' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
#       103    0.000    0.000    0.000    0.000 {method 'getrandbits' of '_random.Random' objects}


# cProfile.run('max_below_zero(1000)')
#          6633 function calls in 0.004 seconds
#
#    Ordered by: standard name
#
#    ncalls  tottime  percall  cumtime  percall filename:lineno(function)
#         1    0.000    0.000    0.004    0.004 <string>:1(<module>)
#         1    0.001    0.001    0.003    0.003 hw05_tested.py:13(<listcomp>)
#         1    0.000    0.000    0.004    0.004 hw05_tested.py:9(max_below_zero)
#      1000    0.001    0.000    0.002    0.000 random.py:200(randrange)
#      1000    0.000    0.000    0.002    0.000 random.py:244(randint)
#      1000    0.001    0.000    0.001    0.000 random.py:250(_randbelow_with_getrandbits)
#         1    0.000    0.000    0.004    0.004 {built-in method builtins.exec}
#      1001    0.000    0.000    0.000    0.000 {built-in method builtins.len}
#      1000    0.000    0.000    0.000    0.000 {method 'bit_length' of 'int' objects}
#         1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
#      1627    0.000    0.000    0.000    0.000 {method 'getrandbits' of '_random.Random' objects}

