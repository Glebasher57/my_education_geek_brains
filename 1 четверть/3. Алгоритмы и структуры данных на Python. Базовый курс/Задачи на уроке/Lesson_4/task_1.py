import timeit
import cProfile

a = [i for i in range(100)]

print(timeit.timeit('a = [i for i in range(10)]', number=100))
print(timeit.timeit('a = [i for i in range(100)]', number=100))
print(timeit.timeit('a = [i for i in range(1000)]', number=100))
print(timeit.timeit('a = [i for i in range(10000)]', number=100))


def func(N):
    for i in range(N):
        for j in range(N):
            for k in range(N):
                a = 42


print('*' * 50)
# print(timeit.timeit('func(1)', number=1000, globals=globals()))
# print(timeit.timeit('func(10)', number=1000, globals=globals()))
# print(timeit.timeit('func(100)', number=1000, globals=globals()))
# print(timeit.timeit('func(1000)', number=1000, globals=globals()))


def get_len(lst):
    return len(lst)

def get_sum(lst):
    sum_ = 0
    for item in lst:
        sum_ += item
    return sum_

def main(n):
    array = [i for i in range(n)]
    len_ = get_len(array)
    sum_ = get_sum(array)
    sum_ = get_sum(array)

cProfile.run('main(100000)')
