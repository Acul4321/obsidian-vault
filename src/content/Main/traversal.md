---
date: 2025-04-28 19:04
tags:
  - computing
  - tree
category: "[[data_structures]]"
---
# traversal
Traversals of any trees(i.e. [[binary_tree]]) also known as a *walk*, is the process of visiting each node of the tree, exactly once.

## Types of traversals
### Inorder traversal
calling `INORDER(T.root)`, prints all elements.
```python title:INORDER
def INDORDER(x):
	if( x != NIL ):
		INORDER(T.left)
		print(x.key)
		INORDER(T.right)
```
#### Analysis
**Theorem**: If *x* is the root of a binary tree with *n* nodes, then *INORDER(x)* takes *Θ(n)* time
**proof**: we need to prove
1. T(n) = Ω(n)
2. T(n) = O(n)

using the [[recurrence_equations#Iterative method|iterative method]], we get;
 -  $T(0) = O(1)$ ,base case to test `x != NIL` 
 - $T(n) = T(k) + T(n-k-1) + O(1)$
	 - $=T(0) + T(n-1) + O(1)$
	 - $= O(1) + T(n-1) + O(1)$
	 - $= T(n-1) + O(1)$
Therefore, $T(n) = O(n)$
### preorder traversal
calling `PREORDER(T.root)`, prints all elements.
```python title:PREORDER
def PREDORDER(x):
	if( x != NIL ):
		print(x.key)
		PREORDER(T.left)
		PREORDER(T.right)
```
### postorder traversal
calling `POSTORDER(T.root)`, prints all elements.
```python title:POSTORDER
def POSTDORDER(x):
	if( x != NIL ):
		POSTORDER(T.left)
		POSTORDER(T.right)
		print(x.key)
```