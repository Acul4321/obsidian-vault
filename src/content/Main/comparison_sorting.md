---
date: 2025-04-14 17:04
tags:
  - Algorithm
  - computing
category: "[[sorting_algorithms]]"
---
# Comparison Sorting
*meaning that*: The sorted order is determined only by comparing the input elements

They can be studied abstractly using the **decision tree model**.

## Decision tree model
A **decision tree** is a [[binary_tree|full binary tree]] that represents the comparisons between elements that are performed by a sorting algorithm operating on an input of a given size.

A **binary tree** where:
- Each **node** represents a comparison.
- Each **leaf** represents a possible permutation (final sorted order).

To compute a **lower bound** on the height of the decision tree,Recall the following facts:
- A binary tree of height **h** has at most **$2^h$** leaves
- $n^{\frac{n}{2}}$ $n!$  $n^n$

**Specifically for [[sorting_algorithms]] the lower bound = $O(n \log n)$**
**An Sorting algorithm Achieves Lower Bound if the time complexity is $O(n \log n)$ or lower**