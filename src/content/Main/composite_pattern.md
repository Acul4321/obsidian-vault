---
date: 2025-05-07 15:05
tags:
  - computing
  - designPatterns
category: "[[Programming_Design_Patterns]]"
---
# Composite Pattern
## What
Composes objects into tree structures and lets clients treat individual objects and compositions uniformly.
## When
You need to treat part-whole hierarchies of objects the same way.
You want to treat individual and group objects uniformly (e.g., a tree).
```java
class Circle {
    public void draw() {
        System.out.println("Drawing Circle");
    }
}

class Drawing {
    private List<Object> elements = new ArrayList<>(); // no common interface

    public void drawAll() {
        for (Object o : elements) {
            if (o instanceof Circle) {
                ((Circle) o).draw();
            } // messy, unscalable logic
        }
    }
}

```
## How
- Define a common interface for leaf and composite classes.
- Composite holds child components and delegates operations.
```java
interface Graphic { void draw(); }

class Circle implements Graphic {
    public void draw() { System.out.println("Circle"); }
}

class Drawing implements Graphic {
    private List<Graphic> elements = new ArrayList<>();
    public void add(Graphic g) { elements.add(g); }
    public void draw() { for (Graphic g : elements) g.draw(); }
}

```
## Examples
- GUI components like buttons, panels, and windows.
- File systems with files and directories.
## Why
### Advantages
- Simplifies client code.
- Makes it easy to add new kinds of components.
### Disadvantages
- Can make the design overly general.
- Harder to restrict certain composite-leaf relationships.