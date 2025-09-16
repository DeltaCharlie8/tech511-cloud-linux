# Linux

- [Linux](#linux)
  - [Why learn Linux?](#why-learn-linux)
  - [What is Linux](#what-is-linux)
  - [What is Bash](#what-is-bash)
  - [What is a shell](#what-is-a-shell)
  - [Difference between Home and Root directories](#difference-between-home-and-root-directories)
  - [Managing file ownership](#managing-file-ownership)
  - [Managing file permissions](#managing-file-permissions)
  - [Managing file permissions using numerical values](#managing-file-permissions-using-numerical-values)
    - [Different permission assignments](#different-permission-assignments)
  - [Changing file permissions](#changing-file-permissions)


## Why learn Linux?
- open-source and adaptable
- fast-growing
- stable
- scalable for server tasks
- becoming more popular for desktop workstation use
- often used in DevOps
- makes you more employable
- inexpensive
  - RedHat Enterpsise version has costs

## What is Linux
- spinoff of Unix
- made up of a kernel (the core os) plus many libraries and utilities that rely on that kernel
- many different distributions (Ubuntu)

## What is Bash
- stands for Born Again Shell
- type of shell
- is the command interpreter
- the most commonly used shell in Linux
- it is located at: /bin/bash

## What is a shell
- software/interface that runs the commands
- in Linux, there are a range of shells available

## Difference between Home and Root directories

Home directory
- the user's personal folder
- default is you are taken straight there when you log in
- on Linux it is located at:
```
/home/<user's folder>
```

Root directory
- final parent in file/folder structure (there is nothing higher!)
- if you start a path with a '/' you are saying start in the root directory. It is otherwise used to separate directories

## Managing file ownership
Why is it important
- Sensitive files could be read or modified by unauthorised users.
- System stability and security could be compromised.
- Collaboration would be difficult because access wouldn’t be properly controlled.

## Managing file permissions

## Managing file permissions using numerical values
Each permission has a number:

- Read (r) = 4
- Write (w) = 2
- Execute (x) = 1
- No permission (-) = 0

### Different permission assignments
- To assign read + write permissions
  - Read (4) + Write (2) = 6
  
    result: rw-

- To assign read, write and execute permissions
  - Read (4) + Write (2) + Execute (1) = 7
    
  result: rwx

- To assign read and execute permissions
  - Read (4) + Execute (1) = 5
    
  result: r-x

Permissions are added together for each entity (User, Group, Other).

For example: 644
- 6: User --> Read + Write (rw-)
- 4: Group --> Read only (r--)
- 4: Other --> Read only (r--)

    644 = rw-r--r--

    This means that the owner can read + write, group can read, others can read.



## Changing file permissions