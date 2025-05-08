---
date: 2025-05-07 15:05
tags:
  - computing
  - designPatterns
category: "[[Programming_Design_Patterns]]"
---
# Decorator Pattern
## What
Dynamically adds new behavior or responsibilities to objects without altering their structure.
Wraps an object to provide new behavior.
## When
You need to add behavior to objects without affecting others of the same class.
You want to add behavior dynamically without subclassing.
```java 
class PlainText {
    public String render() {
        return "Hello";
    }
}

class BoldText extends PlainText {
    public String render() {
        return "<b>" + super.render() + "</b>";
    }
}

class ItalicBoldText extends BoldText {
    public String render() {
        return "<i>" + super.render() + "</i>"; // Combos require new subclasses
    }
}

```
## How
- Create a base component interface.
- Implement core component and decorator classes.
- Decorators implement the interface and wrap components.
```java
interface Text {
    String render();
}

class PlainText implements Text {
    public String render() { return "Hello"; }
}

class BoldDecorator implements Text {
    private Text text;
    public BoldDecorator(Text t) { this.text = t; }
    public String render() { return "<b>" + text.render() + "</b>"; }
}

```
## Examples
- Adding scrolling, borders, or shadows to GUI widgets.
- Adding encryption or compression to a stream.
## Why
### Advantages
- Flexible alternative to subclassing.
- Multiple decorators can be combined.
- Promotes single responsibility and open/closed principles.
### Disadvantages
- Many small classes.
- Can get complex when used extensively.