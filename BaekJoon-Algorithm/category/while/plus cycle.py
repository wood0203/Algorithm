import sys

x=int(input())
if x < 0 or x > 99: sys.exit()
a=x #26
b=-1
cnt=0
while (b!=x):
    temp=(a//10)+(a%10) #2+6=8
    b=(a%10)*10+(temp%10) #60+8=68
    a=b
    cnt+=1
print(cnt)