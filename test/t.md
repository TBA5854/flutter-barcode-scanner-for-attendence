Hard Questions
sql
Copy code
#### Problem:

Difficulty: hard

You are tasked with building a secure vault system that uses a combination of characters and numbers as a key. The vault key should be generated by alternating characters from a given word and digits from a given number.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a string 'word' and an integer 'number'.

#### Constraints:

- The length of 'word' and the number of digits in 'number' are equal.
- The word contains only lowercase alphabets.
- The number is a non-negative integer.

#### Sample I/O:

- Example 1
Input: apple 12345
Output: a1p2p3l4e5

<!-- diff -->
<!-- Copy code -->

- Example 2
Input: code 6789
Output: c6o7d8e9

<!-- css -->
<!-- Copy code -->

#### Solution:

```python
def generate_vault_key(word, number):
    return ''.join(w + n for w, n in zip(word, str(number)))

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        word, number = input().split()
        print(generate_vault_key(word, number))
```
<!-- yaml -->
<!-- Copy code -->

---

Problem:

Difficulty: hard

In an ancient text, there are hidden messages that can only be revealed by rotating a given string to the right by a specified number of positions.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a string 'message' and an integer 'k'.

Constraints:
1 <= length of 'message' <= 1000
0 <= k < 1000

Sample I/O:
Example 1
makefile
Copy code
Input: hello 2
Output: lohel
Example 2
makefile
Copy code
Input: world 1
Output: dworl
Solution:

