Easy Problems
Problem 1:
Difficulty: easy

In the ancient land of Pyrolandia, wizards communicate using a special code based on prime numbers. The wizards have a list of spells, each associated with a unique prime number. However, some mischievous goblins have tampered with the list, and the wizards need to identify the missing primes to restore their spellbook.

Given a list of numbers, identify the missing prime numbers between the smallest and largest numbers in the list.

Input consists of an integer 'T', the number of test cases. Each test case consists of a single line with space-separated integers representing the list of numbers. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
2 <= length of list <= 100
1 <= number in list <= 1000
Sample I/O:
Example 1
mathematica
Copy code
Input:
4
2 3 5 7 11 13 17
4 6 8 9 10 12 14 15 16 18 20
1 2 4 6 9 10
23 29 31 37 41

Output:
None
3 5 7 11 13 17 19
3 5 7
None
Solution:
python
Copy code
def is_prime(n):
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

def missing_primes(numbers):
    min_num = min(numbers)
    max_num = max(numbers)
    missing = [i for i in range(min_num, max_num + 1) if is_prime(i) and i not in numbers]
    return "None" if not missing else ' '.join(map(str, missing))

def main():
    import sys
    input = sys.stdin.read
    data = input().split('\n')
    T = int(data[0])
    results = []
    for i in range(1, T + 1):
        numbers = list(map(int, data[i].split()))
        results.append(missing_primes(numbers))
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Problem 2:
Difficulty: easy

In a distant galaxy, a spaceship needs to navigate through a series of wormholes to reach its destination. Each wormhole has an energy cost associated with it. The spaceship can only move forward and needs to find the path with the minimum total energy cost.

You are given a list of energy costs for each wormhole. Find the minimum total energy cost to reach the end of the list.

Input consists of an integer 'T', the number of test cases. Each test case consists of a single line with space-separated integers representing the energy costs. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
2 <= length of list <= 100
1 <= energy cost <= 1000
Sample I/O:
Example 1
makefile
Copy code
Input:
2
1 2 3 4 5
5 4 3 2 1

Output:
15
15
Solution:
python
Copy code
def min_energy_cost(costs):
    return sum(costs)

def main():
    import sys
    input = sys.stdin.read
    data = input().split('\n')
    T = int(data[0])
    results = []
    for i in range(1, T + 1):
        costs = list(map(int, data[i].split()))
        results.append(min_energy_cost(costs))
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Problem 3:
Difficulty: easy

In the land of DataStructia, the citizens love organizing their arrays. They have a special operation called "rotate right". Given an array, rotate it to the right by k steps.

Input consists of an integer 'T', the number of test cases. Each test case consists of two lines: the first line is an integer 'k' (number of steps), and the second line is a space-separated list of integers representing the array. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
1 <= length of list <= 100
1 <= k <= 100
Sample I/O:
Example 1
makefile
Copy code
Input:
2
2
1 2 3 4 5
3
6 7 8 9 10

Output:
4 5 1 2 3
8 9 10 6 7
Solution:
python
Copy code
def rotate_right(arr, k):
    k = k % len(arr)
    return arr[-k:] + arr[:-k]

def main():
    import sys
    input = sys.stdin.read
    data = input().split('\n')
    T = int(data[0])
    index = 1
    results = []
    for _ in range(T):
        k = int(data[index])
        arr = list(map(int, data[index + 1].split()))
        results.append(rotate_right(arr, k))
        index += 2
    for result in results:
        print(' '.join(map(str, result)))

if __name__ == "__main__":
    main()
Problem 4:
Difficulty: easy

In the kingdom of Stringlandia, strings are used as currency. The citizens want to know if one string is a rotation of another. Given two strings, determine if one string is a rotation of the other.

Input consists of an integer 'T', the number of test cases. Each test case consists of two lines: the first line is the original string, and the second line is the string to check for rotation. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
1 <= length of string <= 100
Sample I/O:
Example 1
yaml
Copy code
Input:
2
hello
lohel
abcde
eabcd

Output:
Yes
Yes
Solution:
python
Copy code
def is_rotation(s1, s2):
    if len(s1) != len(s2):
        return "No"
    return "Yes" if s2 in s1 + s1 else "No"

