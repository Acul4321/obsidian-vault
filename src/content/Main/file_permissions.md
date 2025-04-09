---
date: 2025-04-09 14:04
tags:
  - Linux
category: "[[Linux]]"
---
# file_permissions
Permissions in [[Linux]] are managed at the file level
Every file is owned by a user and a group

## Permission String
![[permission_string_format.png| 50%]]

$$\text{r - read permission} $$
$$\text{w - write permission} $$
$$ \text{x - execute permission} $$

| Description  | Type  |
| ------------ | ----- |
| Regular File | -     |
| Directory    | d     |
| Link         | l     |
| Device       | b / c |
| Socket       | s     |
| Pipe         | p     |
## Changing File Permissions

can be changed using **chmod**
```
chmod [WHO][OP][WHAT] NAME
```

**WHO** can be one of:
- **u** - User who owns the file
- **g** - Users in the group which owns the file
- **o** - Other users
- **a** - All users
**OP** must be:
- **+** - Add a permission
- **-** - Remove a permission
**WHAT** is one of the Three permission types
*each permission segment can have a comma(,) to indicate another permission*
				*chmod u+rw,go-rwx private.txt*