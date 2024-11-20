---
date: 2024-11-03 13:11
tags:
  - propositionalLogic
category: "[[Propositional_Logic]]"
---
# Logical Equivalence
when two [[Compound_Propositions]] are syntactically different but semantically identical.
	i.e. they look different but mean the same thing.
>[!abstract]- notation
>Denoted by **≡**
>P≡Q expresses that P is logically equivalent to Q

### How to prove
logical equivalence can be proved by:
- Laws of logical equivalence 
- truth table
- reasoning

## Laws of logical equivalence
##### Identity laws: 
- ${P}\wedge{True}\equiv{P}$
- ${P}\vee{False}\equiv{P}$
##### Domination laws: 
- ${P}\vee{True}\equiv{True}$
- ${P}\wedge{False}\equiv{False}$
##### Idempotent laws: 
- ${P}\wedge{P}\equiv{P}$
- ${P}\vee{P}\equiv{P}$
##### Double Negation law: 
- $\neg(\neg{P})\equiv{P}$
##### Commutative laws:
- ${P}\wedge{Q}\equiv{Q}\wedge{P}$
- ${P}\vee{Q}\equiv{Q}\vee{P}$
##### Absorption law:
- ${P}\vee({P}\wedge{Q})\equiv{P}$
- ${P}\wedge({P}\vee{Q})\equiv{P}$
##### Associative laws:
- $({P}\wedge{Q})\wedge{R}\equiv{P}\wedge({Q}\wedge{R})$
- $({P}\vee{Q})\vee{R}\equiv{P}\vee({Q}\vee{R})$
##### Distributive laws: 
- ${P}\vee({Q}\wedge{R})\equiv({P}\vee{Q})\wedge({P}\vee{R})$
- ${P}\wedge({Q}\vee{R})\equiv({P}\wedge{Q})\vee({P}\wedge{R})$
##### De Morgan laws: 
- $\neg({P}\wedge{Q})\equiv\neg{P}\vee\neg{Q}$
- $\neg({P}\vee{Q})\equiv\neg{P}\wedge\neg{Q}$
##### Contradiction and Tautology laws: 
- ${P}\wedge\neg{P}\equiv{False}$
- ${P}\vee\neg{P}\equiv{True}$
##### Implication law: 
- ${P}\rightarrow{Q}\equiv\neg{P}\vee{Q}$
##### Exclusive or and Biconditional laws:
- ${P}\oplus{Q}\equiv({P}\vee{Q})\wedge\neg({P}\wedge{Q})$
- ${P}\leftrightarrow{Q}\equiv({P}\rightarrow{Q})\wedge({Q}\rightarrow{P})$
##### [[Quantifiers|Quantifier]] laws: 
- $\forall{x}.\forall{y}.{Q(x,y)}\equiv\forall{y}.\forall{x}.{Q(x,y)}$
- $\exists{x}.\exists{y}.{Q(x,y)}\equiv\exists{y}.\exists{x}.{Q(x,y)}$
- $\neg(\exists{x}.\neg{P(x)})\equiv\forall{x}.{P(x)}$
- $\neg(\forall{x}.\neg{P(x)})\equiv\exists{x}.{P(x)}$
- $\forall{x}.({P(x)}\wedge{Q(x)})\equiv\forall{x}.{P(x)}\wedge\forall{x}.{Q(x)}$
- $\exists{x}.({P(x)}\vee{Q(x)})\equiv\exists{x}.{P(x)}\vee\exists{x}.{Q(x)}$