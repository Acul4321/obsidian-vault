---
date: 2025-05-07 16:05
tags:
  - computing
  - designPatterns
category: "[[Programming_Design_Patterns]]"
---
# Singleton Pattern
## What
Ensures a class has only one instance and provides a global point of access to it.
Ensures one and only one object is created.
## When
You need exactly one instance of a class (and it must be globally accessible).
You need one shared instance (e.g., config, logger).
```java
class Logger {
    public void log(String msg) {
        System.out.println(msg);
    }
}

class App {
    public static void main(String[] args) {
        Logger l1 = new Logger();
        Logger l2 = new Logger(); // multiple loggers, state inconsistency risk
        l1.log("Start");
        l2.log("End");
    }
}

```
## How
- Hide constructor.
- Provide a static method to get the instance, creating it lazily if necessary.
```java 
class Singleton {
    private static Singleton instance;
    private Singleton() {}
    public static Singleton getInstance() {
        if (instance == null) instance = new Singleton();
        return instance;
    }
}

```
## Examples
- Configuration managers.
- Logging services.
- Database connection pool.
## Why
### Advantages
- Controlled access to the sole instance.
- Lazy instantiation possible.
### Disadvantages
- Global state makes testing harder.
- Can lead to hidden dependencies.
- Breaks the Single Responsibility Principle.