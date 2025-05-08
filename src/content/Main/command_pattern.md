---
date: 2025-05-08 17:05
tags:
  - computing
  - designPatterns
category: "[[Programming_Design_Patterns]]"
---
# Command Pattern
## What
Encapsulates a request as an object, allowing parameterization of clients with queues, logs, and undoable operations.
## When
- You want to decouple the sender of a request from the object that performs it.
- Support for operations like undo, logging, or queueing is needed.
You want to encapsulate requests, e.g., for undo/redo or UI buttons.
```java 
class Light {
    public void turnOn() {
        System.out.println("Light on");
    }
}

class Remote {
    private Light light = new Light();

    public void buttonPressed() {
        light.turnOn(); // Remote is tightly coupled to specific action
    }
}

```
## How
- Define a `Command` interface with an `execute()` method.
- Create concrete command classes that implement `Command` and call methods on a receiver.
- Invoker stores command objects and calls `execute()`.
```java
interface Command { void execute(); }

class Light {
    public void turnOn() { System.out.println("Light on"); }
}

class TurnOnCommand implements Command {
    private Light light;
    public TurnOnCommand(Light l) { this.light = l; }
    public void execute() { light.turnOn(); }
}

class Remote {
    public void press(Command c) { c.execute(); }
}

```
## Examples
- GUI buttons triggering commands (e.g., copy, paste, save)
- Transaction queue in a banking app
- Undo functionality in a text editor
## Why
### Advantages
- Decouples sender and receiver
- Adds support for undo/redo, logging, and queuing
- Commands can be parameterized and reused
### Disadvantages
- Can lead to many small classes
- Extra layer of indirection