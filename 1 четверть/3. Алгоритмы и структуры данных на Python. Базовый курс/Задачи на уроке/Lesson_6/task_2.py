import sys

a = 'Hello world!'
b = a
c = 'Hello world!'
del b
print(id(a))
print(sys.getsizeof(a))
print(sys.getrefcount(a))

d = 4245545643565465
print(sys.getsizeof(d))

e = 425432523523345325.03542532535
print(sys.getsizeof(e))
print(e)


def my_show(object):
    print(f'type={type(object)}, size={sys.getsizeof(object)}, object={object}')
    if hasattr(object, '__iter__'):
        if hasattr(object, 'items'):
            for key, value in object.items():
                my_show(key)
                my_show(value)
        elif not isinstance(object, str):
            for item in object:
                my_show(item)


lst = [i for i in range(10)]
my_show(lst)

tpl = tuple(lst)
my_show(tpl)

dct = {i: str(i) for i in range(10)}
my_show(dct)

st = {i for i in range(10)}
my_show(st)
my_show(frozenset(st))

