import timeit
import cProfile
import functools

# 1. Рекурсия
# @functools.lru_cache()
def fib(n):
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)


print(timeit.timeit('fib(2)', number=100, globals=globals()))  # 5.740000000000606e-05
print(timeit.timeit('fib(4)', number=100, globals=globals()))  # 0.00013380000000000336
print(timeit.timeit('fib(8)', number=100, globals=globals()))  # 0.001329700000000003
print(timeit.timeit('fib(16)', number=100, globals=globals()))  # 0.06247710000000001

cProfile.run('fib(2)')  # 3/1    0.000    0.000    0.000    0.000 task_2.py:4(fib)
cProfile.run('fib(4)')  # 9/1    0.000    0.000    0.000    0.000 task_2.py:4(fib)
cProfile.run('fib(8)')  # 67/1    0.000    0.000    0.000    0.000 task_2.py:4(fib)
cProfile.run('fib(16)')  # 3193/1    0.001    0.000    0.001    0.001 task_2.py:4(fib)


# 2. Рекурсия + словарь = мемоизация
def fib_dict(n):
    fib_d = {0: 0, 1: 1}

    def _fib_dict(n):
        if n in fib_d:
            return fib_d[n]
        fib_d[n] = _fib_dict(n - 1) + _fib_dict(n - 2)
        return fib_d[n]

    return _fib_dict(n)


print(timeit.timeit('fib_dict(2)', number=100, globals=globals()))  # 0.00011010000000000186
print(timeit.timeit('fib_dict(4)', number=100, globals=globals()))  # 0.00018390000000000073
print(timeit.timeit('fib_dict(8)', number=100, globals=globals()))  # 0.00036660000000000165
print(timeit.timeit('fib_dict(16)', number=100, globals=globals()))  # 0.0010495000000000018
print(timeit.timeit('fib_dict(32)', number=100, globals=globals()))  # 0.0018025000000000055
print(timeit.timeit('fib_dict(64)', number=100, globals=globals()))  # 0.0040989999999999985

cProfile.run('fib_dict(2)')
#   1    0.000    0.000    0.000    0.000 task_2.py:24(fib_dict)
# 3/1    0.000    0.000    0.000    0.000 task_2.py:27(_fib_dict)
cProfile.run('fib_dict(4)')
cProfile.run('fib_dict(8)')
cProfile.run('fib_dict(16)')
#    1    0.000    0.000    0.000    0.000 task_2.py:24(fib_dict)
# 31/1    0.000    0.000    0.000    0.000 task_2.py:27(_fib_dict)


# 3. Цикл
def fib_loop(n):
    if n < 2:
        return n
    first = 0
    second = 1
    for _ in range(n):
        first, second = second, first + second
    return first


print(timeit.timeit('fib_loop(2)', number=100, globals=globals()))  # 5.1999999999996493e-05
print(timeit.timeit('fib_loop(4)', number=100, globals=globals()))  # 7.810000000000455e-05
print(timeit.timeit('fib_loop(8)', number=100, globals=globals()))  # 0.00015570000000000167
print(timeit.timeit('fib_loop(16)', number=100, globals=globals()))  # 0.00011659999999999449
print(timeit.timeit('fib_loop(32)', number=100, globals=globals()))  # 0.0002566999999999986
print(timeit.timeit('fib_loop(64)', number=100, globals=globals()))  # 0.00043340000000000045

cProfile.run('fib_loop(16)')
# 1    0.000    0.000    0.000    0.000 task_2.py:54(fib_loop)

def test_fib(func):
    lst = [0, 1, 1, 2, 3, 5, 8, 13, 21]
    for i, item in enumerate(lst):
        assert item == func(i)
        print(f'Test {i} OK')


# test_fib(fib)
# test_fib(fib_dict)
# test_fib(fib_loop)
