n=input()
n=list(n)
cnt=0
i=0

while i <= (len(n) - 1):
    if i == len(n)-1:
        i+=1
    elif n[i]=='c' and n[i+1]=='=':
        i=i+2
    elif n[i]=='c' and n[i+1]=='-':
        i = i+2
    elif i < len(n)-2 and n[i]=='d' and n[i+1]=='z':
        if n[i+2] == '=': i+=3
        else:
            i+=2
            cnt+=1
    elif n[i] == 'd' and n[i + 1] == '-':
        i = i+2
    elif n[i] == 'l' and n[i + 1] == 'j':
        i = i+2
    elif n[i] == 'n' and n[i + 1] == 'j':
        i = i+2
    elif n[i] == 's' and n[i + 1] == '=':
        i = i+2
    elif n[i] == 'z' and n[i + 1] == '=':
        i = i+2
    else: i+=1
    cnt+=1

print(cnt)