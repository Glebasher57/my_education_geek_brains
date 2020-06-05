n = 1000

sieve = [i for i in range(n)]   # квадратные скобки (массив) в рамках алгоритма, но не для использования в ПЗ
print(sieve)
sieve[1] = 0

for i in range(2, n):
    if sieve[i] != 0:
        j = i + i
        while j < n:
            sieve[j] = 0
            j += i

print(sieve)
res = [i for i in sieve if i != 0]
print(res)
