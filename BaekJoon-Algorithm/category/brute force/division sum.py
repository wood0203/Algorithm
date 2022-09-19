import sys

n = int(input())
if 1 <= n <= 1000000:
    pass
else:
    sys.exit()

min = 0
for i in range(1, n):
    temp = i
    for j in str(i):
        i += int(j)
    if i == n:
        min = temp
        break

if min:
    print(min)
else:
    print(0)