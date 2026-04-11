---
date: 2026-04-09 18:04
tags:
  - course
  - computing
  - full
category: "[[]]"
---
# Programming Languages
# Pipeline
**parsing** : transform source code (strings) into a structured representation ->
**Type checking** : Check that source code does not have type errors (for typed languages) ->
**Desugaring** : translate complicated constructs into smaller ones (dont have to duplicate logic) -> 
**IR Conversion** : translate into intermediate representation -> 
**Optimisation** -> 
**Compilation/Interpretation**: Either interpret the code, emit lower-level code

Also we need a **Runtime** e.g. Garbage collection
# Components
### Syntax
constructs of language, how does it look?
### Typing Rules (if language is typed)
what programs are sensible? can we rule out errors?
### Semantics
what does a program mean? what should it do when it is run?

# Programming Paradigms 
style of programming that dictates the principles, techniques, and methods used to solve problems in that language
*use the right tool for the job*

## Expressions vs Statements
**Expressions** - A term in the language that eventually reduces to a value (can be contained within a *Statement*)
**Statement** - An instruction / computation step, does not return anything
## Imperative Programming Language
**Program Counter + Call stack + State** i.e. c, Python, JavaScript
record our *current position* in the program, Statements can alter that position
Variable assignments alter some *store*

Imperative paradigm *closer to the underlying hardware* as it is built around mutability
## Functional Programming Language
everything is an **expression**
**first-class functions**: can create, apply, and pass functions just like any other expression
Evaluation is **reduction of a complex expression to a value**
## Object-Oriented Programming Language
**object**: consists of some state (fields), and some functions that operate on the state (methods)
**encapsulation**: don’t expose internal state unnecessarily
**inheritance**: ability to extend previously-defined objects to make new ones

# Syntax

|                                               |                                                                                                                                                                                                                         |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![[Chomsky’s Hierarchy of Language.png\|300]] | Regular expressions are regular languages<br>Context-free languages can be recognised by a push-down automaton<br>Context-sensitive languages and recursively enumerable languages require more interesting recognisers |
## Grammar
set of formal rules specifying how to construct a sentence in a language.
it consists of:
- A set of *terminal symbols*: symbols that occur in a sentence
	-  the keywords that end 
- A set of *nonterminal symbols*, which each 'stand for' part of a phrase
	-  the expression keyword that would not end 
- A distinguished *sentence symbol* that stands for a complete sentence
	-  what do you want to parse, where you start from
- A set of *production rules* that show how phrases can be made up from terminals and sub-phrases
	-  the symbol that make up phrases

### Backus-Naur Form (BNF) - Concrete Syntax
BNF grammar consists of a series of *productions* takes the form `S ::= a|b|c`
```
expr ::= prim | expr op prim 
op ::=  '+'  |  '-'  |  '*'  |  '/' 
prim ::= int | '(' expr ')' 
int ::= digit
digit ::= '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | '0'
```
**Extended BNF (EBNF)** allows us to use *regular expressions* i.e. if digit+ (one or more digits)
### Parse Tree
a parse tree corresponds a *string* to a *grammar*

|                       |                                                                                                                                                                                                                                                       |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![[parse tree.png\|]] | Each *terminal node* is labelled by a terminal symbol (here, digits and operators) <br><br>Each *nonterminal node* is labelled by a nonterminal symbol of G and can have children nodes X, Y, Z only if G has a production rule N ::= … \| X Y Z \| … |
## Abstract Syntax
allows us to abstract away irrelevant syntactic noise (focus on the important parts)
```
Integers n 
Operators ⊙ ::= + | - | * | /
Terms L, M, N ::= n | L ⊙ M
```
### Abstract Syntax Tree
a way to represent a parsed program
the steps to parse text into an AST is:
- *Tokenise* text into chunks using regular expressions (lexing)
- Match *token streams* and convert these into AST nodes (parsing)

on the example : `(1 + 2 * 3) + (3 * 4)`
![[Abstract Syntax Tree.png|400]]

# Evaluation
## Compiler
compiler translates code into lower-level languages, such that eventually they can be executed on hardware
often, compiled code needs to be supported by a runtime system
## Interpreter
a program that accepts a program written in a given programming language, and executes it directly (no sperate executable)
interpreters are *easier to write* but *slower* than compiled code
### Virtual Machines
evaluates instructions (usually encoded in some sort of bytecode) by an interpreter
- *platform independance*: Can run compiled code on multiple platforms
- *Common backend*: multiple (quite different) languages can target the same backend

## Just-in-time (JIT) Compilers
a middleground between compilers and interpreters, where code is compiled to native code *at run-time*
JIT compilers operate selectively: they profile code and compile *frequently called* code
# Operational Semantic 
Big-step: Closer to how we write interpreters, but cannot reason easily about nonterminating expressions
Small-step: More fine-grained reasoning power, but (usually) further away from how we would implement a language

