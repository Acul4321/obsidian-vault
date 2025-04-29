---
date: 2025-04-29 03:04
tags:
  - tree
  - ADT
  - computing
  - course
  - dataStructure
category: "[[data_structures]]"
---
# B-tree
A **B-tree** is a self-balancing search tree designed for systems that read and write large blocks of data. 
It generalizes binary search trees by allowing nodes to have more than two children, and is optimized for minimizing disk I/O operations.
- It maintains sorted data.
- Supports efficient insertions, deletions, and searches.
- Each node can have multiple keys and multiple children.
## Motivation
B-trees were introduced primarily to reduce the number of disk accesses:
- **Binary search trees** can become too tall and unbalanced, leading to many disk reads.
- **B-trees** minimize tree height by allowing nodes to have **many children** (high branching factor), significantly reducing the number of disk operations needed to find a key.
- They are ideal for **databases** and **file systems** where data access speed is crucial.
## Properties
A B-tree of order `m` (maximum number of children per node) satisfies:

1. **Every node has at most `m` children.**
2. **Every internal node (except root) has at least `⌈m/2⌉` children.**
3. **The root has at least two children if it is not a leaf.**
4. **All leaves appear at the same depth** (tree is balanced).
5. **Each node contains `k` keys** where `⌈m/2⌉-1 ≤ k ≤ m-1`.
6. **Keys within a node are ordered**; children subtrees separate keys according to their values.

> **Note**: When a node is full (i.e., has `m-1` keys), it must be **split** during insertion.
## Operations
### SEARCH
we search by doing a *multiway decision* according to the number of children of the node
Top level call is` SEARCH(T.root,k)`
```python title:SEARCH
def SEARCH(x, k):
    i = 0
    while i < x.n and k > x.key[i]:
        i += 1
    if i < x.n and k == x.key[i]:
        return (x, i)
    elif x.leaf:
        return NIL
    else:
        DISK-READ(x.c[i])
        return SEARCH(x.c[i], k)
```
#### Analysis
- Let:
    - `n` = total number of keys,
    - `t` = minimum degree of the B-tree.
- **Disk accesses**: `O(logₜ n)` (disk read at each level).
- **CPU time**: `O(t logₜ n)`, because:
    - The `while` loop at each node scans up to `2t - 1` keys, costing `O(t)` time.
- **Efficiency**: B-trees reduce the number of slow disk reads dramatically compared to binary trees.
### CREATE
Creating an empty B-tree
- Requires `O(1)` disk operations
- `O(1)` CPU time
```python title:Create(T)
def CREATE(T):
	x = ALLOCATE-NODE() 
	x.leaf = TRUE 
	x.n = 0 
	DISK-WRITE(x) 
	T.root = x
```
### INSERT
- Insertions find the correct **leaf position** for the new key.
- If a node is **full**, it is **split** before insertion to maintain B-tree properties.
- **Splitting** may propagate up to the root, increasing tree height by one.
#### SPLIT-CHILD
- **Splits** a full child `y` of node `x` at index `i`.
- Moves `y`'s median key up into `x` and creates a new right child `z`.
	- **CPU Time**: `O(t)`
	- **Disk Writes**: `O(1)`
```python title:SPLIT-CHILD
def SPLIT-CHILD(x, i):
    z = ALLOCATE-NODE()
    y = x.c[i]
    z.leaf = y.leaf
    z.n = t - 1
    for j in range(t-1):
        z.key[j] = y.key[j+t]
    if not y.leaf:
        for j in range(t):
            z.c[j] = y.c[j+t]
    y.n = t - 1
    for j in range(x.n, i, -1):
        x.c[j+1] = x.c[j]
    x.c[i+1] = z
    for j in range(x.n-1, i-1, -1):
        x.key[j+1] = x.key[j]
    x.key[i] = y.key[t-1]
    x.n += 1
    DISK-WRITE(x), DISK-WRITE(y), DISK-WRITE(z)
```
#### INSERT-NONFULL
- **Inserts** a key `k` into a nonfull node `x`.
- If the child is full, split it before descending.
```python title:INSERT-NONFULL(x,k)
def INSERT-NONFULL(x, k):
    i = x.n - 1
    if x.leaf:
        while i >= 0 and k < x.key[i]:
            x.key[i+1] = x.key[i]
            i -= 1
        x.key[i+1] = k
        x.n += 1
        DISK-WRITE(x)
    else:
        while i >= 0 and k < x.key[i]:
            i -= 1
        i += 1
        DISK-READ(x.c[i])
        if x.c[i].n == 2*t - 1:
            SPLIT-CHILD(x, i)
            if k > x.key[i]:
                i += 1
        INSERT-NONFULL(x.c[i], k)
```
#### INSERT
**Top-level** insertion into the B-tree `T`.
```python title:INSERT(T,k)
def INSERT(T, k):
    r = T.root
    if r.n == 2*t - 1:
        s = ALLOCATE-NODE()
        T.root = s
        s.leaf = False
        s.n = 0
        s.c[0] = r
        SPLIT-CHILD(s, 0)
        INSERT-NONFULL(s, k)
    else:
        INSERT-NONFULL(r, k)
```
- **If root is full**, split it and create a new root.
- **Otherwise**, directly insert into the nonfull root.

#### Insertion Summary

| Aspect            | Detail                               |
| :---------------- | :----------------------------------- |
| **Disk Accesses** | `O(logₜ n)`                          |
| **CPU Time**      | `O(t logₜ n)`                        |
| **Splitting**     | Only way tree height increases       |
| **Strategy**      | One-pass: split nodes during descent |
## Variants
There are several B-tree variants optimized for different use-cases:
- **2-3-4 Trees**:
	- every internal node has either two or three children
	- can have up to 4 children
- **B+ Trees**:
    - Internal nodes only store keys (no data).
    - All data stored in leaves.
    - Leaves linked sequentially for fast range queries.
- **B* Trees**:
    - Variation of B-trees with better space utilization (~2/3 full).
    - Redistributes keys between nodes before splitting.

---

## Applications
B-trees (especially B+ trees) are used in many real-world systems:
- **Databases**: indexing large datasets (e.g., PostgreSQL, MySQL).
- **File systems**: directory storage (e.g., NTFS, HFS+, EXT4).
- **Operating systems**: page replacement and virtual memory management.
- **Storage engines**: optimizing reads and writes for large secondary storage.
