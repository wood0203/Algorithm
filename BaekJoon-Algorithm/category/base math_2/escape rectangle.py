import sys

x,y,w,h=map(int,sys.stdin.readline().split())
if (w and h in range(1,1001)) and (x in range(1,w)) and (y in range(1,h)): pass
else: sys.exit()

if x <= w/2: x_dis=x
else: x_dis=w-x
if y <= h/2: y_dis=y
else: y_dis=h-y

if x_dis >= y_dis: print(y_dis)
else: print(x_dis)