---
date: 2025-04-25 19:04
tags:
  - recursion
  - computing
category: "[[recursive_algorithms]]"
---
# recurrence equations(recurrence relations)
A **recurrence equation** expresses the overall cost or value of a function as a combination of:
- One or more **smaller subproblems** (usually recursive calls).
- Some **additional work** done at that level.
otherwise, known as calculating the time complexity

Recurrence equations help us:
- Analyze **runtime** of recursive algorithms.
- Understand **performance bottlenecks**.
- Compare different algorithmic approaches.

## Examples

| Algorithm         | Recurrence Equation       | Time Complexity |
| ----------------- | ------------------------- | --------------- |
| Binary Search     | $T(n)=T(n/2)+O(1)$        | $O(log⁡n)$      |
| Merge Sort        | $T(n)=2T(n/2)+O(n)$       | $O(nlog⁡n)$     |
| Fibonacci (naive) | $T(n)=T(n−1)+T(n−2)+O(1)$ | $O(2n)$         |
## Solving Recurrence Equations
### Iterative method
Keep expanding the recurrence step by step until you reach the base case. Then, observe a pattern and simplify.
#### Example: `T(n) = T(n-1) + c`

This could come from something like the `FACT(n)` function.

```
T(n) = T(n-1) + c
     = (T(n-2) + c) + c
     = T(n-2) + 2c
     = T(n-3) + 3c
     ...
     = T(1) + (n - 1)c
```
if $T(1) = c_{1}$, then:
$$T(n)=c1​+(n−1)c=O(n)$$
### Recursion tree method 
drawing a recursion tree(with running times), summing the cost of running all levels.
- Sometimes it can be tricky to use this method as the recursion tree can be *degenerate*
```
Level 0:           cn
Level 1:      cn/2 + cn/2 = cn
Level 2:   cn/4 + cn/4 + cn/4 + cn/4 = cn
...
log n levels → each does cn
```
$$T(n)=cn⋅logn=O(nlogn)$$
### Master theorem
If your recurrence fits a certain **divide-and-conquer** form, you can just **plug in values**.

$$T(n)=aT(n/b)+f(n)$$
- *a*: number of subproblems
- *b*: size shrink factor
- *f(n)*: extra work done outside the recursion
#### Master Theorem Cases:

Let f(n)=Θ(nc)f(n) = \Theta(n^c)f(n)=Θ(nc), compare c with log⁡ba\log_b alogb​a:

| Case | Condition     | Result               |
| ---- | ------------- | -------------------- |
| 1    | $c<log⁡_{b}a$ | $T(n)=O(n^{log⁡ba})$ |
| 2    | $c=log⁡_{b}a$ | $T(n)=O(n^clog⁡n)$   |
| 3    | $c>log⁡_{b}a$ | $T(n)=O(f(n))$       |

#### Example: Merge Sort

$$T(n)=2T(n/2)+n$$
- a=2, b=2, f(n)=n, so c=1
- $log⁡_{b}a=log⁡_{2}2=1$

Case 2 → $T(n)=O(nlog⁡n)$