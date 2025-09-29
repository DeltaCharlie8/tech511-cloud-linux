# Linux

- [Linux](#linux)
  - [Why learn Linux?](#why-learn-linux)
  - [What is Linux](#what-is-linux)
  - [What is Bash](#what-is-bash)
  - [What is a shell](#what-is-a-shell)
  - [Difference between Home and Root directories](#difference-between-home-and-root-directories)
  - [Managing file ownership](#managing-file-ownership)
    - [Managing file permissions using numerical values](#managing-file-permissions-using-numerical-values)
    - [Different permission assignments](#different-permission-assignments)
    - [Changing file permissions](#changing-file-permissions)
  - [Bash script to install Nginx](#bash-script-to-install-nginx)
  - [Managing processes in Linux](#managing-processes-in-linux)


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

### Managing file permissions using numerical values
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

### Changing file permissions
1. What command changes file permissions?

    The command is:

    chmod


    (stands for change mode).

2. To change permissions on a file, what must the end user be? (2 answers)

    The owner of the file.

    Or the root (superuser).

3. Examples with chmod on testfile.txt:
   
    a. Set User = read, Group = read+write+execute, Other = read+write only

        Using symbolic method:
        chmod u=r, g=rwx, o=rw testfile.txt

        Using numeric method:
        User r-- = 4
        Group rwx = 7
        Other rw- = 6
        chmod 476 testfile.txt

    b. Add execute permissions (to all entities)

        Symbolic:
        chmod a+x testfile.txt
        (a = all, +x = add execute).

    c. Take write permissions away from Group

        Symbolic:
        chmod g-w testfile.txt

    d. Use numeric values to give User = read+write, Group = read, Other = no access

        User rw- = 6
        Group r-- = 4
        Other --- = 0
        chmod 640 testfile.txt

## Bash script to install Nginx
To link to bash script, drag the file in, hold shift and let go. You can now access it here [bash script](bash-scripts/prov-nginx.sh)

## Managing processes in Linux
what is a process
- a program that loads into RAM/memory and uses CPU when needed

2 types of processes in Linux
- User
- System

to see all processes
- ps -e
- ps aux (gives you lots of columns and details on the processes)
- top (provides real time details with headers)


to kill the sleep process
- kill -1 1306

to check environment variables
- printenv