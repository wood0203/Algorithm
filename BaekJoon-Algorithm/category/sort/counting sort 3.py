import sys

n = int(input())
if 1 <= n <= 10000000: pass
else: sys.exit()

num_lst = [0] * 10001

for _ in range(n):
    num = int(sys.stdin.readline())
    if 1 <= num <= 10000: pass
    else: sys.exit()

    num_lst[num] += 1

for i in range(10001):
    if num_lst[i] != 0:
        for j in range(num_lst[i]):
            print(i)