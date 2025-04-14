---
date: 2025-04-14 18:04
tags:
  - computing
  - Algorithm
  - sortingAlgorithm
category: "[[sorting_algorithms]]"
---
# Radix Sort

A  non-[[comparison_sorting|comparison based]] sorting algorithm that sorts integers digit by digit from the least significant to the most significant.

## How It Works

1. Start with the least significant digit.

2. Use a **stable** sorting algorithm (e.g., Counting Sort) to sort by that digit.

3. Repeat for all digits (moving left).

### Example:

Sort `[170, 45, 75, 90, 802, 24, 2, 66]`:
- Sort by units → `[170, 90, 802, 2, 24, 45, 75, 66]`
- Sort by tens → `[802, 2, 24, 45, 66, 170, 75, 90]`
- Sort by hundreds → `[2, 24, 45, 66, 75, 90, 170, 802]`

## Properties 

| Property        | Description                                     |
| --------------- | ----------------------------------------------- |
| **Stable**      | Yes - uses stable sort at each digit            |
| **In-place**    | No - needs extra space for buckets              |
| **Not Comparison-Based** | Yes                                    |
| **Efficient for Integers** | Yes, especially large numbers        |

## Time and Space Complexity
 Time complexity   - `O(nk)` where `k` is number of digits  
 Space complexity  - `O(n + k)`  

## When to Use
- Large number of integers
- When all values are non-negative integers
- When stability is important

## When *Not* to Use
- Floating point or negative numbers
- When memory usage is a concern

---
## Pseudocode

```python title:RadixSort
def counting_sort_exp(arr, exp):
    n = len(arr)
    output = [0] * n
    count = [0] * 10
    for i in range(n):
        index = (arr[i] // exp) % 10
        count[index] += 1
    for i in range(1, 10):
        count[i] += count[i - 1]
    for i in range(n - 1, -1, -1):
        index = (arr[i] // exp) % 10
        output[count[index] - 1] = arr[i]
        count[index] -= 1
    for i in range(n):
        arr[i] = output[i]

def radix_sort(arr):
    max_val = max(arr)
    exp = 1
    while max_val // exp > 0:
        counting_sort_exp(arr, exp)
        exp *= 10
    ```