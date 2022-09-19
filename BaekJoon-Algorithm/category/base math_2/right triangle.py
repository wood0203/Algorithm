import sys

while True:
    a, b, c = map(int, sys.stdin.readline().split())
    if 0 < (a and b and c) <= 30000: pass
    else: sys.exit()

    t = [a,b,c]
    c = max(t)
    t.remove(max(t))
    if t[0] ** 2 + t[1] ** 2 == c ** 2:
        print('right')
    else:
        print('wrong')