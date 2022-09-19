import sys

x=int(input())
for i in range(x):
    h,w,n=map(int,sys.stdin.readline().split())
    if h < 1 or w > 99 or n > h * w: sys.exit()
    hotel=[[0 for _ in range(h)] for _ in range(w)]

    a = n // h
    b = n % h
    i=0
    j=0
    if a==0:
        while i < b:
            hotel[0][i]=1
            i+=1
        room_num=1
        floor=b+1

    elif b==0:
        for x in range(a):
            for y in range(h):
                hotel[x][y]=1
        room_num=a
        floor=h

    else:
        for x in range(a):
            for y in range(h):
                hotel[x][y]=1
        while i < b:
            hotel[a][i]=1
            i+=1
        room_num=a+1
        floor=i-1

    if room_num <= 9: room_num = str(0)+str(room_num)
    else: room_num = str(room_num)

    print(str(floor)+room_num)