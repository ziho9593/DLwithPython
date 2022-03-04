def sol(nums):
    if len(nums) <= 2:
        return [sum(nums)]
    
    temp = []
    for n in nums[1:]:
        temp.append(nums[0] + n)
        
    return temp + sol(nums[1:])


def solution(numbers):
    answer = list(set(sol(numbers)))
    answer.sort()
    
    return answer