import sys

x=int(input())
y=int(input())
if x < -1000 or x > 1000 or x==0 or y < -1000 or y > 1000 or y==0:
    sys.exit()

if x>0 and y>0:
    print(1)
elif x>0 and y<0:
    print(4)
elif x<0 and y>0:
    print(2)
else:
    print(3)