def solution(x):
    s = 0
    for n in str(x):
        s += int(n)
    
    if x % s == 0:
        return True
    return False