---
date: 2025-04-14 16:04
tags:
  - computing
  - Algorithm
  - sortingAlgorithm
category: "[[sorting_algorithms]]"
---
# Heap Sort

A [[comparison_sorting|comparison based]] sorting algorithm that uses a binary heap data structure to sort elements.

## How It Works

1. Build a **max heap** from the input data.

2. Swap the root (maximum) with the last element.

3. Reduce the heap size and **heapify** the root.

4. Repeat until the heap size is 1.

### Example:

Sort `[5, 3, 4, 1]`:
- Build max heap → `[5, 3, 4, 1]`
- Swap `5` and `1` → `[1, 3, 4, 5]`
- Heapify and repeat → `[1, 3, 4, 5]` becomes sorted

## Properties 

| Property        | Description                                      |
| --------------- | ------------------------------------------------ |
| **Stable**      | No - may change order of equal elements          |
| **In-place**    | Yes - uses constant extra space                  |
| **Not Adaptive**| No - does not perform better on sorted data      |

## Time and Space Complexity
 Time complexity   - `O(n log n)` (in all cases)  
 Space complexity  - `O(1)`  

## When to Use
- Need guaranteed `O(n log n)` time
- Limited memory (in-place)
- No need for stable sort

## When *Not* to Use
- When stability is required
- Slower in practice than Quick Sort and Merge Sort

---
## Pseudocode

```python title:HeapSort
def heapify(arr, n, i):
    largest = i
    l = 2*i + 1
    r = 2*i + 2
    if l < n and arr[l] > arr[largest]:
        largest = l
    if r < n and arr[r] > arr[largest]:
        largest = r
    if largest != i:
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify(arr, n, largest)

def heap_sort(arr):
    n = len(arr)
    for i in range(n//2 - 1, -1, -1):
        heapify(arr, n, i)
    for i in range(n - 1, 0, -1):
        arr[0], arr[i] = arr[i], arr[0]
        heapify(arr, i, 0)
```