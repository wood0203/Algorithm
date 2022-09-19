import sys

def restrict_num(x, lst):                   # 범위 여부 확인
    if abs(x) <= 1000:
        return x
    else: sys.exit()


n = int(input())
if 1 <= n <= 1000: pass
else: sys.exit()

num_lst = []
x = int(input())
num_lst.append(restrict_num(x, num_lst))

for _ in range(n - 1):
    x = int(input())
    x = restrict_num(x, num_lst)
    if x not in num_lst: pass               # 중복일때 다시 받음.
    else: continue

    temp = 0
    for i in range(len(num_lst)):
        if x > num_lst[i]:
            temp += 1
    num_lst.insert(temp, x)

sorted_lst = sorted(num_lst)                # 파이썬 라이브러리 함수를 활용한 정렬여부 검증
if num_lst == sorted_lst:
    for i in range(len(num_lst)):
        print(num_lst[i])