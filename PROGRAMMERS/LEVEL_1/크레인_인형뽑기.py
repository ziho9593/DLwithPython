def solution(board, moves):
    answer = 0
    temp = []
    
    for m in moves:
        for i in range(len(board)):
            if board[i][m-1] != 0:
                temp.append(board[i][m-1])
                board[i][m-1] = 0
                if len(temp) >= 2 and temp[-1] == temp[-2]:
                    answer += 2
                    del temp[-2:]             
                break
                
    return answer