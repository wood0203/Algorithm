import sys

n=int(input())
if n<0 or n>1000 : sys.exit()
x=list(input().split())
a=[]
sum=0
for i in range(n):
    if int(x[i])<0 or int(x[i])>100 : sys.exit()
    a.append(int(x[i]))
b=max(a)
for i in range(n):
    a[i]=a[i]/b*100
    sum+=a[i]
avg=sum/n
print('%f'%avg)