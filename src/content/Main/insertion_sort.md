---
date: 2025-04-14 16:04
tags:
  - computing
  - Algorithm
  - sortingAlgorithm
category: "[[sorting_algorithms]]"
---
# Insertion Sort

A simple [[comparison_sorting|comparison based]] sorting algorithm that builds the final sorted array one item at a time.
## How It Works

1. Start from the second element (index 1) and compare it to the elements before it.

2. Shift larger elements one position to the right to make room.

3. Insert the current element into its correct position.

4. Repeat for all elements.
### Example:

Sort `[5, 3, 4, 1]` step by step:

- Step 1: `[3, 5, 4, 1]` (insert 3 before 5)

- Step 2: `[3, 4, 5, 1]` (insert 4 between 3 and 5)

- Step 3: `[1, 3, 4, 5]` (insert 1 at the beginning)

## Properties 

| Property        | Description                                      |
| --------------- | ------------------------------------------------ |
| **Stable**      | Yes - equal elements remain in original order    |
| **In-place**    | Yes - only uses a constant amount of extra space |
| **Incremental** | Yes - iteratively incorporating new elements     |
## Time and Space Complexity
 Time complexity   - `O(n²)`
 space Complexity - `O(1)` 

## When to Use
- Small datasets
- Nearly sorted arrays
- When stability is important
- Teaching or learning sorting basics

## When *Not* to Use
- Large datasets (too slow)
- When high performance is critical

---
## Pseudocode

```python title:InsertionSort
for i from 1 to length(A) - 1:
    key = A[i]
    j = i - 1
    while j >= 0 and A[j] > key:
        A[j + 1] = A[j]
        j = j - 1
    A[j + 1] = key
    ```