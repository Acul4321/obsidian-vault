---
date: 2025-04-29 02:04
tags:
  - dataStructure
  - computing
  - tree
  - ADT
  - course
category: "[[data_structures#Self-balancing Trees]]"
---
# AVL Tree
An AVL tree is a [[binary_search_tree]] that is height balanced: for each node x, the heights of the left and right subtrees of *x* differ by at most *1*
- To implement an AVL tree, we maintain an extra attribute in each node: 
	- *x.h* is the height of node *x*
- *T.root* points to the root node
![[AVLTree.png]]
## Comparison
AVL trees are more rigidly balanced than [[red-black_tree]]
- `h ≤ 2 log (n + 1)` in [[red-black_tree]]
- `h ≤ 1.44 log n` in [[AVL_tree]]

AVL trees provide faster lookups than red-black tree
- Used in databases
- Used in real-time applications and the current Linux kernel scheduler
- Used in most libraries to implement common [[data_structures#ADT(abstract data types)|ADT's]] such as [[sets]], Multiset, and Map