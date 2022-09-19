import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 9184번 신나는 함수 실행
# 다이나믹 프로그래밍
# 시간제한 1초

def w(a,b,c):
    if a == b == c == -1:
        sys.exit()
    
    if a <= 0 or b <= 0 or c <= 0:
        return 1
    
    if a > 20 or b > 20 or c > 20:
        return w(20, 20, 20)
    
    if d[a][b][c] != 0:
        return d[a][b][c]
    else:
        if a < b and b < c:
            result1 = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
            d[a][b][c] = result1
            return result1
        else:
            result2 = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
            d[a][b][c] = result2
            return result2

while True:
    a, b, c = map(int,sys.stdin.readline().split())
    num_restrict(a,-50,50)
    num_restrict(b,-50,50)
    num_restrict(c,-50,50)
    d = [[[0 for _ in range(21)] for _ in range(21)] for _ in range(21)]
    print('w(%d, %d, %d) = %d' %(a,b,c,w(a,b,c)))