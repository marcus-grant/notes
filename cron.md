---
created: 2023-07-11T14:07:02.719Z
modified: 2023-07-11T15:07:05.000Z
tags: [cron,unix,linux,operation,system,schedule,manage,time,shell]
---
# Cron

## Introduction

>The **`cron`** [command-line][-cli] utility is a job scheduler on
>[Unix-like][-unix] [operating systems][-os].
>Users who set up and maintain software environments use cron to schedule jobs
>(commands or [shell scripts][-langs-shell]),
>also known as *cron jobs*, to run periodically at fixed times,
>dates, or intervals.
>It typically automates system maintenance or
>administration—though its general-purpose nature makes it useful for
>things like downloading files from the Internet and
>downloading email at regular intervals.
>
>--[(Wikipedia 2023)][wiki-cron]

## Overview

The actions of `cron` are driven by a crontab (cron table) file,
a configuration file that
specifies shell commands to run periodically on a given schedule.
The crontab files are stored where the lists of jobs and
other instructions to the cron daemon are kept.
Users can have their own individual crontab files and
often there is a system-wide crontab file
(usually in `/etc` or a subdirectory of `/etc` e.g. `/etc/cron.d`) that
only system administrators can edit.
Each line of a crontab represents a single scheduled job with
a *cron expression* syntax to define how often it should run.

### Cron Expressions

```txt
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * <command to execute>
```

## References

### Web Links

* [Wikipedia Contributors. wikipedia.org. 2023. "cron"][wiki-cron]
<!-- Hidden References -->
[wiki-cron]: https://en.wikipedia.org/wiki/Cron "Wikipedia.org cron"

### Note Links

* [Command Line Interface (CLI)][-cli]
* [UNIX (Operating System)][-unix]
* [Operating System (OS)][-os]
* [Programming Language: Shell Scripting][-langs-shell]

<!-- Hidden References -->
[-cli]: cli.md "Command Line Interface (CLI)"
[-unix]: unix.md "UNIX (Operating System)"
[-os]: os.md "Operating System (OS)"
[-langs-shell]: ./programming-language.md#shell-scripting-languages "Programming Language: Shell Scripting"
