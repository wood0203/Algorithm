import sys

x1, y1 = map(int,input().split())
x2, y2 = map(int,input().split())
x3, y3 = map(int,input().split())
if 1 <= (x1 and x2 and x3 and y1 and y2 and y3) <= 1000: pass
else: sys.exit()

if x1 == x2:           # y좌표 차이가 세로 길이
    h = abs(y1 - y2)
    x4 = x3
elif x1 == x3:
    h = abs(y1 - y3)
    x4 = x2
else:
    h = abs(x2 - x3)
    x4 = x1

if y1 == y2:           # x좌표 차이가 가로 길이
    h = abs(y1 - y2)
    y4 = y3
elif y1 == y3:
    h = abs(y1 - y3)
    y4 = y2
else:
    h = abs(y2 - y3)
    y4 = y1

print(x4, y4)