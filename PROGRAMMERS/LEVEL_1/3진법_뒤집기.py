def solution(n):
    temp = ''
    while n > 0:
        n, d = divmod(n, 3)
        temp = str(d) + temp
    
    answer = 0
    for i, j in enumerate(temp):
        answer += (3**i) * int(j)
    return answer