```python
Copy code
def rotate_string(message, k):
    k = k % len(message)
    return message[-k:] + message[:-k]

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        message, k = input().split()
        k = int(k)
        print(rotate_string(message, k))
yaml
Copy code

---

Problem:
Difficulty: hard

Given a large matrix, you need to find the maximum sum of any submatrix within the given matrix.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains the size of the matrix 'N' followed by 'N' lines of integers.

Constraints:
1 <= N <= 100
Matrix elements are integers within the range [-100, 100]
Sample I/O:
Example 1
makefile
Copy code
Input: 2
2
1 -2
3 4
Output: 7
Example 2
diff
Copy code
Input: 3
3
-1 -1 -1
-1 2 2
-1 2 2
Output: 8
Solution:
python
Copy code
def max_submatrix_sum(matrix, N):
    max_sum = -float('inf')
    for i in range(N):
        for j in range(i, N):
            submatrix_sum = [0] * N
            for k in range(N):
                submatrix_sum[k] = sum(matrix[k][i:j+1])
            max_sum = max(max_sum, max_subarray_sum(submatrix_sum))
    return max_sum

def max_subarray_sum(arr):
    max_ending_here = max_so_far = arr[0]
    for x in arr[1:]:
        max_ending_here = max(x, max_ending_here + x)
        max_so_far = max(max_so_far, max_ending_here)
    return max_so_far

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        N = int(input())
        matrix = [list(map(int, input().split())) for _ in range(N)]
        print(max_submatrix_sum(matrix, N))
yaml
Copy code

---

Problem:
Difficulty: hard

You are given a string representing a mathematical expression containing only non-negative integers and the operators '+', '-', '*', '/'. Write a program to evaluate this expression.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a string 'expression'.

Constraints:
The expression is valid and does not contain any spaces.
Division is integer division.
Sample I/O:
Example 1
makefile
Copy code
Input: 3+5*2-8/4
Output: 10
Example 2
makefile
Copy code
Input: 10+2*6/3-4
Output: 8
Solution:
python
Copy code
def evaluate_expression(expression):
    def helper(s, i):
        operands, operators = [], []
        num = 0
        while i < len(s):
            if s[i].isdigit():
                num = num * 10 + int(s[i])
            if s[i] in "+-*/" or i == len(s) - 1:
                if i == len(s) - 1:
                    i += 1
                operands.append(num)
                num = 0
                while operators and precedence(operators[-1]) >= precedence(s[i]):
                    process(operands, operators.pop())
                operators.append(s[i])
            i += 1
        while operators:
            process(operands, operators.pop())
        return operands[0]

    def precedence(op):
        if op in '+-':
            return 1
        if op in '*/':
            return 2
        return 0

    def process(operands, op):
        b, a = operands.pop(), operands.pop()
        if op == '+':
            operands.append(a + b)
        elif op == '-':
            operands.append(a - b)
        elif op == '*':
            operands.append(a * b)
        elif op == '/':
            operands.append(a // b)

    return helper(expression, 0)

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        expression = input().strip()
        print(evaluate_expression(expression))
yaml
Copy code

---

Problem:
Difficulty: hard

You are given a list of dates in the format YYYY-MM-DD. Write a function to find the number of days between the earliest and latest date in the list.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a list of dates.

Constraints:
Each date is valid and follows the format YYYY-MM-DD.
1 <= length of list <= 100
Sample I/O:
Example 1
yaml
Copy code
Input: 2020-01-01 2020-01-10 2020-01-05
Output: 9
Example 2
yaml
Copy code
Input: 2021-05-15 2021-05-20 2021-05-18
Output: 5
Solution:
python
Copy code
from datetime import datetime

def days_between_dates(dates):
    date_format = "%Y-%m-%d"
    dates = [datetime.strptime(date, date_format) for date in dates]
    return (max(dates) - min(dates)).days

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        dates = input().strip().split()
        print(days_between_dates(dates))
yaml
Copy code

---

Problem:
Difficulty: hard

You are given a large string of characters and you need to find the length of the longest substring without repeating characters.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a string 's'.

Constraints:
1 <= length of 's' <= 1000
Sample I/O:
Example 1
makefile
Copy code
Input: abcabcbb
Output: 3
Example 2
makefile
Copy code
Input: bbbbb
Output: 1
Solution:
python
Copy code
def length_of_longest_substring(s):
    char_map = {}
    left = 0
    max_length = 0
    for right in range(len(s)):
        if s[right] in char_map:
            left = max(left, char_map[s[right]] + 1)
        char_map[s[right]] = right
        max_length = max(max_length, right - left + 1)
    return max_length

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        s = input().strip()
        print(length_of_longest_substring(s))
yaml
Copy code

---

Problem:
Difficulty: hard

Given a list of integers, write a function to find the longest increasing subsequence.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a list of integers.

Constraints:
1 <= length of list <= 1000
List contains integers within the range [-1000, 1000]
Sample I/O:
Example 1
makefile
Copy code
Input: 10 9 2 5 3 7 101 18
Output: 4
Example 2
makefile
Copy code
Input: 0 1 0 3 2 3
Output: 4
Solution:
python
Copy code
def length_of_lis(nums):
    if not nums:
        return 0
    lis = [1] * len(nums)
    for i in range(1, len(nums)):
        for j in range(i):
            if nums[i] > nums[j]:
                lis[i] = max(lis[i], lis[j] + 1)
    return max(lis)

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        nums = list(map(int, input().strip().split()))
        print(length_of_lis(nums))
yaml
Copy code

---

#### Medium Questions

---

Problem:
Difficulty: medium

You are given a list of integers. Write a function to find the second largest number in the list.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a list of integers.

Constraints:
2 <= length of list <= 100
List contains integers within the range [-1000, 1000]
Sample I/O:
Example 1
makefile
Copy code
Input: 3 1 4 1 5 9 2 6 5 3 5
Output: 6
Example 2
makefile
Copy code
Input: 1 2
Output: 1
Solution:
python
Copy code
def second_largest(nums):
    first, second = -float('inf'), -float('inf')
    for num in nums:
        if num > first:
            first, second = num, first
        elif first > num > second:
            second = num
    return second

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        nums = list(map(int, input().strip().split()))
        print(second_largest(nums))
yaml
Copy code

---

Problem:
Difficulty: medium

Given a string, write a function to determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a string 's'.

Constraints:
1 <= length of 's' <= 1000
Sample I/O:
Example 1
yaml
Copy code
Input: A man, a plan, a canal: Panama
Output: True
Example 2
vbnet
Copy code
Input: race a car
Output: False
Solution:
python
Copy code
def is_palindrome(s):
    s = ''.join(char.lower() for char in s if char.isalnum())
    return s == s[::-1]

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        s = input().strip()
        print(is_palindrome(s))
yaml
Copy code

---

Problem:
Difficulty: medium

You are given a list of integers. Write a function to find all unique triplets in the list which gives the sum of zero.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a list of integers.

Constraints:
1 <= length of list <= 100
List contains integers within the range [-1000, 1000]
Sample I/O:
Example 1
lua
Copy code
Input: -1 0 1 2 -1 -4
Output: [[-1, -1, 2], [-1, 0, 1]]
Example 2
lua
Copy code
Input: 0 0 0 0
Output: [[0, 0, 0]]
Solution:
python
Copy code
def three_sum(nums):
    nums.sort()
    res = []
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i - 1]:
            continue
        left, right = i + 1, len(nums) - 1
        while left < right:
            total = nums[i] + nums[left] + nums[right]
            if total == 0:
                res.append([nums[i], nums[left], nums[right]])
                while left < right and nums[left] == nums[left + 1]:
                    left += 1
                while left < right and nums[right] == nums[right - 1]:
                    right -= 1
                left += 1
                right -= 1
            elif total < 0:
                left += 1
            else:
                right -= 1
    return res

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        nums = list(map(int, input().strip().split()))
        print(three_sum(nums))
yaml
Copy code

---

Problem:
Difficulty: medium

Given an integer array, return the largest subarray sum.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a list of integers.

Constraints:
1 <= length of list <= 100
List contains integers within the range [-1000, 1000]
Sample I/O:
Example 1
makefile
Copy code
Input: -2 1 -3 4 -1 2 1 -5 4
Output: 6
Example 2
makefile
Copy code
Input: 1 2 3 4 -10
Output: 10
Solution:
python
Copy code
def max_subarray_sum(nums):
    max_ending_here = max_so_far = nums[0]
    for num in nums[1:]:
        max_ending_here = max(num, max_ending_here + num)
        max_so_far = max(max_so_far, max_ending_here)
    return max_so_far

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        nums = list(map(int, input().strip().split()))
        print(max_subarray_sum(nums))
yaml
Copy code

---

Problem:
Difficulty: medium

You are given an integer array sorted in ascending order. Write a function to determine if a given target is in the array.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a list of integers and a target integer.

Constraints:
1 <= length of list <= 100
List contains integers within the range [-1000, 1000]
Sample I/O:
Example 1
vbnet
Copy code
Input: [-1, 0, 3, 5, 9, 12] 9
Output: True
Example 2
vbnet
Copy code
Input: [-1, 0, 3, 5, 9, 12] 2
Output: False
Solution:
python
Copy code
def binary_search(nums, target):
    left, right = 0, len(nums) - 1
    while left <= right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return True
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return False

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        nums = list(map(int, input().strip().split()[:-1]))
        target = int(input().strip().split()[-1])
        print(binary_search(nums, target))
yaml
Copy code

---

Problem:
Difficulty: medium

Given an array of integers, find the number of unique pairs that sum up to a given target.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a list of integers and a target integer.

Constraints:
1 <= length of list <= 100
List contains integers within the range [-1000, 1000]
Sample I/O:
Example 1
makefile
Copy code
Input: 1 1 2 45 46 46 47 48 50 100 5
Output: 2
Example 2
makefile
Copy code
Input: 1 1 1 1 2 2 2 2 3 3 3 3 5
Output: 2
Solution:
python
Copy code
def unique_pairs(nums, target):
    seen = set()
    pairs = set()
    for num in nums:
        complement = target - num
        if complement in seen:
            pairs.add((min(num, complement), max(num, complement)))
        seen.add(num)
    return len(pairs)

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        nums = list(map(int, input().strip().split()[:-1]))
        target = int(input().strip().split()[-1])
        print(unique_pairs(nums, target))
yaml
Copy code

---

Problem:
Difficulty: medium

You are given a string of lowercase alphabets. Write a function to return the character that appears the maximum number of times. If there are multiple characters with the same maximum count, return the lexicographically smallest one.

Input consists of an integer 'T' which is the number of testcases. Each testcase contains a string 's'.

Constraints:
1 <= length of 's' <= 1000
Sample I/O:
Example 1
makefile
Copy code
Input: abbccc
Output: c
Example 2
makefile
Copy code
Input: abcabc
Output: a
Solution:
python
Copy code
from collections import Counter

def max_char(s):
    count = Counter(s)
    max_count = max(count.values())
    return min([char for char in count if count[char] == max_count])

if _name_ == "_main_":
    T = int(input())
    for _ in range(T):
        s = input().strip()
        print(max_char(s))
yaml
Copy code

---

This format follows your template, wrapping each problem inside a separate text box for easy copying.