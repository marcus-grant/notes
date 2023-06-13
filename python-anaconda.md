---
created: 2023-06-13T14:41:03.292Z
modified: 2023-06-13T15:41:06.000Z
tags: [anaconda,conda,python,distribution,package,manage,install,virtual,environment,data,science,analysis]
---
# Anaconda and Conda (Python Distribution)

## Introduction

>Anaconda is a distribution of the [Python][-py] and
>R programming languages for scientific computing
>(data science, machine learning applications,
>large-scale data processing, predictive analytics, etc.),
>that aims to simplify [package management][-pkg-mgmt] and deployment.
>The distribution includes data-science packages suitable for
>[Windows][-win], [Linux][-linux], and [macOS][-macos].
>It is developed and maintained by [Anaconda, Inc.][anaconda-home],
>which was founded by Peter Wang and Travis Oliphant in 2012.
>
>--[Wikipedia (2023)][wiki-anaconda]

## Conda

Conda is a [package manager for Python][-py-version].
It is very similar to [pip][-pip],
but it can also be used to
manage python itself.

### Install Conda

There are [various ways to install conda][conda-install].
Here we'll focus on UNIX-like [command line][-cli] installation.

```bash
mkdir -p ~/.local/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/.local/miniconda.sh
bash ~/.local/miniconda.sh -b -u -p ~/.local/miniconda3
rm -rf ~/.local/miniconda.sh
~/.local/miniconda3/bin/conda init
```

Then you'll want to add this path to your `PATH` environment variable.
See [BASH][-bash] or [ZSH][-zsh] for more information.

### Create a Virtual Environment

You can create a new environment in two ways;
via the command line or via a `yaml` file.
Below is how you do it manually with a command line.

```bash
conda create --name env python=3.5
```

This will create a new environment called `env`.
You can also do this via a `yaml` file.

```yaml
name: env
dependencies:
  - python=3.8
  - numpy
  - pandas
  - matplotlib
  - jupyter
```

Then you can create the environment with the following command.

```bash
conda env create -f environment.yml
```

### Activate Conda Environment

To activate a conda environment, use the following command.

```bash
conda activate env
```

### Install Packages

To install a package, use the following command.

```bash
conda install numpy
```

You can also install conda forge packages.

```bash
conda install -c conda-forge gym=0.18.0
```

### Store Environment in a File

To store the environment in a file, use the following command.

```bash
conda env export > environment.yml
```

## References

### Web Links

* [Wikipedia. "Anaconda (Python Distribution)". Accessed 2023-06-13][wiki-anaconda]
* [Anaconda. anaconda.com "Anaconda Home"][anaconda-home]
* [Anaconda Inc. "Install Conda"][conda-install]

<!-- Hidden References -->
[wiki-anaconda]: https://en.wikipedia.org/wiki/Anaconda_(Python_distribution) "Wikipedia. 'Anaconda (Python Distribution)'"
[anaconda-home]: https://www.anaconda.com/ "Anaconda. anaconda.com 'Anaconda Home'"
[conda-install]: https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html "Anaconda Inc. 'Install Conda'"

### Note Links

* [Python][-py]
* [Package Manager (Operating Systems and Software Distribution)][-pkg-mgmt]
* [Windows (Operating System)][-win]
* [Linux (Operating System)][-linux]
* [macOS (Operating System)][-macos]
* [Python Version Management][-py-version]
* [Command Line Interface (CLI)][-cli]
* [BASH][-bash]

<!-- Hidden References -->
[-py]: python.md "Python"
[-pkg-mgmt]: pkg-mgmt.md "Package Manager (Operating Systems and Software Distribution)"
[-win]: windows.md "Windows (Operating System)"
[-linux]: linux.md "Linux (Operating System)"
[-macos]: macos.md "macOS (Operating System)"
[-py-version]: python-version.md "Python Version Management"
[-pip]: pip.md "Python Package Installer (PIP)"
[-cli]: cli.md "Command Line Interface (CLI)"
[-bash]: bash.md "BASH"
[-zsh]: zsh.md "ZSH"
