def solution(s):
    answer = ''
    words = s.split(' ')
    for w in words:
        for i, a in enumerate(w):
            if i % 2 == 0:
                answer += a.upper()
            else:
                answer += a.lower()
        answer += ' '
    return answer[:-1]