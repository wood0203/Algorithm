import sys

a, b = input().split()
if int(a) > 10000 or int(b) > 10000: sys.exit()

print(int(a) + int(b))
print(int(a) - int(b))
print(int(a) * int(b))
print(int(a) // int(b))
print(int(a) % int(b))