def solution(s, n):
    answer = ''
    for a in s:
        if a == ' ':
            answer += ' '
            continue
        
        if ord(a) <= ord('Z'):
            o = ord(a) + n
            if o <= ord('Z'):
                answer += chr(o)
            else:
                answer += chr(o - 26)
        else:
            o = ord(a) + n
            if o <= ord('z'):
                answer += chr(o)
            else:
                answer += chr(o - 26)
        
    return answer