def solution(n, arr1, arr2):
    answer = []
    for num1, num2 in zip(arr1, arr2):
        num = bin(num1 | num2)[2:]
        num = num.zfill(n)
        num = num.replace('1', '#')
        num = num.replace('0', ' ')
        answer.append(num)
    return answer
