def solution(new_id):
    answer = ''
    new_id = new_id.lower()
    
    for id in new_id:
        if id in ['-', '_', '.'] or id.isalpha() or id.isdigit():
            if len(answer) > 0 and id == '.' and answer[-1] == '.':
                continue
            answer += id
            
    answer = answer.strip('.')

    if answer == '':
        answer = 'a'
    
    if len(answer) >= 16:
        answer = answer[:15]
    answer = answer.rstrip('.')
    
    if len(answer) <= 2:
        for _ in range(3 - len(answer)):
            answer += answer[-1]

    return answer
