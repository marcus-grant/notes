---
created: 2023-02-23T09:08:32.091Z
modified: 2023-03-01T16:31:40.573Z
tags: [git,github,gitlab,forge,forgejo,codeberg,version,control,software,repository,pcde,module9]
---
# Git

## Introduction

According to [Wikipedia][git-wiki]:

>Git (/ɡɪt/) is a distributed version control system that
>tracks changes in any set of computer files,
>usually used for coordinating work among
>programmers collaboratively developing source code during software development.
>Its goals include speed, data integrity, and support for distributed,
>non-linear workflows (thousands of parallel branches running on different systems).

The decentralized nature of Git makes it a very powerful tool to
keep track of changes in a software project,
across multiple servers and clients at the same time.
This means changes can be made to a file in one computer,
pushed to a server,
and then pulled by another computer,
all without the need to merge the changes manually.
And this applies to repository servers as well.
You could keep a personal git server at home,
and push your changes to it,
and then merge that code with a company git server,
separating the repository concerns.
One repository could be for development changes,
another could be the main production code.

## Clone

Every programming project involving a *repository* starts by
cloning the repository.
This is when the entire repository and its history is copied
to the local machine or server.
This is done by using the `git clone` command.

```sh
git clone https://github.com/some-account/some-repo.git
```

This will create a folder named `some-repo` in the current directory
and copy the entire repository into it, including its history.

## Fork

When a developer wants to make changes to a repository that they do not
have access to, or does not want to disrupt the main repository,
they can *fork* the repository.
This creates a copy of the repository on their own account,
and they can make changes to it without affecting the main repository.
Then when they are done, they can create a *pull request* to
merge their changes into the main repository.

## Branch

When a developer wants to make changes to a repository,
they can create a **branch**.
This is a copy of the repository that is separate from the main repository but
**branched** off of it at a specific point in time.

To **branch** off of a repository, the `git branch` command is used:

```sh
git branch some-branch-name
```

which is equivalent to:

```sh
git checkout -b some-branch-name
```

The `-b` flag tells git to create a new branch and then switch to it.
And `checkout` is the command that switches between branches.
*Checking* out a branch is the same as switching to it,
but can also be used to switch to a specific *commit* in the repository.
More on that later.

## Stage

When changes are made to a file in a repository,
they are not automatically tracked by git.
They must be **staged** first.
**Staging** is the process of adding changes to a *repository* to
then *commit* those changes to the repository history.

These processes are split up because it allows the developer to
review the changes before *committing* them to the repository history.
This is useful because it allows the developer to make sure
they are *committing* the changes they want to *commit*,
and not other changes that may have been made by mistake.
It also allows a developer to make last minute changes to the
changes they are about to *commit*.

To stage changes, the `git add` command is used like so:

```sh
git add some-file.txt
```

or for directories:

```sh
git add some-directory/
```

or for all changes:

```sh
git add .
```

It's also possible to unstage changes by using the `git reset` command:

```sh
git reset some-file.txt
```

And the same applies for directories and all changes.
Just specify a directory or the `.` character to unstage all changes.

## Commit

**Committing** is the process of adding changes to a *repository* to
then *commit* those changes to the repository history immutably.
This means that once a change is *committed* to the repository history,
it cannot be changed, without rewriting the entire repository history from
that point onwards.

This is a valuable property because it allows developers to
revert to a previous version of the repository history reliably.
It also makes it possible to have immensely complicated branching histories of
the repository, without having to worry about
the repository history losing its integrity.

Committing changes is done by using the `git commit` command:

```sh
git commit -m "Some commit message"
```

The `-m` flag is used to specify a commit message.

>**Note:** The commit message should be short and to the point.
>Preferably the first line of the message should be no longer than 50 characters.
>This is done to make it easier to read the commit message in a terminal.

To write the commit message in a text editor instead of in the terminal,
use the flag instead:

```sh
git commit
```

This will open the default text editor for the system,
which can be configured in the `~/.gitconfig` file.

## Merge

**Merging** is the process of combining changes from two different branches
into a single branch.
This is done by using the `git merge` command:

```sh
git merge some-branch-name
```

This will *merge* the changes from the `some-branch-name` branch
to the current branch.
If there are any conflicts, the developer will have to resolve them manually.
They will be marked in the files with `<<<<<<<`, `=======`, and `>>>>>>>`.
This is equivalent to a *pull request* but is done locally.

## Pull

**Pulling** is the process of getting changes from a remote repository
and merging them into the local repository. This **pulls** the changes
from the remote repository into the local repository.
If necessary, it will also *merge* the changes into the local repository.

>**Note:** It is a good idea to pull changes from the remote repository
>before pushing changes to the remote repository.
>This is because if someone else has pushed changes to the remote repository
>since the last time you pulled changes from the remote repository,
>you will have to *merge* those changes into your local repository.
>It is easier to do this before you push your changes to the remote repository.

To *pull* changes from a remote repository, the `git pull` command is used:

```sh
git pull remote-name branch-name
```

The `remote-name` is the name of the remote repository.
By default, the remote repository is named `origin` and
could represent a repository on [GitHub][github-zk], GitLab, or any other place.

## Push

**Pushing** is the process of sending changes from a local repository to
a remote repository to be merged into the remote repository history.
When *pushing* changes to a remote repository,
the remote repository will check if the changes can be merged
without causing any conflicts.
If there are no conflicts, the changes will be merged into the
remote repository history.
If the server requires it, those changes might be pushed to a *pull request*.
This is a request to merge the changes into the main repository,
where maintainers can review the changes and decide if they want to merge them.

To *push* changes to a remote repository, the `git push` command is used:

```sh
git push remote-name branch-name
```

The `remote-name` is the name of the remote repository.
By default, the remote repository is named `origin` and
could represent a repository on [GitHub][github-zk], GitLab, or any other place.

The `branch-name` is the name of the branch to push the changes to.
By default, the branch name is `main`, which is usually the default branch name.
When a different branch name is used, it is usually because the developer
is working on a feature or bug fix, and they want to keep the changes
separate from the main branch and will typically involve a *pull request* to
merge the developers' branch into the main branch of the server.

## GitHub

**Git** is often associated with [**GitHub**][github-zk] which
is a web-based software hosting service that makes use of Git to
create its multitude of software development workflows.

There are a lot of features and workflows in [GitHub][github-zk],
too many that it deserves its own document.
But here there are some of the most common ones:

* Software repository
* Code viewer
* Bug tracking
* Continuous Integration / Continuous Deployment (CICD)
* Codespaces

## References

### Web Links

* [Git (from Wikipedia, the free encyclopedia)][git-wiki]

<!-- Hidden References -->
[git-wiki]: https://en.wikipedia.org/wiki/Git "Git (from Wikipedia, the free encyclopedia)"

### Note Links

* [GitHub][github-zk]

<!-- Hidden References -->
[github-zk]: ./github.md "GitHub"
