---
date: 2025-04-14 18:04
tags:
  - computing
  - Algorithm
  - sortingAlgorithm
category: "[[sorting_algorithms]]"
---
# Counting Sort

A non-[[comparison_sorting|comparison based]] sorting algorithm that counts the occurrences of each value to sort an array of non-negative integers.

## How It Works

1. Find the range (max value) in the array.

2. Create a count array and count occurrences of each element.

3. Compute prefix sums to determine positions.

4. Place elements in output array based on counts.

### Example:

Sort `[4, 2, 2, 8, 3]`:

- Count: `[0,0,2,1,1,0,0,0,1]`
- Positions: `[0,0,2,3,4,...]`
- Sorted: `[2, 2, 3, 4, 8]`

## Properties 

| Property                 | Description             |
| ------------------------ | ----------------------- |
| **Stable**               | Yes                     |
| **In-place**             | No - needs extra arrays |
| **Not Comparison-Based** | Yes                     |
| **Fast for integers**    | Yes                     |

## Time and Space Complexity
 Time complexity   - `O(n + k)` where `k` is the range of input  
 Space complexity  - `O(k)`  

## When to Use
- Integers in a **small range**
- Need for linear time sort
- Stability is important

## When *Not* to Use
- Large range of numbers
- Non-integer or negative values

---
## Pseudocode

```python title:CountingSort
def counting_sort(arr):
    max_val = max(arr)
    count = [0] * (max_val + 1)
    for num in arr:
        count[num] += 1
    for i in range(1, len(count)):
        count[i] += count[i - 1]
    output = [0] * len(arr)
    for num in reversed(arr):
        output[count[num] - 1] = num
        count[num] -= 1
    return output
```