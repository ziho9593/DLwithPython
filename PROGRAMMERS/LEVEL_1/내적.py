def solution(a, b):
    answer = []
    for x, y in zip(a, b):
        answer.append(x * y)
    return sum(answer)