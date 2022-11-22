# Ansible Module in Bash

Create custom Ansible modules using BASH & Linux shell.

## Overview

Normally [Ansible](ansible.md) modules are built [using its native python](ansible-module-python.md). However, using its JSON API it's possible to make just about any programming language or even in this case shell that can create JSON to work as an ansible module.

## Environment

For developing shared resources like this it can be helpful to have a library directory. Go to your working directory where most code is stored, and create a library directory.

```sh
mkdir $PROJECTS_DIRECTORY/lib
```

## Create Module File

Next create the script file using [coreutil](coreutils.md) `touch`. It will be called `os_type.sh` because its purpose is to check the Ansible controlled host for what type of OS it is.

```sh
touch $PROJECT_DIRECTORY/lib/os_type.sh
```

## Edit the Module Script

```sh
#!/bin/bash 

OS="$(uname)" 

echo "{ \"changed\": false, \"operating_system\": \"$OS\" }"
```

The code is pretty simple. It gets the `OS` from the [coreutil](coreutils.md) command `uname`.Then the magic to make it work with [Ansible](ansible.md), it has to spit out properly formatted JSON when ansible calls it to stdout.

The JSON that [Ansible](ansible.md) expects can be of any magic variable that ansible uses, particularly `changed` is important because it determines how Ansible informs the task the state of the task running this module. Next is the ansible variable that will be output from this task, `operating_system`. This is custom for this module and any desired output variable can be defined for the module to be accessed by tasks later.

## Using the Module in Ansible

For the sake of practice, create a `module_test.yml` play to test out the module.

```sh
touch module_test.yml
```

Then edit the play to use the `os_type` module just created.

```yml
---
- hosts: localhost
  tasks:
  - name: Testing our bash-based module
  os_type:
  register: result
  - name: Debug the var created from the bash-based module
    var: result
```

## The Expected Output of an Ansible Module

Running the above play, should return something like this:

```sh
ansible-playbook -i hosts module_test.yml
PLAY [127.0.0.1] ***************************************
TASK [Gathering Facts] ********************************* 
ok: [127.0.0.1] 
TASK [testing our new module] ************************** 
ok: [127.0.0.1] 
TASK [debug] ******************************************* 
ok: [127.0.0.1] => {
     "result": {
         "changed": false,
         "failed": false,
         "meta": {
             "operating_system": "Linux"
         }
     }
 }
PLAY RECAP **********************************************
127.0.0.1: ok=3    changed=0    unreachable=0    failed=0
```


## References

* [Vince Sesto on Splunk User Developer Administration: Creating Ansible Modules in Bash][medium-ansible-module-bash]
* [Github: Writing Ansible Modules in BASH (by pmarkham)][gh-pmarkham]

<!-- Hidden Reference -->

[medium-ansible-module-bash]: https://medium.com/splunkuserdeveloperadministrator/creating-ansible-modules-in-bash-c2cd299a3688 "Vince Sesto: Creating Ansible Modules in Bash"
[gh-pmarkham]: https://github.com/pmarkham/writing-ansible-modules-in-bash "Github: Writing Ansible Modules in BASH (by pmarkham)"