def main():
    import sys
    input = sys.stdin.read
    data = input().split('\n')
    T = int(data[0])
    index = 1
    results = []
    for _ in range(T):
        s1 = data[index]
        s2 = data[index + 1]
        results.append(is_rotation(s1, s2))
        index += 2
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Problem 5:
Difficulty: easy

In the magical forest of Sortlandia, the creatures love sorting their treasures. Given a list of integers, sort the list in non-decreasing order.

Input consists of an integer 'T', the number of test cases. Each test case consists of a single line with space-separated integers representing the list. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
1 <= length of list <= 100
-1000 <= integer in list <= 1000
Sample I/O:
Example 1
makefile
Copy code
Input:
2
3 1 4 1 5
10 9 8 7 6

Output:
1 1 3 4 5
6 7 8 9 10
Solution:
python
Copy code
def sort_list(lst):
    return sorted(lst)

def main():
    import sys
    input = sys.stdin.read
    data = input().split('\n')
    T = int(data[0])
    results = []
    for i in range(1, T + 1):
        lst = list(map(int, data[i].split()))
        results.append(sort_list(lst))
    for result in results:
        print(' '.join(map(str, result)))

if __name__ == "__main__":
    main()
Problem 6:
Difficulty: easy

In the town of Palindromia, people believe that palindromic numbers bring good luck. Given a number, determine if it is a palindrome.

Input consists of an integer 'T', the number of test cases. Each test case consists of a single integer. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
1 <= number <= 10^9
Sample I/O:
Example 1
yaml
Copy code
Input:
2
121
123

Output:
Yes
No
Solution:
python
Copy code
def is_palindrome(n):
    s = str(n)
    return "Yes" if s == s[::-1] else "No"

def main():
    import sys
    input = sys.stdin.read
    data = input().split()
    T = int(data[0])
    results = []
    for i in range(1, T + 1):
        n = int(data[i])
        results.append(is_palindrome(n))
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Problem 7:
Difficulty: easy

In the realm of Patternia, artists are fascinated with triangular numbers. A triangular number or triangle number is a number that can form an equilateral triangle. The nth triangular number is the sum of the first n natural numbers.

Given a number, determine if it is a triangular number.

Input consists of an integer 'T', the number of test cases. Each test case consists of a single integer. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
1 <= number <= 10^9
Sample I/O:
Example 1
yaml
Copy code
Input:
2
6
10

Output:
Yes
No
Solution:
python
Copy code
import math

def is_triangular_number(n):
    if n < 1:
        return "No"
    x = (math.sqrt(8 * n + 1) - 1) / 2
    return "Yes" if x.is_integer() else "No"

def main():
    import sys
    input = sys.stdin.read
    data = input().split()
    T = int(data[0])
    results = []
    for i in range(1, T + 1):
        n = int(data[i])
        results.append(is_triangular_number(n))
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Medium Problems
Problem 1:
Difficulty: medium

In the kingdom of Graphlandia, there are several cities connected by roads. The king wants to visit every city starting from the capital city, but he wants to minimize the number of roads he travels twice. Help the king by determining the minimum number of roads he needs to travel twice to visit all cities at least once.

You are given the number of cities and the roads connecting them. The capital city is always city 1. Each road is bidirectional.

Input consists of an integer 'T', the number of test cases. Each test case starts with two integers 'N' (number of cities) and 'M' (number of roads), followed by 'M' pairs of integers representing the roads connecting the cities. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
2 <= N <= 100
1 <= M <= 200
Sample I/O:
Example 1
makefile
Copy code
Input:
2
4 4
1 2
1 3
2 4
3 4
3 3
1 2
2 3
3 1

Output:
0
1
Solution:
python
Copy code
def bfs_min_double_roads(N, edges):
    graph = [[] for _ in range(N + 1)]
    for u, v in edges:
        graph[u].append(v)
        graph[v].append(u)
    
    visited = [False] * (N + 1)
    queue = [1]
    visited[1] = True
    
    roads_travelled = 0
    while queue:
        current_city = queue.pop(0)
        for neighbor in graph[current_city]:
            if not visited[neighbor]:
                visited[neighbor] = True
                queue.append(neighbor)
            else:
                roads_travelled += 1

    return roads_travelled

