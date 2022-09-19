import sys

def hansu():
    x=int(input())
    if x<0 or x>1000: sys.exit()
    if x < 100: return x
    else:
        i = 100
        cnt=0
        while(i<=x):
            a = i // 100
            c = i % 10
            b = (i % 100 - c)//10
            if (a-b) == (b-c): cnt+=1
            i+=1
        return cnt+99

c=hansu()
print(c)