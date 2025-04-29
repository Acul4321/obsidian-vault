---
date: 2025-04-26 18:04
tags:
  - computing
  - dataStructure
  - course
category: "[[data_structures]]"
---
# linked List

## Singularly Linked List
Dynamic data structure consisting of a sequence of *nodes* arranged in a linear order
- The order in a linked list is determined by a pointer in each object

Each node(*element*) of a linked list $L$ has an *key* and a pointer *next*
- Given a node *x* in the list, *x.next* points to its successor in the linked list
- if *x.next = NIL*, that element is the last element and is called the *tail* of the list.
![[SingularlyLinkedList.png]]
- *L.head* points to the first element of the list $L$, if *L.head = NIL* then the list is empty.
- *L.tail* points to the last element of the list $L$
- if `L.head && L.tail = NIL`, then the list is **empty**
### Insertion
Insertion at the head, that:
- Allocate a new node
- update two pointers

Time complexity : $O(1)$
```python title:Insertion
INSERT(L,x):
	x.next = L.head
	L.head = x
```
### Deletion
Deletion at the head, that:
 - Update *L.head*
 - Deallocate memeory of node being deleted(done by garbage collection normally)

Time Complexity : $O(1)$
```python title:Deletion
DELETE-HEAD(L):
	if( L.head != NIL ):
		L.head = L.head.next
```
### Search
Find the first element with key $k$ in list $L$ using simple linear search.
- if *found*, return a pointer to this element.
- if *not*, return NIL.
*Iterator pattern*

Time Complexity : $O(n)$
```python title:Search
SEARCH(L,k):
	x = L.head
	while( x != NIL and x.key != k ):
		x = x.next
	return x
```
### Recursion
The structure of linked lists is inherently *recursive*
- *Iterators* can be implemented by recursive algorithms

```python title:RecursionSearch
REC-SEARCH(x,k):
	if( x = NIL ):
		return x
	else if( x.key = k ):
		return x
	else:
		return REC-SEARCH(x.next,k)
```
## Doubly Linked List
Extension of singly linked list in which each node has a pointer attribute *prev*
- a node *x* in the list, *x.prev* points to the previous node in the linked list
- if x.prev = NIL, x has no predecessor and is therefore the *head* of the list

**Pro**: some operations are simplified and become more efficient#
**Con**: memory overhead
## Circular Linked List
*Boundary conditions* complicate the specification of the operations on doubly linked lists
- We can introduce *sentinels* to simplify the code
A *Sentinal* is a dummy node *L.nil* between the head and tail
- *L.nil.next* points to the *head*
- *L.nil.prev* points to the *tail*
- The *next* attribute of the *tail* and the *prev* attribute of the *head* point to *L.nil*
- Attribute *L.head* is no longer needed (use *L.nil.next* instead)
![[CircularLinkedListSentinal.png]]