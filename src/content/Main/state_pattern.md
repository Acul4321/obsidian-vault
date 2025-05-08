---
date: 2025-05-07 15:05
tags:
  - computing
  - designPatterns
category: "[[Programming_Design_Patterns]]"
---
# State Pattern
## What
Encapsulates state-based behaviors and uses delegation to switch between behaviors.
## When
An object’s behavior depends on its internal state, and it must change its behavior at runtime depending on that state.
An object changes behavior based on internal state using conditionals.
```java
public class MusicPlayer {
    String state = "STOPPED";
    public void pressPlay() {
        if (state.equals("STOPPED")) state = "PLAYING";
        else if (state.equals("PLAYING")) state = "PAUSED";
        else state = "PLAYING";
    }
}
```
## How
- Define a `State` interface with behavior-specific methods.
- Implement concrete state classes.
- The context object holds a reference to a state instance and delegates behavior to it.#
```java
interface State { void pressPlay(MusicPlayer player); }

class PlayingState implements State {
    public void pressPlay(MusicPlayer p) { System.out.println("Pause"); p.setState(new PausedState()); }
}
class PausedState implements State {
    public void pressPlay(MusicPlayer p) { System.out.println("Play"); p.setState(new PlayingState()); }
}

class MusicPlayer {
    private State state = new PausedState();
    public void setState(State state) { this.state = state; }
    public void pressPlay() { state.pressPlay(this); }
}

```
## Examples
- TCP connection handling (e.g., Open, Closed, Listening states).
- Media player controls (e.g., Playing, Paused, Stopped states).
## Why
### Advantages
- Eliminates large conditional statements for state transitions.
- Promotes separation of concerns and cleaner state-specific behavior.
- Easier to add new states without changing existing logic.
### Disadvantages
- Increases number of classes.
- Tight coupling between context and state classes.