> [!tip]- Determinism & Church-Rosser Theorem
> no matter which path you take in computation, the answer is always the same (no side-effects)
> ![[church-rosser theorem.png|200]]

### Semantic Approaches
![[semantics.png]]
### Textual Descriptions
plain English on how expressions work but can be *very ambigus*

## Big-Step Operational Semantics
**Theorem**: If ⋅⊢ M ∶ A then there exists some V such that M ⇓ V and ⋅ ⊢ V: A.
`M ⇓ V` : shows how an *expression M evaluates to a value V*. (aka a judgement)
## derivation tree for L_arith
![[{A03096CA-AACE-434A-86BD-0853B7A6516D}.png]]
![[{2B2320EA-67BB-4910-BD1B-7202CB9EFF43}.png]]
## Small-Step Operational Semantics
![[{EE556D5B-5617-4CC5-A06F-A1817C8F7E9D}.png]]
The idea is that we *repeatedly apply the congruence rules* (like evaluating the test subexpression) *until we can evaluate the actual reduction step*
# Parsing
Parsers take unstructured text and turn it into a structured representation (parse tree) based on the rules of a grammar
## Lexing
process of turning unstructured text into a token stream, so that it can be more easily consumed by a parser
`1 + (2 * 3) - 1` -> INT(1), LPAREN, INT(2), STAR, INT(3), RPAREN, MINUS, INT(1)
## Parsing
![[{467AC57F-75C0-40B4-8721-48E987A0B9AB}.png]]
# Bindings
## Let Bindings
![[{6ED17E7B-C8DF-4E71-B603-127B5BFE4973}.png]]
# Variables
## Free Variables
bound variables are considered free variables

`fv(x) = {x}` : x on its own is a free variable
`fv(n) = ∅` : Integer literals don’t contain variables
`fv(M ⊙ N) = fv(M) ∪ fv(N)` : The free variables of a binary operator are the union of the free variables of its operands
`fv(let x = M in N) = fv(M) ∪ (fv(N) \ {x})` : Any free occurrence of x would be bound by the let, so we need to remove it from the set of N’s free variables
## Name shadowing
```
let x = 5 in
let x = 10 in
x + x
```
the x on line3 are all bound by the second let, therefore *no-free variables*
The first let-binder is redundant, and has been shadowed by a more recent binder
## Substitution
`M {V / x}` : Replace all free occurrences of x in term M with value V
## Let Variable Operational Semantics
![[{E9441FD6-8A1B-4FB8-95CC-AC89B42D42D1}.png]]
There is no rule for trying to *evaluate* a *free variable* is an *error*
## α-equivalence
two expressions are the same, as long as their *binding structure* is the same.
to do this we can only rename bound variables.
we *Cannot*:
- change names of free variables
- change the binding structure
- change the syntax
- change order of variables
best way to calculate is a binding diagram:
![[{E6D19642-B6D6-4900-8E47-9AB1C9B4F125}.png]]
# Functions
## Anonymous (lambda) functions
![[{528AEF42-8263-4F05-B0ED-EF7BCD766497}.png|200]]
then *apply* a function, meaning we replace the free occurrences of the parameter with an argument before evaluating
![[{7D14608F-B5A3-4EBD-BE2F-FFB5D5ABC155}.png|400]]
### Multi argument functions
ambda expressions only have a single parameter, but we can define functions with multiple parameters by nesting multiple functions
![[{9F7DC494-3E59-41B9-BCA6-94EEF2D368A2}.png|400]]
This is Known as *Currying*
## lambda Operational Semantics
![[{8A1CF88D-DED7-477C-B55B-2628ABD824AE}.png]]
## Capture-Avoiding Substitution

> [!warning] Variable Capture
> where a free variable becomes bound after substitution. This can change the meaning of the expression.
> ![[{F1858180-CEC1-43F7-84F3-AE26AB144B5D}.png]]
> To *Avoid* this we can use *α-equivalence* to pick *fresh var names*, whenever we need to substitute under a binder

![[{A2D9011E-C00A-4AAD-A6C7-19FD88FC086E}.png]]
if a *substitution* causes *variable capture*, you can *rename* the variable - ***Barendregt's Convention***
## Recursion
### Recursion Operational Semantics
![[{C6D31960-FFFB-4481-B85A-CBEE5CD0E309}.png]]
# Types
***⊢ M : A*** "Term M has type A"
## Typing Rules
### Addition
![[{BE78BA17-51BA-4D40-9A04-66676D587D03}.png]]
### Binary operators
![[{BA64980A-1A4F-4B7F-8144-FD2C6704D427}.png]]
### Conditionals
![[{ADC495FC-81D3-42EF-9BD6-EA4709F3BF13}.png|500]]
#### Type Environment
used for Functions
**Γ ::= ⋅ ∣ Γ, x : A**  - a mapping from variables to types
![[{55F4ECC6-B0A3-4D30-8D2A-66E98E9B9741}.png]]
### Functions
![[{BB889668-7D05-4A32-8E5B-31B8BAF26144}.png]]
## Recursive Function
![[{9C0FD508-1418-49B8-8405-4157105E1130}.png]]
# Type Checking
**Static** - all typechecking happens *before* a program is run
- Lower memory cost / runtime
**Dynamic** - tag values with their types, and perform typechecking dynamically to avoid crashes
- flexible, allowing branching control now where branches have different types.

