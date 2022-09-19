import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 1463번 1로 만들기
# 다이나믹 프로그래밍
# 시간제한 0.15초

x = int(input())
num_restrict(x, 1, 10**6)
d = [0 for _ in range(10**6 + 1)]
d[2] = 1
d[3] = 1

for i in range(4, 10**6 + 1):
    result1 = 10 ** 7
    result2 = 10 ** 7
    if i % 3 == 0:
        result1 = d[int(i/3)] + 1
    if i % 2 == 0:
        # elif를 써서 2번 틀림. 마지막에 min 함수를 쓰기 때문에
        # elif를 쓸 필요가 없는거 주의해야한다. 헷갈리지 말자.
        result2 = d[int(i/2)] + 1

    result = min(d[i-1] + 1, result1, result2)
    d[i] = result

print(d[x])