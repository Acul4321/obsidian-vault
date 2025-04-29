---
date: 2025-04-27 16:04
tags:
  - computing
  - dataStructure
  - "#ADT"
category: "[[data_structures]]"
---
# stack
The Stack ADT stores *arbitrary* elements
Insertions and deletions follow the *LIFO* **(last-in-first-out)** policy
- like a stack of plates, adding on the top and removing from the top
### Main stack operations
- *PUSH(S,x)*: insert element x in stack *S*
- *POP(S)*: remove and return the most recently inserted element from stack *S*
### Auxiliary stack operations
- *PEEK(S)*: return the most recently inserted element from stack *S* (also called *TOP(S)*)
- *STACK-SIZE(S)*: return the number of elements stored in stack *S*
- *STACK-EMPTY(S)*: test whether no elements are stored in stack *S*

## Implementation
### bounded array
The simplest way to implement a *bounded* stack
- *Add* elements from *left to right*
- An attribute **S.top** keeps track of the index of the top element
- Array $S[0..n-1]$ implements a stack of at most n elements
	- $S[0]$ is the element at the bottom of the stack
	- $S[S.top]$ is the element at the top
#### Operations
stack add/remove elements from the right end of the array and update *S.top*
- When `S.top = -1` the stack is *empty*
The array storing the stack elements may become full/empty
- If we *push* into a *full stack*, the stack **overflows**
- If we try to *pop* an *empty stack*, the stack **underflows**

### Unbounded array
Same as the implementation with normal arrays but the size of the underlying array can *grow* or *shrink*
- no overflows
- Memory requirement is $O(cs)$ where *c* is a constant and *s* is the number of elements in the stack
#### Simple Implementation
- *Double* the underlying array when it is *full*
- *Half* the underlying array when it is *one-quarter full* (c=4)
Expanding the array by a *constant* proportion ensures that inserting *n* elements takes $O(n)$ time overall
- Each insertion takes **amortized**[^1] constant time


[^1]: amortized - Analysis technique in which the *average of running times* is considered