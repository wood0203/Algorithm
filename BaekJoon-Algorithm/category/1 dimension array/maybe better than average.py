import sys

c=int(input())
sum=0
cnt=0
for i in range(c):
    x=list(input().split())
    if int(x[0]) < 1 or int(x[0]) > 1000: sys.exit()
    for j in range(int(x[0])):
        if int(x[j+1])<0 or int(x[j+1])>100: sys.exit()
        sum+=int(x[j+1])
    avg=sum/int(x[0])
    for k in range(int(x[0])):
        if int(x[k+1])>avg: cnt+=1
    rate=(cnt/int(x[0])*100)
    print('%.3f' % rate + '%')
    cnt=0
    sum=0