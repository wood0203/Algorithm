import sys

n = int(input())
if 1 <= n <= 10000: pass
else: sys.exit()

num_list = []
i = 666
while len(num_list) < n:
    if '666' in str(i):
        num_list.append(i)
    i +=1

print(num_list[n-1])