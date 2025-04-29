---
date: 2025-04-27 20:04
tags:
  - dataStructure
  - computing
  - course
category: "[[data_structures]]"
---
# queue

The Queue ADT stores *arbitrary* elements
Insertions and deletions follow the *FIFO (first-in-first-out)* policy
- like a queue to a restaurant, people line up at the back and served at the front
### Main queue operations
- *ENQUEUE(Q,x)*: insert element x at the end (rear, tail) of queue *Q*
- *DEQUEUE(Q)*: remove and return the element at the front (head) of queue *Q*
### Auxiliary queue operations
- *FRONT(Q)*: return the element at the from queue *Q* without removing it
- *QUEUE-SIZE(Q)*: return the number of elements stored in queue *Q*
- *QUEUE-EMPTY(S)*: test whether no elements are stored in queue *Q*

## Implementation
### Array
A *bounded* queue can be implemented using an array in a *circular* fashion
- *wrapped-around* array: location *0*  is followed by  *n - 1* in a circular order
- implemented *wrap-around* with *modulo* operator
- `Q[Q.tail]` is kept empty 
- When `Q.head = Q.tail` the queue is *empty*

Two attributes are needed
- *Q.head* indexes the element at its head
- *Q.tail* indexes the *next* location at which a new element will be inserted into the queue

Overflows are a limitation of the array-based implementation

### resizable Array
Similar to the implementation of [[stack]]
- When enqueueing into a full queue (queue with n – 1 elements), then grow the array
- Shrink when dequeue leaves too much empty space

### Linked list  implementation
The queue ADT can be easily implemented with *linked lists with tail pointer*
- *L.head* implements *Q.head*
- L.tail implements *Q.tail*
- *ENQUEUE* is implemented by *INSERT-TAIL*
- *DEQUEUE* is implemented by *DELETE-HEAD*
