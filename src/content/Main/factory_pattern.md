---
date: 2025-05-07 16:05
tags:
  - computing
  - DesingPrinciples
category: "[[Programming_Design_Patterns]]"
---
# Factory Pattern
## What
Defines an interface for creating an object, but lets subclasses alter the type of object that will be created.
Subclasses decide which concrete classes to create.
## When
You need to delegate instantiation logic without specifying concrete classes.
You want to delegate object creation to avoid `new` scattered everywhere.
```java 
class App {
    public static void main(String[] args) {
        Shape s;
        String type = "circle";
        if (type.equals("circle")) {
            s = new Circle(); // tight coupling to concrete class
        } else {
            s = new Square();
        }
        s.draw();
    }
}

```
## How
- Define a factory method in a creator class.
- Subclasses override the method to instantiate different products.
```java title:SimpleFactory
class ShapeFactory {
    public static Shape getShape(String type) {
        return type.equals("circle") ? new Circle() : new Square();
    }
}
```
```java title:Factory
abstract class Dialog {
    public void render() {
        Button b = createButton(); b.render();
    }
    protected abstract Button createButton();
}
```
## Examples
- UI toolkits that create different widgets for Mac/Windows.
- Document editors creating different document types.
## Why
### Advantages
- Promotes loose coupling.
- Supports Open/Closed Principle.
- Allows code to work with interfaces, not implementations.
### Disadvantages
- Can introduce complexity with many subclasses.
- Harder to trace which implementation is used at runtime.