---
date: 2025-05-07 15:05
tags:
  - computing
  - designPatterns
category: "[[Programming_Design_Patterns]]"
---
# Adaptor Pattern
## What
Converts the interface of a class into one the client expects.
Wraps an object and provides a different interface to it.
## When
You want to use an existing class but its interface doesn't match your needs.
You need to make one interface work with another.
```java
class LegacyPrinter {
    public void printOld(String s) {
        System.out.println("Printing: " + s);
    }
}

class Client {
    public void print(String s, LegacyPrinter printer) {
        // Client expected `print()` but only `printOld()` exists
        // You’d need to change either the client or the legacy class
        printer.printOld(s); // tightly coupled workaround
    }
}

```
## How
- Create an adapter that implements the target interface.
- Adapter holds a reference to the adaptee and translates calls.
```java 
interface Target { void request(); }

class Adaptee { public void specificRequest() { System.out.println("Adaptee called"); } }

class Adapter implements Target {
    private Adaptee adaptee;
    public Adapter(Adaptee a) { this.adaptee = a; }
    public void request() { adaptee.specificRequest(); }
}

```
## Examples
- Wrapping legacy APIs for use with new code.
- Adapting a third-party library to fit your application.
## Why
### Advantages
- Promotes reusability of existing code.
- Enables integration of incompatible interfaces.
### Disadvantages
- Can add layers of complexity.
- May not work well if adaptee's interface is complex or changes frequently.