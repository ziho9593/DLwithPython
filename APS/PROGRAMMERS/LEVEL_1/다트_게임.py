# 나의 풀이 : 테스트 케이스 통과, 채점 32개 중 2개 실패
def solution(dartResult):
    num_list = []
    
    for i in range(len(dartResult)):
        if dartResult[i].isdigit() == True:
            if dartResult[i] == '0' and dartResult[i-1] == '1':
                num_list[-1] *= 10
            else:
                num_list.append(int(dartResult[i]))
        
        elif dartResult[i].isalpha() == True:
            if dartResult[i] == 'D':
                num_list[-1] **= 2
            elif dartResult[i] == 'T':
                num_list[-1] **= 3
        
        elif dartResult[i] == '*':
            if len(num_list) == 1:
                num_list[0] *= 2
            else:
                num_list[-2:] *= 2
        
        elif dartResult[i] == '#':
            num_list[-1] *= -1
        
        answer = sum(num_list)
        
    return answer





# 다른 사람의 풀이 1. (리스트와 인덱스를 사용)
def solution(dartResult):
    point = []
    answer = []
    dartResult = dartResult.replace('10','k')
    point = ['10' if i == 'k' else i for i in dartResult]

    i = -1
    sdt = ['S', 'D', 'T']
    for j in point:
        if j in sdt :
            answer[i] **= (sdt.index(j)+1)
        elif j == '*':
            answer[i] *= 2
            if i != 0 :
                answer[i - 1] *= 2
        elif j == '#':
            answer[i] *= -1
        else:
            answer.append(int(j))
            i += 1
            
    return sum(answer)





# 다른 사람의 풀이 2. (정규표현식 사용)
import re

def solution(dartResult):
    bonus = {'S' : 1, 'D' : 2, 'T' : 3}
    option = {'' : 1, '*' : 2, '#' : -1}
    p = re.compile('(\d+)([SDT])([*#]?)')
    dart = p.findall(dartResult)
    
    for i in range(len(dart)):
        if dart[i][2] == '*' and i > 0:
            dart[i-1] *= 2
        dart[i] = int(dart[i][0]) ** bonus[dart[i][1]] * option[dart[i][2]]

    answer = sum(dart)
    
    return answer