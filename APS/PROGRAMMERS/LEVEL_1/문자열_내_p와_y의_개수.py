def solution(s):
    s = s.lower()
    temp = 0
    
    for a in s:
        if a == 'p':
            temp += 1
        elif a == 'y':
            temp -= 1
    
    if temp == 0:
        return True
    return False