# Data Types
## Encodability
- Records can be encoded using products
- Variants can be encoded using sums
- Booleans can be encoded using sums and the unit type
**local encodings**: we can replace one construct with another as if it were a macro.
**global encodings**:  require us to rewrite a program (e.g. by adding a parameter to every function)
# Imperative Programming
we're not trying to produce a value, but instead modify the program state
![[{A9629E81-E85B-42AC-99B8-67AAEE2805E2}.png]]
![[{69D60560-9C44-4B87-8B5E-A68D4D5C5ACB}.png]]
![[{BF0400C8-F476-43A4-9DC5-6D2A8030BE95}.png]]
![[{31284A61-03EB-4065-9432-84211B883BF2}.png]]
# Type Soundness
If a program is well typed, then it is either already a value, or it can take a step while staying well typed

If ⋅ ⊢ M ∶ A, then either M is a value A, or there exists some N such that M ⟶ N and ⋅ ⊢ N ∶ A.
## Preservation
Reduction doesn't change the result type or introduce type errors

If Γ ⊢ M : A and M −→ N, then Γ ⊢ N : A.
## Progress
Well typed processes don't get "stuck"

If · ⊢ M : A then either M = V for some value V, or there exists some N such that M −→ N.

# Code Generation
## Tree-Walk Interpreters
evaluates the AST directly:
- For example, to evaluate a conditional, we firstly evaluate the test, and depending on the result evaluate the *then* or the *else* branch
*straightforward* to implement but a lot of *overhead* because they need to represent each node as a Java object and need to chase pointers at runtime
## Bytecode Interpreters

> [!info] Bytecode
> compact representation of program code, suitable for efficient interpretation
> Instead of storing source code strings, bytecode consists of a 1- byte opcode followed by (optionally) any arguments
> ![[{4E5386F8-75E6-4869-967A-BA8989922CDE}.png]]

they are much faster than treewalk interpreters but compilation to bytecode is easier to implement than native code compilation
### Stack Machines
The basic idea is that we have a *stream of instructions* that manipulate a *data stack*
- Operations have a *fixed* size
![[{910FE1CE-BC89-4774-A323-F13016411392}.png|500]]
## SVM
*stack-based*: instructions use an operand stack rather than having explicit parameters.
### Machine State
#### Code Store
SVM state is a code store containing the machine’s bytecode.
![[{E4363197-8B0F-49EA-AA29-853F0272F588}.png]]
- A **program counter** (pc) that tracks the current instruction
- A **code limit** (cl) that marks the end of the code store
#### Data Store
|                                                                                                                                                                                                                                                                                 |                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| SVM state is a data store containing the program’s data<br>- A **stack pointer** (sp) that denotes the top of the stack, some data that occurs on the stack, and then global data.<br>- A **status register** that indicates whether the program is running, halted, or failed. | ![[{2E5C67D1-38D5-4BFE-AB76-909D16B9F2F4}.png]] |
### SVM Instructions
Each SVM instruction occupies 1, 2, or 3 bytes: 
- Every instruction has a one-byte opcode that identifies the instruction.
- 1-byte instructions do not have any arguments associated with the instruction 
	- (e.g., instructions such as ADD that only work with the stack)
- 2-byte instructions have a (small) argument associated with them 
	- (e.g., instructions such as RETURN that state the number of words to return)
- 3-byte instructions have an argument associated with them that might need two bytes of storage:
	- (e.g., loading a constant onto the stack)
![[{93C491F8-D5E9-4175-B5F3-4675CAA956D9}.png]]
##### For Functions and Procedures
![[{B8747C58-3321-40EB-B232-5548F4FA53B9}.png]]
### Variables
Whenever we *declare* a *variable*, we store its address in an *address table*
Each address is associated with a locale:
- CODE (for function / procedure addresses)
- GLOBAL
- LOCAL
![[{C81FA563-DAA7-4D50-98C5-316CF15F0BAC}.png]]
### Paradigms
#### `if else`
Back-patching
- Emit a **placeholder jump**
- Remember its position
- Come back later and **fill in the correct address**
#### `while`
- firstly compile the test expression, and emit a JUMPF with a placeholder address
- emit code for the loop body, along with an unconditional jump back to the test
- we back-patch the JUMPF to after the loop body
#### `Function and Procedure Calls`
![[{D6067ADF-7022-416E-B964-D212B6008EDA}.png]]
![[{4E1BC994-F9C1-4E49-9615-5F2982D92ADD}.png]]
![[{98E8F52D-F0EA-4A62-8C68-4B0995AFD462}.png]]
