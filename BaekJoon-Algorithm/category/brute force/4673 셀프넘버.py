num_lst = [False]*50000
for num in range(1,10001):
    temp = num
    for x in str(num):
        temp += int(x)
    num_lst[temp] = True

for i in range(1,10001):
    if not num_lst[i]: print(i)