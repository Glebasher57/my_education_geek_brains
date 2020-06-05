# 42  12        42 % 12 = 6
# 30  12
# 18  12
#  6  12        12 % 6 = 0
#  6   6


def gcd_1(a, b):
    while a != b:
        if a > b:
            a -= b
        else:
            b -= a
    return a


def gcd_2(a, b):
    if b == 0:
        return a
    return gcd_2(b, a % b)


def gcd_3(a, b):
    while b != 0:
        a, b = b, a % b
    return a


print(gcd_1(421243466, 12))
print(gcd_2(421243466, 12))
print(gcd_3(421243466, 12))

