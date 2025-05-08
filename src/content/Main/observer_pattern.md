---
date: 2025-05-07 14:05
tags:
  - designPatterns
  - computing
category: "[[Programming_Design_Patterns]]"
---
# Observer Pattern
## What
Defines a one-to-many dependency so that when one object (subject) changes state, all its dependents (observers) are notified and updated automatically.
Allows objects to be notified when state changes.
## When
You need to maintain consistency across multiple related objects without tightly coupling them. Especially useful in event-driven systems.
You want dependent objects to automatically update when the subject changes.
``` java
class NewsAgency {
    private String news;
    private NewsChannel channel;

    public void setChannel(NewsChannel c) { this.channel = c; }

    public void setNews(String news) {
        this.news = news;
        if (channel != null) {
            channel.update(news); // Tight coupling to one specific observer
        }
    }
}

class NewsChannel {
    public void update(String news) {
        System.out.println("News: " + news);
    }
}

```
## How
- Create a `Subject` interface with methods to register, unregister, and notify observers.
- Observers implement an `Observer` interface.
- The subject maintains a list of observers and notifies them of state changes.
``` java
import java.util.*;

interface Observer { void update(String news); }
class NewsChannel implements Observer {
    public void update(String news) { System.out.println("News: " + news); }
}

class NewsAgency {
    private List<Observer> observers = new ArrayList<>();
    public void addObserver(Observer o) { observers.add(o); }
    public void setNews(String news) {
        for (Observer o : observers) o.update(news);
    }
}

```
## Examples
- UI components that update when data changes (Model-View-Controller pattern).
- Event systems like logging frameworks, GUI toolkits, or messaging platforms.
## Why
### Advantages
- Loose coupling between subject and observers.
- Observers can be added/removed dynamically at runtime.
- Promotes reuse and modular design.
### Disadvantages
- Notification flow can be hard to trace/debug in large systems.
- Possible performance issues if many observers are triggered frequently.
- Risk of memory leaks if observers aren’t properly removed (especially in languages without automatic memory management).