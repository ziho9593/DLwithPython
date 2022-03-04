def solution(left, right):
    result = []
    for n in range(left, right+1):
        m = []
        for i in range(1, n+1):
            if n % i == 0:
                m.append(i)
        if len(set(m)) % 2 == 0:
            result.append(n)
        else:
            result.append(-n)
    return sum(result)
