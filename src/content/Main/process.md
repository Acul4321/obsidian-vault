---
date: 2025-04-09 15:04
tags:
  - Linux
  - process
category: "[[Linux]]"
---
# process
A **Process/Task** is an instance of a program which is currently being executed
- when running: program in action *or* program in execution
It is the [[Kernel]]'s responsibility for Process Scheduling
- The [[Kernel]] decides which Process gets to run on which CPU / core and when
- **Pre-emption** is used, allows the [[Kernel]] to forcefully interrupt a running process and replace it with another task
The **process control block** contains metadata which describes a process, including a:
- numerical ID of the process (pid)
- its parent (ppid)
- links to open files
- and a snapshot of the CPU state
- Other attributes: owner, permissions, etc.
The virtual memory contents includes:
- A copy of the program
- The contents of variables and constants
- Program state, such as the functions which have been called and their parameters
## Forking
A process is created by **Forking**(duplicating) an existing process, creating a parent-child relationship
## Redirection
A process has Three I/O streams:
- **stdin** to pass a list of typed commands into a program
- **stdout** to save the output of a program to be processed later
- **stderr** to save a copy of any error messages in order to debug a program


![[linux_commands#process Process]]