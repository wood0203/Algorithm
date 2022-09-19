import sys

n=int(input())
if n > 100: sys.exit()
i=0
stopper=0
cnt=0

while i < n:
    string = input()
    x=list(string)
    j=0
    stopper = 0
    while j < len(x):
        if x.count(x[j]) > 1:
            a=x.index(x[j])
            b=x.count(x[j])
            if string[a:a+b] != x[j]*b:
                stopper=1
                break
            else:
                j+=b-1
        j+=1
    if stopper != 1: cnt+=1
    i+=1

print(cnt)