---
date: 2025-04-14 16:04
tags:
  - computing
  - Algorithm
  - sortingAlgorithm
category: "[[sorting_algorithms]]"
---
# Quick  Sort

A fast, divide-and-conquer [[comparison_sorting|comparison based]] sorting algorithm that selects a pivot and partitions the array into elements less than and greater than the pivot.

## How It Works

1. Pick a **pivot** element from the array.

2. Partition the array into two parts:
   - Elements less than the pivot
   - Elements greater than or equal to the pivot

3. Recursively apply Quick Sort to both parts.

### Example:

Sort `[5, 3, 4, 1]`:

- Choose pivot `3`, partition: `[1] [3] [5, 4]`
- Recurse on `[1]` and `[5, 4]`
- Sort `[5, 4]`: pivot `4` → `[4] [5]`
- Result: `[1, 3, 4, 5]`

## Properties 

| Property        | Description                                        |
| --------------- | -------------------------------------------------- |
| **Stable**      | No - equal elements may be reordered               |
| **In-place**    | Yes - uses constant additional space               |
| **Divide & Conquer** | Yes                                          |
| **Fast in Practice** | Yes - often faster than Merge Sort on average |

## Time and Space Complexity
 Time complexity  
- Best & Average Case: `O(n log n)`  
- Worst Case: `O(n²)` (for an Unbalanced partitioning from bad pivot)
 Space complexity - `O(log n)` (for recursion stack)

## When to Use
- Large datasets
- When average-case speed is important
- Space is a concern (less memory than Merge Sort)

## When *Not* to Use
- Need for a stable sort
- Very small or nearly sorted arrays (use Insertion Sort instead)

---
## Pseudocode

```python title:QuickSort
def quick_sort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[0]
    less = [x for x in arr[1:] if x < pivot]
    greater_equal = [x for x in arr[1:] if x >= pivot]
    return quick_sort(less) + [pivot] + quick_sort(greater_equal)
```