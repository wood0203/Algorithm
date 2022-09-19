import sys

x=int(input())
y=int(input())
if x>=1000 or x<100 or y>=1000 or y<100:
    sys.exit()

a=x*(y%10)
b=int(x*((y%100)-(y%10))/10)
c=x*(y//100)
sum=a+(b*10)+(c*100)

print(a)
print(b)
print(c)
print(sum)