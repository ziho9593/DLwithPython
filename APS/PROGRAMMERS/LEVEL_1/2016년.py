def solution(a, b):
    month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    day = ['THU', 'FRI', 'SAT', 'SUN', 'MON', 'TUE', 'WED']
    today = b
    
    for i in range(a-1):
            today += month[i]
    
    answer = day[today % 7]
    
    return answer