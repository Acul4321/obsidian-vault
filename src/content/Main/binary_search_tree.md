---
date: 2025-04-28 20:04
tags:
  - computing
  - tree
  - dataStructure
  - course
  - ADT
category: "[[data_structures]]"
---
# Binary Search Tree
a [[binary_tree]] that satisfies the *binary-search-tree property*[^1].

## Operations
### SEARCH
Search for a node with a given key in a *BST*, given a pointer to the root of the tree
#### recursive
```python title:SEARCH
def SEARCH(x,k):
	if(x = NIL or k = x.key):
		return x
	if(k < x.key):
		return SEARCH(x.left,k)
	else:
		return SEARCH(x.right,k)
```
#### iterative
```python title:SEARCH
def SEARCH(x,k):
	while(x = NIL or k = x.key):
		if(k < x.key):
			x = x.left
		else:
			x = x.right
	return x
```
### MINIMUM
Find the node with the minimum key.
```python title:MIN(x)
def MINIMUM(x):
    while x.left != NIL:
        x = x.left
    return x
```
### MAXIMUM
Find the node with the maximum key.
```python title:MAX(x)
def MAXIMUM(x):
    while x.right != NIL:
        x = x.right
    return x
```
### SUCCESSOR
Find the node with the smallest key greater than a given node.
```python title:SUCCESSOR(x)
def SUCCESSOR(x):
    if x.right != NIL:
        return MINIMUM(x.right)
    y = x.p
    while y != NIL and x == y.right:
        x = y
        y = y.p
    return y
```
### PREDECESSOR
Find the node with the largest key smaller than a given node.
```python title:PREDECESSOR(x)
def PREDECESSOR(x):
    if x.left != NIL:
        return MAXIMUM(x.left)
    y = x.p
    while y != NIL and x == y.left:
        x = y
        y = y.p
    return y
```

## Computation of Tree Parameters
### SIZE
Compute the number of nodes in the subtree rooted at `x`.
```python title:SIZE(x)
def SIZE(x):
    if x == NIL:
        return 0
    return SIZE(x.left) + SIZE(x.right) + 1
```
### HEIGHT
Compute the height of the subtree rooted at `x`.
```python title:HEIGHT(x)
def HEIGHT(x):
    if x == NIL:
        return 0
    if x.left == NIL and x.right == NIL:
        return 0
    return max(HEIGHT(x.left), HEIGHT(x.right)) + 1
```
### INSERTION
Insert a node into a BST while maintaining the BST property.
```python title:INSERT(T,z)
def INSERT(T, z):
    y = NIL
    x = T.root
    while x != NIL:
        y = x
        if z.key < x.key:
            x = x.left
        else:
            x = x.right
    z.p = y
    if y == NIL:
        T.root = z
    elif z.key < y.key:
        y.left = z
    else:
        y.right = z
```
## DELETION
Delete a node `z` from BST `T`.
### TRANSPLANT
Helper function for deletion: replaces subtree rooted at `u` with subtree rooted at `v`.
```python title:TRANSPLANT(T,u,v)
def TRANSPLANT(T, u, v):
    if u.p == NIL:
        T.root = v
    elif u == u.p.left:
        u.p.left = v
    else:
        u.p.right = v
    if v != NIL:
        v.p = u.p
```
### DELETE
Delete a node from the tree considering all cases (leaf, one child, two children).
```python title:DELETE(T,z)
def DELETE(T, z):
    if z.left == NIL:
        TRANSPLANT(T, z, z.right)
    elif z.right == NIL:
        TRANSPLANT(T, z, z.left)
    else:
        y = MINIMUM(z.right)
        if y.p != z:
            TRANSPLANT(T, y, y.right)
            y.right = z.right
            y.right.p = y
        TRANSPLANT(T, z, y)
        y.left = z.left
        y.left.p = y
```
## Limitations
- The running time of basic operations (search, insert, delete) is **O(h)** where _h_ is the height of the tree.
- If the tree becomes unbalanced (e.g., inserting sorted keys like 1,2,3,4,5), the height becomes **O(n)** instead of **O(log n)**, making operations inefficient.
- Managing many duplicate keys can cause skewed trees if not handled properly.

**Handling Duplicate Keys**:
- Storing duplicates in lists at nodes.
- Adding a `count` attribute to each node.
- Random insertion to left or right.
- Ignoring duplicates based on application needs.


[^1]: Let *x* be a node. If *y* is a node in the left subtree of *x*, then `y.key ≤ x.key`. If *y* is a node in the right subtree of *x*, then `y.key ≥ x.key`