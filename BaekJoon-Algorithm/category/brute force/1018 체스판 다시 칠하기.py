import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()


# 백준
# 브루트포스 알고리즘
# 1018번 체스판 다시 칠하기
# 시간제한 2초

n, m = map(int,input().split())
num_restrict(m,8,50) # 8 <= n <= 50
num_restrict(n,8,50) # 8 <= m <= 50
board = []
for _ in range(n):
    board.append(list(sys.stdin.readline().rstrip()))

cnt_lst = []
for a in range(n-7):
    for i in range(m-7):
        cnt1 = 0
        cnt2 = 0
        for b in range(a, a+8):
            for j in range(i, i+8):
            # j는 i의 범위에 따라야함. ex) 8*13 크기일 경우
                if (j+b) % 2 == 0:
                # 첫번째가 W 일 때, j+b가 짝수인 곳에는 전부 W여야 함.
                    if board[b][j] != 'W': cnt1 += 1
                    if board[b][j] != 'B': cnt2 += 1
                else:
                    if board[b][j] != 'B': cnt1 += 1
                    if board[b][j] != 'W': cnt2 += 1
        cnt_lst.append(cnt1)
        cnt_lst.append(cnt2)
print(min(cnt_lst))