import sys

n = int(input())
if 2 <= n <= 50: pass
else: sys.exit()

dungchi = []
for i in range(n):
    x, y = map(int, sys.stdin.readline().split())
    if 10 <= x <= 200 and 10 <= y <= 200: pass
    else: sys.exit()

    data = [x,y]
    dungchi.append(data)

rank=[1 for i in range(len(dungchi))]
for i in range(len(dungchi)):
    for j in range(len(dungchi)):
        if dungchi[i][0] < dungchi[j][0] and dungchi[i][1] < dungchi[j][1]:
            rank[i] += 1

for w in range(len(dungchi)):
    print(rank[w], end=' ')