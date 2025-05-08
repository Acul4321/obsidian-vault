---
date: 2025-05-06 19:05
tags:
  - designPatterns
  - computing
category: "[[Programming_Design_Patterns]]"
---
# Strategy Pattern
## What
Encapsulates interchangeable behaviors and uses delegation to decide which one to use.
## When
You have several ways to do the same job, and callers must pick/swap them at run time.
You have a large `if-else` or `switch` deciding which algorithm to use.
```java
public class Sorter {
    public void sort(String type, int[] data) {
        if (type.equals("quick")) {
            // quicksort logic
        } else if (type.equals("merge")) {
            // mergesort logic
        } else {
            // default sort
        }
    }
}
```
## How
Extract each algorithm into a Strategy class or interface; use dependancy injection(DI) or via direct call to allow client to specialize behaviour dynamically.
```java
interface SortStrategy {
    void sort(int[] data);
}

class QuickSort implements SortStrategy {
    public void sort(int[] data) { System.out.println("QuickSort"); }
}

class MergeSort implements SortStrategy {
    public void sort(int[] data) { System.out.println("MergeSort"); }
}

class Sorter {
    private SortStrategy strategy;
    public Sorter(SortStrategy strategy) { this.strategy = strategy; }
    public void sort(int[] data) { strategy.sort(data); }
}
```
## Examples
- A collection we want to be sortable by different algorithms depending on size (e.g., quicksort, mergesort, bubblesort).
- compression choices (Zip, GZip) for an archiver depending on file size.
## Why
### Advantages
- Increased flexibility by decoupling the implementation of the algorithm from the caller.
- Easier to add or change algorithms without affecting existing code.
- Promotes the Open/Closed Principle (open for extension, closed for modification).
### Disadvantages
- Increases the number of classes.
- Adds complexity via indirection.
- Client must be aware of different strategies and select one appropriately.