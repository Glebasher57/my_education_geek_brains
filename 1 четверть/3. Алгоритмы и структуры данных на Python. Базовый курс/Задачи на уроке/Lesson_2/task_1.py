def func(a, b):
    """
    func(1, 4)
    '1, 2, 3, 4'
    func(8, 8)
    '8'
    """
    if a == b:
        return f'{a}'
    if a < b:
        return f'{a}, {func(a + 1, b)}'
    if a > b:
        return f'{a}, {func(a - 1, b)}'


print(func(1, 4))
print(func(5, 1))

