---
created: 2023-02-23T09:13:34.013Z
modified: 2023-03-01T16:31:39.036Z
tags: [github,git,version,control,software,repository,collaborate,pcde,module9]
---
# GitHub

According to [Wikipedia][github-wiki]:

>GitHub, Inc. (/ˈɡɪthʌb/[a]) is an Internet hosting service for
>software development and version control using [Git][git-zk].
>It provides the distributed version control of Git plus access control,
>bug tracking, software feature requests,
>task management, continuous integration, and wikis for every project.

It is located at [GitHub.com][github-homepage] and as mentioned,
provides many common workflows for software development and of course
the main purpose of storing version trees of software projects.

## Repository

A repository is a collection of files and folders that are tracked by
their changes in time using [git][git-zk].
But they are not limited to just the source code on a single server,
they can be spread across multiple servers and clients,
and can be merged together at any moment to continue development in
sync with the rest of the team.

It is this quality that makes [git][git-zk] and **GitHub** such a
powerful tool for software development.
It all comes together in a shared *repository* on **GitHub**,
and changes are made on the local *repository* on each developer's machine.

### Pull Request

When a developer wants to merge their changes into the main repository,
they create a *pull request*.
This is a request to merge their changes into the main repository.
And whoever is in charge of the main repository can review the changes
and merge them into the main repository.

### Fork

When a developer wants to make changes to a repository that they do not
have access to, or does not want to disrupt the main repository,
they can *fork* the repository.
This creates a copy of the repository on their own account,
and they can make changes to it without affecting the main repository.
Then when they are done, they can create a *pull request* to
merge their changes into the main repository.

## Typical Workflows

### Fork and Pull

This is the most common workflow for **GitHub**.
It is used by most open source projects.
It is also the default workflow for **GitHub**.

To start working on a project, you first *fork* the repository.
This creates a copy of the repository on your own account.
Then you *clone* the repository to your local machine.
Then you make changes to the repository on your local machine.
When you are done, you *push* the changes to your *fork* on **GitHub**.
Then you create a *pull request* to merge your changes into the main repository.

When it's your own repository, you can skip the *fork* step and
focus on *branching* and *merging*.
It follows the workflow steps outlined in [Git][git-zk],
but in the order of:

1. *Fork* the repository - if necessary
2. *Clone* the repository using `git clone`
3. *Branch* the repository to make a specific change using `git checkout -b`
4. *Stage* the changes to be committed using `git add`
5. *Commit* the changes using `git commit`
6. *Pull* the latest changes from the main repository using `git pull` to
the main branch
7. *Merge* the changes from the main branch into your branch using `git merge`
8. *Push* the changes to your *fork* on **GitHub** using `git push`.
**NOTE**: If not using a *fork*,
then *push* the changes to the main repository using `git push`
9. *Create* a *pull request* to merge your changes into the main repository.

## Pages

### What is GitHub Pages?

*GitHub Pages* can be used to host the content of your repositories or
projects directly on a website.

You can find more information about *GitHub Pages* and its documentation on
the official website:
[Getting Started with GitHub Pages][start-github-pages-docs].

### How Can I Set Up GitHub Pages?

In order to use GitHub Pages for your repository,
first you need to create a repository for your site.
To do so, navigate to your GitHub accounts and create a new repository:

![screen-gh-pages-new](2023-02-28-15-07-37.png
"Screenshot of GitHub account to create new page")

Name your repository.
Be aware that, in this case,
the name of the repository has to be very specific.
It's going to be: `<your_username.github.io>`.
Set the repository to be public,
select the option to add a `README.md` file and, finally, select "Create Repository".

![github-create-page-repo](2023-02-28-15-16-51.png
"Screenshot of creating a new repository for GitHub Pages")

Now, by following the steps that Dr. Williams will demonstrate in Video 9.7,
you will be able to link any of your personal repositories to GitHub Pages,
and you will be able to see the content of your repository on a website.

For any troubleshooting,
you can visit the [GitHub Pages Documentation][gh-pages-docs].

## Tips & Tricks

***TODO***

## References

### Web Links

* [GitHub Homepage][github-homepage]
* [GitHub (from Wikipedia, the free encyclopedia)][github-wiki]
* [Check if git repo is public with HTTP request][http-check-repo-public-stackoverflow]
* [Getting Started with GitHub Pages (from docs.github.com)][start-github-pages-docs]
* [GitHub Pages Documentation][gh-pages-docs]

<!-- Hidden References -->
[github-homepage]: https://github.com "GitHub Homepage"
[github-wiki]: https://en.wikipedia.org/wiki/GitHub "GitHub (from Wikipedia, the free encyclopedia)"
[http-check-repo-public-stackoverflow]: https://stackoverflow.com/a/54964584 "Check if git repo is public with HTTP request"
[start-github-pages-docs]: https://docs.github.com/en/pages/getting-started-with-github-pages "Getting Started with GitHub Pages (from docs.github.com)"
[gh-pages-docs]: https://docs.github.com/en/pages "GitHub Pages Documentation"

### Note Links

* [Git][git-zk]

<!-- Hidden References -->
[git-zk]: ./git.md "Git"
