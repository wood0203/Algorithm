# 백준
# 카테고리별 문제 - 정렬
# 1181번 단어 정렬
# 북마크
import sys


def word_restrict(x,a,b):
    if len(x) < a or len(x) > b:
        sys.exit()
    if x not in words:
        words.append(word)
    # if x[:len(x)-1] not in words:
    #     words.append(word[:len(word)-1])
    #    '\n'을 제거시켜줌. 근데 '\n'가 하나의 단어로 취급된다?


def num_restrict(x,a,b):
    if x<a or x>b:
        sys.exit()


n = int(input())
num_restrict(n,1,20000)
words = []
for _ in range(n):
    word = sys.stdin.readline().strip()
    # 개행문자 '\n'을 .strip()으로 없애줌.
    word_restrict(word, 1, 50)

words = sorted(words)
words = sorted(words, key = lambda x: len(x))
for word in words:
    print(word)