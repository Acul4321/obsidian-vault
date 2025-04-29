---
date: 2025-04-27 21:04
tags:
  - computing
  - ADT
  - dataStructure
  - course
category: "[[data_structures]]"
---
# list
The List ADT stores a countable sequence of arbitrary elements
- Duplicates are allowed

## Main list operations
- *GET(L,i)*: return the element at index *i* in list *L*, without removing it
- *SET(L,i,x)*: replace element at index *i* in list *L* with *x* and return previous element at index *i*
- *ADD(L,x)*: insert element *x* to the end of list *L*
- *ADD-AT(L,i,x)*: insert element *x* at index *i* in list *L*, shifting all elements after this
- *REMOVE(L,i)*: remove and return element at index *i* in list *L*, shifting all elements after this
### Alternative functional interface
- *NIL()*: return the *empty* list
- *CONS(x,L)*: insert *x* at the head of *L*
- *HEAD(L)*: return the first element of *L*
- *REST(L)*: return *L* without *HEAD(L)*

## Implementations
### Resizable array
- *O(1)* indexing operations (GET and SET)
- *O(n)* ADD
- *O(n)* ADD-AT and REMOVE (fast indexing but a lot of shifting)
- *O($n0+n1$)* APPEND
### Linked list 
- *O(n)* indexing operations
- *O(1)* ADD
- *O(n)* ADD-AT and REMOVE (slow indexing but no shifting)
- *O(1)* APPEND
### Doubly linked lists 
provide efficient *right-to-left* traversal
- Use an auxiliary *stack* with implementations based on singly linked lists