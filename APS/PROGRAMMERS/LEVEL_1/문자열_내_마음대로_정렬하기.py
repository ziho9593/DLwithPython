def solution(strings, n):
    strings.sort(key=lambda x: (x[n], x[:n], x[n+1:]))
    return strings