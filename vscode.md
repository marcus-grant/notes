---
created: 2022-12-02T14:35:19.211Z
modified: 2023-02-23T11:33:13.480Z
tags: [vscode,editor,overview,tips,tool,develop,productivity]
---
# VS Code

## Introduction

**VS Code** is one of the most popular code editors that prides itself on
being less of an IDE and more of a extension expandable
[source-code editor][code-editor-wiki].
It's not purely a source code editor though due
to those extensions.
Thus it exists within a middle ground between a full IDE and a pure source code editor.

## Install

### Generic Download & Install

If *VS Code* works on your system,
then the [download link on the homepage][vscode-home] will work.
There are however other ways that are often easier and more reliable.

### MacOS

[**Homebrew**][homebrew-zk] is a package manager for [MacOS][macos-zk].
It can be used to install *VS Code*,
via the [terminal][cli-zk] with the following command:

```bash
brew install --cask visual-studio-code
```

### Linux

***TODO*** go over flatpak, and package manager installs

## Debugging

Debugging in *VS Code* is done via the *Debug* tab in the left sidebar,
or the `Ctrl+Shift+D` *keyboard shortcut*.
To start a *debug session*,
you need to have a *debug configuration* in the `.vscode/launch.json` file.
This can be handled through the *Debug* tab in the left sidebar,
or the [JSON][json-zk] file itself.

### Breakpoints

Breakpoints are used to pause the program at a specific line.
They can be added by clicking on the line number in the code editor,
or by using the `F9` *keyboard shortcut*.

It's also possible to set breakpoints in the *Debug* tab in the left sidebar.
This includes setting breakpoints for specific conditions,
like a variable containing a specific value.

### Debug Actions

* `F5` - Start Debugging
* `Shift+F5` - Stop Debugging
* `Ctrl+Shift+F5` - Restart Debugging
* `F9` - Toggle Breakpoint
* `F10` - Step Over
* `F11` - Step Into
* `Shift+F11` - Step Out
* `Ctrl+Shift+I` - Open Debug Console

### Debug Console

The *Debug Console* is a terminal that is opened when you start a *debug session*.
It is used to interact with the program being debugged.
It can be used when paused at a breakpoint to interact with the program,
this includes using scoped variables for that line to get the result.

### Variables

The sidebar in the debug tab has a *Variables* section.
This section shows the variables that are in scope for the current line.
It also shows the values of those variables.
You can *watch* variables by right clicking on them and selecting *Add to Watch*.
This will add the variable to the *Watch* section of the sidebar.

## References

### Web Links

* [Visual Studio Code Homepage][vscode-home]
* [Visual Studio Documentation Homepage][vscode-docs-home]
* [Integrated Development Environment (from Wikipedia, the free encyclopedia)][ide-wiki]
* [Source-code editor (from Wikipedia, the free encyclopedia)][code-editor-wiki]

<!-- Hidden Reference Links Below Here -->
[vscode-home]: https://code.visualstudio.com "Visual Studio Code Homepage"
[vscode-docs-home]: https://code.visualstudio.com/Docs "Visual Studio Documentation Homepage"
[ide-wiki]: https://en.wikipedia.org/wiki/Integrated_development_environment "Integrated Development Environment (from Wikipedia, the free encyclopedia)"
[code-editor-wiki]: https://en.wikipedia.org/wiki/Source-code_editor "Source-code editor (from Wikipedia, the free encyclopedia)"

### Note Links

* [Homebrew][homebrew-zk]
* [macOS][macos-zk]
* [Command Line Interface (CLI) and Terminals][cli-zk]
* [JSON: Javascript Object Notation][json-zk]

<!-- Hidden Reference Links Below Here -->
[homebrew-zk]: ./homebrew.md "Homebrew"
[macos-zk]: ./macos.md "macOS"
[cli-zk]: ./cli.md "Command Line Interface (CLI) and Terminals"
[json-zk]: ./json.md "JSON: Javascript Object Notation"