def main():
    import sys
    input = sys.stdin.read
    data = input().split()
    
    index = 0
    T = int(data[index])
    index += 1
    results = []
    
    for _ in range(T):
        N = int(data[index])
        M = int(data[index + 1])
        index += 2
        edges = []
        for _ in range(M):
            u = int(data[index])
            v = int(data[index + 1])
            edges.append((u, v))
            index += 2
        results.append(bfs_min_double_roads(N, edges))
    
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Problem 2:
Difficulty: medium

In the futuristic city of Cybertown, vehicles are assigned unique identification codes which are binary strings. The mayor of Cybertown wants to ensure that all vehicles have unique codes that differ by at least k bits from each other.

Given a list of binary strings, determine if they all differ by at least k bits.

Input consists of an integer 'T', the number of test cases. Each test case starts with an integer 'k' followed by an integer 'N' (number of binary strings), followed by 'N' binary strings. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
1 <= k <= 10
2 <= N <= 100
Length of each binary string <= 100
Sample I/O:
Example 1
yaml
Copy code
Input:
2
2
3
1010
1000
1100
1
2
111
000

Output:
Yes
No
Solution:
python
Copy code
def hamming_distance(s1, s2):
    return sum(c1 != c2 for c1, c2 in zip(s1, s2))

def check_binary_strings(k, binary_strings):
    n = len(binary_strings)
    for i in range(n):
        for j in range(i + 1, n):
            if hamming_distance(binary_strings[i], binary_strings[j]) < k:
                return "No"
    return "Yes"

def main():
    import sys
    input = sys.stdin.read
    data = input().split()
    
    index = 0
    T = int(data[index])
    index += 1
    results = []
    
    for _ in range(T):
        k = int(data[index])
        N = int(data[index + 1])
        index += 2
        binary_strings = []
        for _ in range(N):
            binary_strings.append(data[index])
            index += 1
        results.append(check_binary_strings(k, binary_strings))
    
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Problem 3:
Difficulty: medium

In the enchanted forest of Algoland, there are magical fruits hanging from trees. Each fruit has a specific weight and a specific magical value. The forest guardians want to collect a subset of fruits such that the total weight does not exceed a given limit, and the total magical value is maximized.

Given a list of fruits with their weights and values, find the maximum magical value that can be collected without exceeding the weight limit.

Input consists of an integer 'T', the number of test cases. Each test case starts with an integer 'W' (weight limit) followed by an integer 'N' (number of fruits), followed by 'N' pairs of integers representing the weight and value of each fruit. Read the inputs from the standard input stream and print the results on the standard output stream.

Constraints:
1 <= W <= 100
1 <= N <= 100
1 <= weight, value <= 100
Sample I/O:
Example 1
makefile
Copy code
Input:
2
10
4
5 10
4 7
3 4
2 1
15
3
5 10
10 15
3 7

Output:
17
22
Solution:
python
Copy code
def knapsack(W, weights, values, N):
    dp = [[0 for x in range(W + 1)] for x in range(N + 1)]
    
    for i in range(N + 1):
        for w in range(W + 1):
            if i == 0 or w == 0:
                dp[i][w] = 0
            elif weights[i - 1] <= w:
                dp[i][w] = max(values[i - 1] + dp[i - 1][w - weights[i - 1]], dp[i - 1][w])
            else:
                dp[i][w] = dp[i - 1][w]
    
    return dp[N][W]

def main():
    import sys
    input = sys.stdin.read
    data = input().split()
    
    index = 0
    T = int(data[index])
    index += 1
    results = []
    
    for _ in range(T):
        W = int(data[index])
        N = int(data[index + 1])
        index += 2
        weights = []
        values = []
        for _ in range(N):
            weights.append(int(data[index]))
            values.append(int(data[index + 1]))
            index += 2
        results.append(knapsack(W, weights, values, N))
    
    for result in results:
        print(result)

if __name__ == "__main__":
    main()
Problem 4: