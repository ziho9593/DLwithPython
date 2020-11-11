def solution(arr1, arr2):
    answer = []
    for a, b in zip(arr1, arr2):
        t = []
        for x, y in zip(a, b):
            t.append(x + y)
        answer.append(t)
    return answer