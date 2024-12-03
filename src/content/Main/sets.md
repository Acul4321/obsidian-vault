---
date: 2024-11-03 16:11
tags:
  - mathmatics
  - sets
category: "[[Propositional_Logic]]"
---
# sets
A set is an **unordered** collection of **elements** or **members**.
## Definition
a set is donated by {} and is defined by listing elements or describing the elements in mathematical notation, For example:
- **finite set**: $A =$ {$1,2,3$}, where $A$ is a set with 3 elements.
- **infinite set**: $B =$ {$x\mid$$x$ is an even integer},represents the set of all even integers.
The set can represent any set, such as:
- [[Number_sets|numbered sets]]
- geometric objects
- functions
- matrices and vectors
- sequence and series
- etc...
Sets can be compared by using [[Set_Equivalence|Set Equivalence]].
## Properties
- **Uniqueness**: each element only appears once in a set.
- **Unordered**: The order does not matter, so {1,2} $\equiv$ {2,1}.
## Set Notation
##### Empty Set notation:($\emptyset$)
- A set that contains no elements
##### roster or list notation:
- lists all elements of the set in {}(i.e. $C = \{ 2,4,6,8,10 \}$ represents a set with 5 elements)
##### set-builder notation:
- describes the properties that define the elements of a set(i.e. $D =$ {$x\mid$$x$ is a prime number})
##### universal set:($U$)
- includes all elements under consideration, and all other sets are subsets of this universal set.

## Set Operations
##### Union($\cup$)
 - the set of all elements in either $A$ or $B$
##### Intersection($\cap$)
- the set of all elements in common between $A$ and $B$
##### Deference($\setminus$)
- for ${A}\setminus{B}$, the set of elements in $A$ but not in $B$
#####  Subset($\subseteq$)
- for ${A}\subseteq{B}$, $A$ is a subset if every element of $A$ is also an element in $B$
##### Symmetric Deference($\oplus$)
- the set of elements $x$ where, $x$ is in $A$ and not in $B$, or $X$ is in $B$ and not in $A$
	- ${A}\oplus{B} = ({A}\setminus{B})\cup({B}\setminus{A})$
##### Cardinality($\lvert{S}\rvert$)
- the number of elements in a set.
	- for **finite sets**, this is a non-negative integer. 
	- for **infinite sets**, cardinality refers to the size of the infinity (e.g. countable vs. uncountable infinity).
##### Power set(${P(S)}$)
- the set of all subsets of S(the empty set counts as a subset)
##### Compliment
- the set of all elements in the universal set $U$ that are not in A.
##### Disjoint 
- two sets are disjoint if they contain no common elements.

## Observations
[[Power_Set_Size| Power Set Size]] - the size of a power set if base set cardinality is n