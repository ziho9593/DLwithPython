def solution(s):
    temp = []
    for a in s:
        temp.append(ord(a))
    temp.sort(reverse=True)
    
    answer = ''
    for b in temp:
        answer += chr(b)
        
    return answer