---
date: 2025-04-09 15:04
tags:
  - Linux
category: "[[Linux]]"
---
# pattern_matching
We can use patterns (“globs”) to match sets of files
- Match any file: *
- Match all files with names beginning Test: Test*
- Match all .c files: \*.c
- Match all .h files with two-character names: ??.h
- Match all files named readmeN.txt where N is a single digit: readme[0-9].txt
These can be used as arguments to other commands
- ls -l \*.c
- mv \*.h include/
- rm Test*
These can also be used in [[C|Bash Scripts]]
- for filename in \*.pptx; do