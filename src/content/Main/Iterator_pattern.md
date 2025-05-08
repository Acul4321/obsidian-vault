---
date: 2025-05-07 15:05
tags:
  - computing
  - designPatterns
category: "[[Programming_Design_Patterns]]"
---
# Iterator Pattern
## What
Provides a way to access elements of a collection sequentially without exposing its underlying structure.
## When
You need to traverse a data structure without exposing its internal implementation.
You want to access elements of a collection without exposing its structure.
```java
class MyCollection {
    private String[] items = {"a", "b", "c"};

    public String[] getItems() {
        return items; // Exposes internal structure
    }
}

class Client {
    public static void main(String[] args) {
        MyCollection c = new MyCollection();
        for (String item : c.getItems()) {
            System.out.println(item);
        }
    }
}

```
## How
- Define an `Iterator` interface with methods like `hasNext()` and `next()`.
- Concrete iterator implements this interface.
- The collection provides a method to return an iterator.
```java title:title
import java.util.Iterator;
import java.util.List;

class MyCollection implements Iterable<String> {
    private List<String> items = List.of("a", "b", "c");
    public Iterator<String> iterator() {
        return items.iterator();
    }
}

```
## Examples
- Looping over a list, tree, or custom collection.
- File system navigation.
## Why
### Advantages
- Uniform interface for different types of collections.
- Supports multiple simultaneous traversals.
- Encapsulates traversal logic.
### Disadvantages
- Can be less efficient if not implemented carefully.
- May expose internal data if not designed securely.