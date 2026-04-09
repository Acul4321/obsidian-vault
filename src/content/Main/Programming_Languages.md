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
**Desugaring** : translate complicated constructs into smaller ones (dont have to duplicate logic)-> 
**IR Conversion** : translate into intermediate representation-> 
**Optimisation** -> 
**Compilation/Interpretation**: Either interpret the code, emit lower-level code

Also we need a **Runtime** e.g. Garbage collection

# Components
## Syntax
constructs of language, how does it look?
## Typing Rules (if language is typed)
what programs are sensible? can we rule out errors?
## Semantics
what does a program mean? what should it do when it is run?

# Programming Paradigms 
style of programming that dictates the principles, techniques, and methods used to solve problems in that language
*use the right tool for the job*

## Expressions vs Statements
**Expressions** - A term in the language that eventually reduces to a value (can be contained within a *Statement*)
**Statement** - An instruction / computation step, does not return anything
## Imperative Programming Language
**Program Counter + Call stack + State** i.e. c, Python, javascript
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

