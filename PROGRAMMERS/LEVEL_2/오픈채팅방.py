def solution(record):
    answer = []
    dic = {}
    
    for r in record:
        log = r.split()
        
        log_type = log[0]
        uid = log[1]
        
        if log_type != 'Leave':
            dic[uid] = log[2]
    
    
    for r in record:
        log = r.split()
        
        log_type = log[0]
        uid = log[1]
        
        msg = '님이 들어왔'
        if log_type == 'Leave':
            msg = '님이 나갔'
        
        if log_type != 'Change':
            answer.append(dic[uid] + msg + '습니다.')
            
    return answer