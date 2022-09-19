l=[]

for _ in range(10):
    x=int(input())
    l.append(x % 42)

a=set(l)
print(len(a))