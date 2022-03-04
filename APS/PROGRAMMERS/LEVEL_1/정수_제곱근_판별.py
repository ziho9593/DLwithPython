from math import sqrt

def solution(n):
    s = sqrt(n)
    
    if s - int(s) == 0:
        return (s + 1) ** 2
    else:
        return -1