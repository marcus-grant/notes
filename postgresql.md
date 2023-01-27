---
tags: [postgresql,pgsql,db,data,storage]
created: 2023-01-02T10:33:12.550Z
modified: 2023-01-02T10:33:12.550Z
---
# PostgreSQL

Overview here

## Initialize a Database (Cluster?)

### initdb

To initialize a database after it has been installed natively on a host, it needs to be initialized first. Part of this is to use the [`initdb`][pgsql-docs-initdb] command. It can be invoked using the `pg_ctl initdb` command/subcommand.

It must be run as the user that will own the database server process for security reasons. This can be overriden by for example allowing group control, however this is inadvisable. **NOTE** because `initdb` will create data directories it might not have permissions to create those, so they should be created by root or a sudo user first then use the `chown` command to give the postgres user ownership of those directories.



## Complete Installation / Deletion of PostgreSQL

Sometimes it's necessary to remove all trace of a database, particularly for testing and redeployment situations. Here we'll see how to completely get rid of all traces of it.

### Uninstall & Remove Postgres on Debian

First, get rid of the OS package, in this case using `apt` on Debian-based systems.

```sh
sudo apt --purge remove postgresql
sudo apt purge postgresql*
sudo apt --purge remove postgresql postgresql-doc postgresql-common
```

### Search for Other Packages that Might Be Used with Postgres

Perhaps there's optional packages that were installed, let's `grep` for any package names using `dpkg` to see if there's any others.

```sh
dpkg -l | grep postgres
```

Then remove *(purge)* the rest and pretend all the packages are included in the variable `$PGSQL_PKGS_FOR_PURGE`.

```sh
sudo apt --purge remove $PGSQL_PKGS_FOR_PURGE
```

### Remove all Postgres Data & Directories

Use the [coreutil]() command, `rm` to remove the directories and files used by PostgreSQL. Using the `-rf` arguments to remove all directories `r`ecursively & `f`orcefully to override any warnings about deletion.

```sh
sudo rm -rf /var/lib/postgresql/
sudo rm -rf /var/log/postgresql/
sudo rm -rf /etc/postgresql/
```

## References

* [PostgreSQL Docs: InitDB][pgsql-docs-initdb]
* [ObjectRocker: How to Completely Uninstall PostgreSQL][objrocket-remove-pgsql]

<!-- Hidden References -->
[pgsql-docs-initdb]: https://www.postgresql.org/docs/current/app-initdb.html "PostgreSQL Docs: InitDB"
[objrocket-remove-pgsql]: https://kb.objectrocket.com/postgresql/how-to-completely-uninstall-postgresql-757 "ObjectRocker: How to Completely Uninstall PostgreSQL"

