---
date: 2024-12-03 12:12
tags:
  - computing
  - propositionalLogic
category: "[[Propositional_Logic]]"
---
# functions
A function is a mapping from elements of *set* $x$ to elements of *set* $y$
$$f:\mathbb{R}\rightarrow\mathbb{R}$$
### domain
The set of all possible input values for which the function is defined.
### codomain
The set of all possible output values that the function can produce.
## Function Types
### Increasing/Decreasing
consider the function $f:\mathbb{R}\rightarrow\mathbb{R}$
$f$ is *strictly increasing* if $x_{1}<x_{2}$ , then $f(x_{1})<f(x_{2})$
$f$ is *strictly decreasing* if $x_{1}>x_{2}$ , then $f(x_{1})>f(x_{2})$
**!!** A strictly increasing/decreasing function must be *injective*
### Injective
a **one-to-one** mapping of the domain to codomain
$$\forall x_{1} \in X. \forall x_{2} \in X. (x_{1}\neq x_{2}\rightarrow f(x_{1})\neq f(x_{2}))$$
$$or$$
$$\forall x_{1} \in X. \forall x_{2} \in X. (f(x_{1}) = f(x_{2})\rightarrow x_{1} = x_{2})$$
![[InjectiveFunction.png]]
### Surjective
a *onto* mapping, means every element in the codomain has at least one preimage^[*preimage* : the original input value(s) from the domain that map to a given output value in the codomain under a function.] in the domain.
$$\forall y\in Y.\exists x\in X. (f(x)=y)$$
![[SurjectiveFunction.png]]
### Bijective
if function $f$ is bijective it is *both* **Injective** and **Surjective**:
- maps different elements of the *domain* to different elements of the *codomain*
- each element of codomain has a preimage
![[BijectiveFunction.png|400]]
## Inverse
for an **inverse** of a function to exist there **must** be a **Bijection**. 
The inverse of a function *Undos* the mapping of the Original function.
### Inverse function Properies
for the function $f:X \rightarrow Y$
$$( f(f^{-1}(y)) = y) \forall y \in Y$$
$$( f^{-1}(f(x)) = x) \forall x \in X$$
