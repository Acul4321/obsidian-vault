---
date: 2025-04-14 16:04
tags:
  - computing
  - Algorithm
  - sortingAlgorithm
category: "[[sorting_algorithms]]"
---
# Merge Sort

A divide-and-conquer [[comparison_sorting|comparison based]] sorting algorithm that splits the array into halves, recursively sorts them, and then merges the sorted halves.

## How It Works

1. Divide the unsorted array into two halves.

2. Recursively sort each half using merge sort.

3. Merge the two sorted halves into a single sorted array.

### Example:

Sort `[5, 3, 4, 1]` step by step:

- Split into `[5, 3]` and `[4, 1]`
- Split further: `[5] [3]` and `[4] [1]`
- Sort and merge: `[3, 5]` and `[1, 4]`
- Final merge: `[1, 3, 4, 5]`

## Properties 

| Property        | Description                                      |
| --------------- | ------------------------------------------------ |
| **Stable**      | Yes - equal elements remain in original order    |
| **In-place**    | No - requires additional memory for merging      |
| **Divide & Conquer** | Yes - recursively splits and merges         |
| **Parallelizable** | Yes - can run merge operations in parallel    |

## Time and Space Complexity
 Time complexity   - `O(n log n)`  
 Space complexity  - `O(n)` (due to auxiliary arrays used during merge)

## When to Use
- Large datasets
- When guaranteed performance is required
- When stability is important
- For external sorting (e.g. sorting data from disk)

## When *Not* to Use
- When space is limited
- For small arrays (simpler algorithms like insertion sort may be faster)

---
## Pseudocode

```python title:MergeSort
def merge_sort(arr):
    if len(arr) <= 1:
        return arr
    mid = len(arr) // 2
    left = merge_sort(arr[:mid])
    right = merge_sort(arr[mid:])
    return merge(left, right)

def merge(left, right):
    result = []
    i = j = 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    result.extend(left[i:])
    result.extend(right[j:])
    return result
```