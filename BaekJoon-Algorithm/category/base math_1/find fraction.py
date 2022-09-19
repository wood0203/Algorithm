import sys

x=int(input())
if 1 <= x <= 10000000: pass
else: sys.exit()

if x == 1: print(str(1)+'/'+str(1))
else:
    start=2
    end=3
    i=0
    while True:
        if x in range(start, end+1): break
        start += i+2
        end += i+3
        i += 1
    x = x - start + 1
    for j in range(x):
        if i % 2 == 0:
            result = str(j+1) + '/' + str((2+i)-j)
        else:
            result = str((2+i)-j) + '/' + str(j+1)

    print(result)