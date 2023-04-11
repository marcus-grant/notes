---
created: 2023-04-06T08:35:07.537Z
modified: 2023-04-11T12:36:51.435Z
tags: [nano,editor,shell,cli,terminal,text,pcde,module14]
---
# Nano Editor

GNU nano is a user-friendly [command line][cli-zk]
[shell][shell-zk] text editor for
Unix and [Linux][linux-zk] [operating systems][os-zk].
It includes all the basic functionality of a text editor,
such as "text content create/update,
search and replace with regular expression support,
spell checking, and more" (Linuxize 2021).

## Basic Operations

### Open

Open a file on the command line by using the `nano` command followed by the file name.

```bash
nano hello.txt
```

### Creating a New File

Same as opening a file, but the file does not exist yet.

### Saving a File

To save a file, press `Ctrl+O` and then press `Enter` to confirm the file name.
Use `Ctrl+X` to exit the editor.

### Search and Replace

To search text, enter `Ctrl+W` and then enter the text to search for.
After entering search mode, using `Alt+W` will search for the next occurrence of the text.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Command Line Interface][cli-zk]
* [Operating System][os-zk]
* [Shell (OS)][shell-zk]

<!-- Hidden References -->
[cli-zk]: cli.md "Command Line Interface"
[os-zk]: ./os.md "Operating System"
[linux-zk]: ./linux.md "Linux"
[shell-zk]: os-shell.md "Shell (OS)"
