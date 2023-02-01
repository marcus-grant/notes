---
created: 2023-01-31T17:13:58.764Z
modified: 2023-02-01T11:44:28.744Z
tags: [sql,date,time,data,database,pcde,module6]
---
# Dates & Time in SQL

Date & Time in the context of data is a powerful source we
can leverage to interpret.
Now it could also be a tremendous amount of confusion.

* The use of various time formats lead to confusion; such formats are:
  * Time with irregular boundraries
  * Confusing timezone boundraries
  * Different daylight saving times intervals
  * Servertime:
    * UTC
    * GMT
* The substitution of a local time zone
with a different timezone result in some lost meaning
* Discrepencies are also caused by
the time difference between server and local time

You can quickly see how these discrepencies
and variations can lead to frequent confusion.
Luckily,
the environment of the database allows us to interrogate it and
ask what the server time is.
The command to do so is the following `@@global` & `@@session`.

## Timezone querying

There are keywords following `@@` symbols,
`@@global.time_zone` & `@@session.time_zone`
will query for the global & local session timezones respectively.
They both will normally depend on the local operating system.
Global will specify the whole database's timezone handling.
The session depends on the session and can differ between databases & views.

## Timezone Functions

Due to the importance of handling date time & its inherent complexity,
there are a bunch of different timezone functions:

```sql
SELECT now();
SELECT YEAR(now());
SELECT MONTH(now());
SELECT DAY(now());
SELECT TIME(now());
SELECT HOUR(now());
SELECT MINUTE(now());
SELECT SECOND(now());
```

You have functions like `NOW()` that will return a current date/time stamp.
Then you can select from date/time stamps specific units of time like
`YEAR`,`DAY`,`MINUTE`, etc.
Many others exist that will be listed here.

## Time & Date Functions

* ADDDATE()
  * Adds a time value with a date
* ADDTIME()
  * Returns a time or datetime after adding a time value with a time or datetime
* CONVERT_TZ()
  * Converts a datetime value from
a time zone specified as the second argument to
the time zone specified as the third argument
* CURRENT_DATE()
  * Returns the current date in ‘YYYY-MM-DD’ format or
YYYYMMDD format depending on whether numeric or
string values are used in the function
* CURRENT_TIME()
  * Returns the current time in ‘HH:MM:SS’ format or
HHMMSS format depending on whether numeric or string values are used in the function
* CURRENT_TIMESTAMP()
  * Returns the current date and time in ‘YYYY-MM-DD HH:MM:SS’ format or
YYYYMMDDHHMMSS format depending on
whether numeric or string values are used in the function
* DATE_ADD()
  * Adds time values to a date value
* DATE()
  * Takes the date part out of a datetime expression
* DATEDIFF()
  * Returns the number of days between two dates or datetimes
* DAYOFMONTH()
  * Returns the day of the month for a given date
* DAYOFYEAR()
  * Returns day of the year for a date of a datetime
* FROM_UNIXTIME()
  * Returns a date or time from a version of Unix timestamp
* GET_FORMAT()
  * Converts a date or time in a formatted manner as specified by the arguments
* LOCALTIME()
  * Returns the value of current date and time in ‘YYYY-MM-DD HH:MM:SS’ format or
YYYYMMDDHHMMSS format depending on the context (numeric or string) of the function
* MAKEDATE()
  * Returns date by taking a value of a year and a number of days
* MAKETIME()
  * Returns a time value from a given hour, minutes, and seconds
* SUBDATE()
  * Subtracts a time value from a given date
* SUBTIME()
  * Subtracts one datetime value from another
* TIMEDIFF()
  * Returns the difference between two time or datetime expressions
* TO_DAYS()
  * Returns the number of days between a given date and year 0
* UTC_DATE()
  * Returns the current UTC date as a value
* UTC_TIME()
  * Returns the current UTC time as a value
* WEEKDAY()
  * Returns the index of the day in a week for
a given date (0 for Monday, 1 for Tuesday, etc.)

## References

### Web Links

<!-- Hidden References -->

### Note Links

<!-- Hidden References -->

### Referenced By

* [SQL Overview][sql-zk]
* [PCDE Course Overview][pcde-overview-zk]
* [PCDE Course Module 6 Content][pcde-mod6-zk]

<!-- Hidden References -->
[sql-zk]: ./sql.md "SQL Overview"
[pcde-overview-zk]: ./pcde-course-overview.md "PCDE Course Overview"
[pcde-mod6-zk]: ./pcde-module6-content.md "PCDE Course Module 6 Content"
