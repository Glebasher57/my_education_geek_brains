import struct
import sys
import ctypes

a = 423
b = a
c = a

print(id(a))
print(sys.getsizeof(a))
print(ctypes.string_at(id(a), sys.getsizeof(a)))
print(struct.unpack('HHLHHh', ctypes.string_at(id(a), sys.getsizeof(a))))
print(id(int))
