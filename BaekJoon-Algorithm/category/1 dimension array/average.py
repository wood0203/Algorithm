import sys
n=list(input())
if len(n) < 2 or len(n) > 15: sys.exit()
i=0
t=0

while i <= len(n)-1:
    x=ord(n[i])
    if ord('A')<=x<=ord('C'):
        t+=3
    elif ord('D')<=x<=ord('F'):
        t+=4
    elif ord('G')<=x<=ord('I'):
        t+=5
    elif ord('J')<=x<=ord('L'):
        t+=6
    elif ord('M')<=x<=ord('O'):
        t+=7
    elif ord('P')<=x<=ord('S'):
        t+=8
    elif ord('T')<=x<=ord('V'):
        t+=9
    elif ord('W')<=x<=ord('Z'):
        t+=10
    else: pass
    i+=1

print(t)