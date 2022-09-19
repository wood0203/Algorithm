import sys

n = input().split('-')
print(n)

num_lst = []
for i in n:
    i = i.split('+')
    num = 0
    for j in i:
        num += int(j)
    num_lst.append(num)

result = num_lst[0]
for i in range(1,len(num_lst)):
    result -= num_lst[i]
print(result)