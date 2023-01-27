---
created: 2023-01-23T20:49:51.588Z
modified: 2023-01-25T09:17:25.000Z
tags: [pcde,data,module5,course,database,sql]
---

# PCDE Course Content for Module 5

## Self Study Drag Drop Activity 5.1

SELECT *(statements)* are composed of *clauses.
The keyword SELECT determines which*(columns)*
you want from the table.
SELECT*statements*can contain multiple*clauses*.
For example,*(WHERE)*
allows you to filter and*(GROUP BY)*
allows you to bring records together.

Mastering SELECT *statements* is very important as they are
extremely helpful when it comes to *(improving)*
your workflow,
helping you process your *(data)*,
and simplifying your work.

Another thing to keep in mind when working with
SELECT *statements* is that order *(matters)*.
A Select *statement* always *(begins)*
with the keyword SELECT.
You can't use the *clause* *(FROM)*
first and then SELECT.

In conclusion,
there are several *(clauses)*
that you can combine to create a SELECT *statement*
Additionally,
you will often use a number of these when you're *(querying)*
or when you're retrieving information.
Finally,
the order matters and each *(SELECT)*
*statement* must contain the SELECT *clause*.

## Activity 5.1

This will be a summary of prompts and solutions.

### Show all Tables

To show all the tables in the `Education` database:

```sql
USE education;
SHOW Tables;
```

### Retrieve all Records FROM a Table

To show all the records and columns of a table:

```sql
USE education;
SELECT * FROM Colleges;
```

### Retrieve all Records FROM Students Table

```sql
USE education;
SELECT * FROM Students;
```

### Retrieve all Records From Colleges Table WHERE City is New York

```sql
SELECT *
FROM Colleges
WHERE City='New York'
```

### SELECT City, Region, Country from Colleges Table WHERE City is New York

```sql
USE education;
SELECT City, Region, Country
FROM Colleges
WHERE City='New York'
```

### Same as above but Region AS State

```sql
SELECT City, Region AS State, Country
FROM Colleges
WHERE City='New York';
```

### Concatenate Columns

Concatenate City, Region `AS` `Location` Column with `,` separating City & Region.

```sql
SELECT City, Region,
    CONCAT(City, ', ', Region) AS Location
FROM Colleges;
```

### Arithmetic on Columns

Select `Students` column from `Colleges` table.
However, the number of students should be computed to another value.
First multiply by `10 000` then subtract by `35 000`.

```sql
SELECT Students*10000-35000 AS Population
FROM Colleges;
```

## Quiz 5.2: Queries

### Q1

What is the purpose of using the FROM clause in a SELECT statement?

* To specify the name of the table from which records are retrieved
  * **Correct**
* To specify the order of records to be retrieved from the table
* To specify the name of the database from which records are retrieved
* To specify the No. records to be retrieved

### Q2

What is the purpose of using the ORDER BY clause in a SQL statement?

* To select the data
* To update the data
* To delete the data
* To sort the data
  * **Correct**

### Q3

Does the order of the clauses matter in a SELECT statement?

* The order of the clauses depends on the database being used
* Yes, the order of the clauses matter?
  * **Correct**
* The order of the clauses depends on the table used
* No, the order of the clauses doesn't matter

### Q4

What is the purpose of using the GROUP BY clause in a SQL statement?

* To filter out unwanted data
* To filter groups
* To sort rows
* To group rows together
  * **Correct**

## Activity 5.3: The WHERE Clause

### The WHERE Clause

The `WHERE` clause is one of the most important SQL commands as it
allows you to specify search conditions.

Typically the syntax to use the `WHERE` clause is:

```sql
SELECT columns_list FROM table_name WHERE search_conditions
```

As you know the `education` database contains two tables:
`Colleges` & `Students`.

### SELECT Records I

Assume that the column Students in the Colleges table displays the number of
students attending each university in thousands.
What is the correct syntax to select records if
the student population is greater than 12,000?

In the file window,
type the correct syntax to select the records from
the Colleges table as described above.

It should look like this table:

| CollegeID | Name          | Students | City        | Region | Country |
| --------- | ------------- | -------- | ----------- | ------ | ------- |
| 4         | Stanford      | 17       | Stanford    | CA     | USA     |
| 6         | Columbia      | 31       | New York    | NY     | USA     |
| 7         | Harvard       | 23       | Cambridge   | MA     | USA     |
| 9         | Johns Hopkins | 24       | Baltimore   | MD     | USA     |
| 10        | Northwestern  | 21       | Evanston    | IL     | USA     |
| 11        | Duke          | 15       | Durham      | NC     | USA     |
| 12        | Cornell       | 22       | Ithaca      | NY     | USA     |
| 14        | UCLA          | 32       | Los Angeles | CA     | USA     |
| 15        | Berkeley      | 42       | Berkeley    | CA     | USA     |
| 17        | Michigan      | 45       | Ann Arbor   | MI     | USA     |
| 18        | USC           | 44       | Los Angeles | CA     | USA     |
| 20        | NYU           | 51       | New York    | NY     | USA     |

#### Solution

```sql
USE education;
SELECT *
FROM Colleges
WHERE Students > 12;
```

### SELECT Records II

Select all the entries from the Colleges table where Country is equal to USA.
In the file window,
type the correct commands to
retrieve all the commands according to the instructions above.

Should result in this query output

| CollegeID | Name          | Students | City        | Region | Country |
| --------- | ------------- | -------- | ----------- | ------ | ------- |
| 1         | MIT           | 11       | Cambridge   | MA     | USA     |
| 2         | Brown         | 9        | Providence  | RI     | USA     |
| 3         | Dartmouth     | 6        | Hanover     | NH     | USA     |
| 4         | Stanford      | 17       | Stanford    | CA     | USA     |
| 5         | Yale          | 12       | New Haven   | CT     | USA     |
| 6         | Columbia      | 31       | New York    | NY     | USA     |
| 7         | Harvard       | 23       | Cambridge   | MA     | USA     |
| 8         | Princeton     | 9        | Princeton   | NJ     | USA     |
| 9         | Johns Hopkins | 24       | Baltimore   | MD     | USA     |
| 10        | Northwestern  | 21       | Evanston    | IL     | USA     |
| 11        | Duke          | 15       | Durham      | NC     | USA     |
| 12        | Cornell       | 22       | Ithaca      | NY     | USA     |
| 13        | Notre Dame    | 9        | Notre Dame  | IN     | USA     |
| 14        | UCLA          | 32       | Los Angeles | CA     | USA     |
| 15        | Berkeley      | 42       | Berkeley    | CA     | USA     |
| 16        | Georgetown    | 5        | Washington  | DC     | USA     |
| 17        | Michigan      | 45       | Ann Arbor   | MI     | USA     |
| 18        | USC           | 44       | Los Angeles | CA     | USA     |
| 19        | Tufts         | 11       | Medford     | MA     | USA     |
| 20        | NYU           | 51       | New York    | NY     | USA     |

#### Solution

```sql
USE education;
SELECT *
FROM Colleges
WHERE Country = 'USA'
```

And how many records does the above command return? *20* **(Correct)**

### SELECT Records III

Suppose that now you want to know all students who
have friends who also attend college.
In the file window,
type the correct commands to retrieve all students that
have friends in university.

**HINT**: Take a close look at the Students table.

The correct query output should be this table:

| S.ID | C.ID | F.ID | FName | LName | BDate    | Email           | Phone      | City     | Rg. |
| ---- | ---- | ---- | ----- | ----- | -------- | --------------- | ---------- | -------- | --- |
| 1    | 1    | 10   | Nancy | Davol | 48-12-08 | nan@gmail.com   | 3602348488 | Seattle  | WA  |
| 2    | 9    | 5    | Andy  | Fulle | 52-02-19 | andy@y.com      | NULL       | Dallas   | TX  |
| 3    | 8    | 1    | Jane  | Lever | 63-08-30 | j@hotmail.com   | 7866344522 | Miami    | FL  |
| 4    | 3    | 9    | Marge | Pecok | 37-09-19 | mag@outlk.com   | NULL       | Phoenix  | AZ  |
| 5    | 4    | 2    | Steve | Buch  | 55-03-04 | steve@appl.com  | NULL       | Denver   | CO  |
| 6    | 7    | 8    | Mike  | Suya  | 63-07-02 | mike@icld.com   | 5415447733 | Portland | OR  |
| 7    | 6    | 3    | Rob   | King  | 60-05-29 | rob@gmail.com   | NULL       | SanFran. | CA  |
| 8    | 5    | 7    | Laura | Call  | 58-01-09 | laura@gmail.com | 9014258913 | Memphis  | TN  |
| 9    | 2    | 4    | Anne  | Dods  | 66-01-27 | anne@msn.com    | NULL       | Portland | ME  |
| 10   | 1    | 6    | Ivy   | John  | 86-01-20 | ivy@gmail.com   | NULL       | Chicago  | IL  |

### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE FriendID IS NOT NULL;
```

### SELECT Records IV

Assume now that you want to
know how many students were born after January 1, 1993.
In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

After typing the correct syntax,
you should see the following output:

| S.ID | C.ID | F.ID | F.Name | LName  | B.Date   | Email        | Phone       | City     | Region |
| ---- | ---- | ---- | ------ | ------ | -------- | ------------ | ----------- | -------- | ------ |
| 11   | 1    | NULL | Ana    | Truji  | 98-10-08 | ana@g.com    | 3604572258  | Seattle  | WA     |
| 13   | 5    | NULL | Anton  | Moreno | 93-03-23 | tony@h.com   | NULL        | Miami    | FL     |
| 14   | 7    | NULL | Liz    | Brown  | 97-01-11 | beth@out.com | 4803242178  | Phoenix  | AZ     |
| 15   | 3    | NULL | Ann    | Devon  | 95-04-24 | ann@appl.com | NULL        | Denver   | CO     |
| 16   | 2    | NULL | Ariel  | Cruz   | 93-02-12 | ari@icld.com | 5416524565  | Portland | OR     |
| 18   | 10   | NULL | Marie  | Bert   | 98-09-29 | marie@gm.com | NULL        | Memphis  | TN     |
| 19   | 4    | NULL | Philip | Cramer | 96-07-17 | phil@msn.com | 20744366524 | Portland | ME     |
| 20   | 8    | NULL | Mike   | Holz   | 96-02-25 | mike@g.com   | NULL        | Chicago  | IL     |

#### Solution

```sql
SELECT *
FROM Students
WHERE BirthDate > '1993-01-01';
```

### SELECT Records V

Finally,
assume you want to retrieve all the records of the students that
didn’t register a phone number.
In the file window,
type the correct commands to
retrieve the records in the Student table as described above.

After typing the correct syntax, you should see the following output:

| S.ID | C.ID | F.ID | F.Name   | L.Name    | B.Date     | Email          | Phone | City     | Rg. |
| ---- | ---- | ---- | -------- | --------- | ---------- | -------------- | ----- | -------- | --- |
| 2    | 9    | 5    | Andrew   | Fuller    | 1952-02-19 | andy@y.com     | NULL  | Dallas   | TX  |
| 4    | 3    | 9    | Margaret | Peacock   | 1937-09-19 | mags@out.com   | NULL  | Phoenix  | AZ  |
| 5    | 4    | 2    | Steven   | Buchanan  | 1955-03-04 | steve@appl.com | NULL  | Denver   | CO  |
| 7    | 6    | 3    | Robert   | King      | 1960-05-29 | rob@gmail.com  | NULL  | SanFran. | CA  |
| 9    | 2    | 4    | Anne     | Dodsworth | 1966-01-27 | anne@msn.com   | NULL  | Portland | ME  |
| 10   | 1    | 6    | Ivy      | Johnson   | 1986-01-20 | ivy@gmail.com  | NULL  | Chicago  | IL  |
| 12   | 9    | NULL | Thomas   | Hardy     | 1992-12-09 | tom@yahoo.com  | NULL  | Austin   | TX  |
| 13   | 5    | NULL | Antonio  | Moreno    | 1993-03-23 | tony@hot.com   | NULL  | Miami    | FL  |
| 15   | 3    | NULL | Ann      | Devon     | 1995-04-24 | ann@apple.com  | NULL  | Denver   | CO  |
| 18   | 10   | NULL | Marie    | Bertrand  | 1998-09-29 | marie@gm.com   | NULL  | Memphis  | TN  |
| 20   | 8    | NULL | Michael  | Holz      | 1996-02-25 | mike@gm.com    | NULL  | Chicago  | IL  |

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE Phone IS NULL;
```

## Mini Lesson 5.1: Logical Operators

The details of this lesson are covered in
the [notes about SQL logical operators][sql-logic-ops-zk]

## Codio Coding Activity 5.3: The IN, NOT IN, and BETWEEN Operators

### The IN Operator I

The IN operator allows you to specify multiple values in a WHERE clause.
The IN operator is a shorthand for multiple OR conditions.
The syntax for the IN operator is:

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
```

#### ...or

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);
```

First,
let’s try to understand how using multiple OR statements is equivalent to
using a single IN statement.

From the `Students` table,
select all the students that come from the states of
Washington, Colorado, or Illinois.
Use the multiple OR clause to achieve this.

In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

| SID | CID | FID  | FName | LName  | BDate    | Email          | Phone      | City    | Rg. |
| --- | --- | ---- | ----- | ------ | -------- | -------------- | ---------- | ------- | --- |
| 1   | 1   | 10   | Nancy | Davol  | 48-12-08 | nancy@gm.com   | 3602348488 | Seattle | WA  |
| 5   | 4   | 2    | Steve | Buchan | 55-03-04 | steve@appl.com | NULL       | Denver  | CO  |
| 10  | 1   | 6    | Ivy   | Johnsn | 86-01-20 | ivy@gmail.com  | NULL       | Chicago | IL  |
| 11  | 1   | NULL | Ana   | Trujil | 98-10-08 | ana@gmail.com  | 3604572258 | Seattle | WA  |
| 15  | 3   | NULL | Ann   | Devon  | 95-04-24 | ann@apple.com  | NULL       | Denver  | CO  |
| 20  | 8   | NULL | Mike  | Holz   | 96-02-25 | mike@gm.com    | NULL       | Chicago | IL  |

#### Solution

```sql
SELECT *
FROM Students
WHERE (Region = 'WA' OR
    Region = 'CO' OR
    Region = 'IL');
```

### The IN Operator II

Next,
we want to verify that
the same result can be achieved using a single IN operator.
In the file window,
type the correct commands to
retrieve the entries in the Students table using the IN operator.

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE Region IN ('WA', 'CO', 'IL');
```

Does the order in which you write the
values you want to select matter when
using an IN operator?

The answer is **NO**.

### Combining the IN and AND Operators

The IN and AND operators can be combined to
further refine the result of your query.

From the table Students,
select all the entries where

City is equal to Portland and CollegeID is equal to four or two.
In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

| SID | CID | FID  | FName | LName  | BDate    | Email        | Phone       | City     | Rg. |
| --- | --- | ---- | ----- | ------ | -------- | ------------ | ----------- | -------- | --- |
| 9   | 2   | 4    | Anne  | Dods   | 66-01-27 | anne@msn.com | NULL        | Portland | ME  |
| 16  | 2   | NULL | Ariel | Cruz   | 93-02-12 | ari@icld.com | 5416524565  | Portland | OR  |
| 19  | 4   | NULL | Phil  | Cramer | 96-07-17 | phil@msn.com | 20744366524 | Portland | ME  |

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE City = 'Portland' AND CollegeID IN (4, 2);
```

### The NOT IN Operator

Naturally,
the IN and NOT operators can be combined to
exclude results from your query.
The syntax when combining these two operators is:

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name NOT IN (value1, value2, ...);
```

From the Colleges table,
select all the universities that are not in
Cambridge or New York and where
Students is not equal to 11 or 9.

In the file window,
type the correct commands to visualize all the tables present in
the Colleges table according to the directions above.

After typing the correct syntax you should see the following output:

| CollegeID | Name          | Students | City        | Region | Country |
| --------- | ------------- | -------- | ----------- | ------ | ------- |
| 3         | Dartmouth     | 6        | Hanover     | NH     | USA     |
| 4         | Stanford      | 17       | Stanford    | CA     | USA     |
| 5         | Yale          | 12       | New Haven   | CT     | USA     |
| 9         | Johns Hopkins | 24       | Baltimore   | MD     | USA     |
| 10        | Northwestern  | 21       | Evanston    | IL     | USA     |
| 11        | Duke          | 15       | Durham      | NC     | USA     |
| 12        | Cornell       | 22       | Ithaca      | NY     | USA     |
| 14        | UCLA          | 32       | Los Angeles | CA     | USA     |
| 15        | Berkeley      | 42       | Berkeley    | CA     | USA     |
| 16        | Georgetown    | 5        | Washington  | DC     | USA     |
| 17        | Michigan      | 45       | Ann Arbor   | MI     | USA     |
| 18        | USC           | 44       | Los Angeles | CA     | USA     |

#### Solution

```sql
USE education;
SELECT *
FROM Colleges
WHERE City NOT IN ('Cambridge', 'New York')
    AND Students NOT IN (11, 9);
```

### The BETWEEN Operator

The BETWEEN operator selects values within
a given range.
The values can be numbers, text, or dates.

The BETWEEN operator is inclusive:
begin and end values are included.

The syntax for the BETWEEN operator is:

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

From the Students table,
retrieve the records of
all the students born between January 1, 1992 and May 1, 1998.

In the file window,
type the correct commands to
visualize all the entries in the Students table as described above.

After typing the correct syntax, you should see the following output:

| SID | CID | FID  | FName | LName  | BDate    | Email         | Phone       | City     | Rg. |
| --- | --- | ---- | ----- | ------ | -------- | ------------- | ----------- | -------- | --- |
| 12  | 9   | NULL | Thom  | Hardy  | 92-12-09 | tom@yahoo.com | NULL        | Austin   | TX  |
| 13  | 5   | NULL | Anton | Moreno | 93-03-23 | tony@hot.com  | NULL        | Miami    | FL  |
| 14  | 7   | NULL | Liz   | Brown  | 97-01-11 | beth@out.com  | 4803242178  | Phoenix  | AZ  |
| 15  | 3   | NULL | Ann   | Devon  | 95-04-24 | ann@appl.com  | NULL        | Denver   | CO  |
| 16  | 2   | NULL | Ari   | Cruz   | 93-02-12 | ari@icld.com  | 5416524565  | Portland | OR  |
| 19  | 4   | NULL | Phil  | Cramer | 96-07-17 | phil@msn.com  | 20744366524 | Portland | ME  |
| 20  | 8   | NULL | Mike  | Holz   | 96-02-25 | mike@gm.com   | NULL        | Chicago  | IL  |

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE BirthDate BETWEEN '1992-01-01' AND '1998-05-01';
```

### Putting it all together

In the last part of the activity,
let’s try to put together everything you have practiced so far.

From the Students table,
select all the records that meet the following criteria:

* `Region` is either equal to Florida or Arizona, AND
* `City` is not equal to either Phoenix or Austin, OR
* `CollegeID` is between two and six.

In the file window,
type the correct commands to
visualize all the entries in the Students table as described above.

After typing the correct syntax, you should see the following output:

| SID | CID | FID  | FName | LName  | BDate    | Email         | Phone       | City     | Rg. |
| --- | --- | ---- | ----- | ------ | -------- | ------------- | ----------- | -------- | --- |
| 3   | 8   | 1    | Janet | Leverl | 63-08-30 | jane@hot.com  | 7866344522  | Miami    | FL  |
| 4   | 3   | 9    | Marge | Peak   | 37-09-19 | mag@out.com   | NULL        | Phoenix  | AZ  |
| 5   | 4   | 2    | Steve | Buchan | 55-03-04 | stev@appl.com | NULL        | Denver   | CO  |
| 7   | 6   | 3    | Rob   | King   | 60-05-29 | rob@gmail.com | NULL        | SanFran. | CA  |
| 8   | 5   | 7    | Laura | Callan | 58-01-09 | laura@gm.com  | 9014258913  | Memphis  | TN  |
| 9   | 2   | 4    | Anne  | Dods   | 66-01-27 | anne@msn.com  | NULL        | Portland | ME  |
| 13  | 5   | NULL | Anton | Moreno | 93-03-23 | tony@hot.com  | NULL        | Miami    | FL  |
| 15  | 3   | NULL | Ann   | Devon  | 95-04-24 | ann@appl.com  | NULL        | Denver   | CO  |
| 16  | 2   | NULL | Ari   | Cruz   | 93-02-12 | ari@icd.com   | 5416524565  | Portland | OR  |
| 17  | 6   | NULL | Gio   | Rovel  | 90-09-19 | gio@gmail.com | 4156652255  | SanFran. | CA  |
| 19  | 4   | NULL | Phil  | Cramer | 96-07-17 | phil@msn.com  | 20744366524 | Portland | ME  |

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE (
    Region IN ('FL', 'AZ') AND
    City NOT IN ('Phoenix', 'Austin') OR
    CollegeID BETWEEN 2 AND 6
);
```

## Quiz 5.3: Logical Operators and Applications

### Q1

The IN operator is equivalent to:

* Combining multiple AND statements
* Combining multiple XOR statements
* Combining multiple OR statements
  * **Correct**
* All answers are correct

### Q2

The BETWEEN operator is used to:

* None of the options are correct
* Select records that are sequential in a table
* Select a range of values
  * **Correct**
* Select columns that are side-by-side in a table

### Q3

What is the meaning of the NULL operator in SQL?

* To indicate that a data value is zero in the database
* To indicate that a data value is missing in the database
* To indicate unknown values in a database
  * **Correct**
* To indicate that data is infinite in a database

### Q4

The AND operator will

* Return true if both expressions are true
  * **Correct**
* Return true if both expressions are false
* Return true if one expression is true
* Return false if both expressions are true

### Q5

The result of a lase and a true expression evaluated using the XOR operator is:

* false
* true
  * **Correct**
* Undetermined
* NULL

### Q6

The result of a false and true expression evaluated using the AND operator is:

* Undetermined
* false
  * **Correct**
* true
* NULL

### Q7

The Result of two false expressions evaluated using the AND operator is:

* false
  * **Correct**
* NULL
* true
* Undetermined

### Q8

The result of two true expressions evaluated using the OR operator is:

* NULL
* Undetermined
* true
  * **Correct**
* false

## Codio Coding Activity 5.4: Logical Operators

### The NULL Operator

The NULL operator is a placeholder for unknown information.

It must not be confused with a zero or missing value.

The syntax to use the NULL operator is:

```sql
SELECT *
FROM table_name
WHERE column_name IS NULL;
```

From the Students table,
select all the students whose phone number is unknown.
In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

After typing the correct syntax, you should see the following syntax:

Note the table has all columns,
but to save space let's just show the `StudentID`s in the result.

Student IDs in result: 2, 4, 5, 7, 9, 10, 12, 13, 15, 18, 20

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE Phone IS NULL;
```

### The NOT NULL Operator

The NOT NULL operator can be used to access records that are not null.

The syntax to use the NOT NULL operator is:

```sql
SELECT *
FROM table_name
WHERE column_name IS NOT NULL;
```

Select all the records in the Students table where FriendID is not null.
In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

After typing the correct answer, you should see the following studentIDs
1, 2, 3, 4, 5, 6, 7, 8, 9, 10

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE FriendID IS NOT NULL;
```

### Combining Operators I

Naturally,
logical operators can be combined to refine the results of your query.
From the Students table,
select all the records where Phone is NULL and City is equal to Denver.
In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

The resulting table should have student ids 5, 15

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE Phone IS NULL AND City = 'Denver';
```

### The LIKE Operator

The LIKE operator is used in a WHERE clause to
search for a specified pattern in a column.

There are two wild cards often used in conjunction with
the LIKE operator:

* The percent sign (%) represents zero, one, or multiple characters.
* The underscore sign (_) represents one, single character.

The syntax for the LIKE operator is:

```sql
SELECT column_name(s)
FROM table_name
WHERE column LIKE pattern;
```

From the Students table,
retrieve the records of all the students whose
last name starts with a D.
In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

The output will have all columns and rows for StudentIDs: 1, 15, 9

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE LastName Like 'D%';
```

### Combining Operators II

From the Colleges table,
select all the records of universities whose name start with
N and whose City also starts with N.

Answer has all `Colleges` columns with `CollegeIDs`: 13, 20

#### Solution

```sql
USE education;
SELECT *
FROM Colleges
WHERE Name LIKE 'N%' AND City LIKE 'N%';
```

### Combining Operators III

As a final exercise for this activity,
retrieve all the records from the Students table where
the area code is equal to 207 and
the email address is under a msn domain.

In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

The result has all `Students` table columns and only `StudentID` of 19 row.

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE (
    Phone LIKE '(207)%' AND
    Email LIKE '%@msn.com'
);
```

## Video 5.12 RegEx Sample Text

This sample text can be used along with the utility in [regexr.com][regexr.com].

```txt
Central Park is an urban park in New York City located between
the Upper West and Upper East Sides of Manhattan.
It is the fifth-largest park in the city by area,
covering 843 acres (341 ha).
It is the most visited urban park in the United States with
an estimated 38 million visitors annually,
and is the most filmed location in the world.
[b be bee beer beers] [she sells seashells][+1-212-360-3444]

Following proposals for a large park in Manhattan during the 1840s,
it was approved in 1853 to cover 778 acres (315 ha).
In 1857,
landscape architects Frederick Law Olmsted and
Calvert Vaux won a design competition for the park with their "Greensward Plan".
Construction began the same year;
existing structures, including a majority-Black settlement named Seneca Village,
were seized through eminent domain and razed.
The park's first areas were opened to the public in late 1858.
[bad bud bod bed bid][abcdefghijklmnopqrstuvwxyz][+1 212-310-6600]

There are 21 children's playgrounds in Central Park.
The largest, at three acres (12,000 m2), is Heckscher Playground.
Central Park includes 36 ornamental bridges,
all with different designs.
"Rustic" shelters and
other structures were originally spread out through the park.
Most have been demolished over the years,
and several have been restored.
The park contains around 9,500 benches in
three styles, of which nearly half have small engraved tablets of some kind,
installed as part of Central Park's "Adopt-a-Bench" program.
These engravings typically contain short personalized messages and
can be installed for at least $10,000 apiece.
"Handmade rustic benches" can cost more than half a million dollars and
are only granted when the honoree underwrites a major park project.
[+1 212 439 6500] [617-826-8977] [617 826 8977] [(617) 826 8977] [(617) 826-8977]
```

## Knowledge Check 5.4: RegEx Patterns (30:00)

### Q1

How are quantifiers used in Regular Expressions?

* To match a specified quantity of the previous token
  * **Correct**
* To count the number of matches in a RegEx pattern
* To count how many numbers there are in a matching pattern
* To count how long a RegEx is

### Q2

What is the correct Regular Expression to match any pattern "th" or "the"?

* `th?e/g`
* `/th{e}/g`
* `/the?/g`
  * **Correct**
* `/th-e?/g`

### Q3

Which of the following are true?

* [x] In SQL, digits can be matched by a RegEx by using the characters `\d`
* [x] RegEx can be used to find matches in a database
* [ ] None of the answer options are correct
* [ ] All of the answers are correct
* [ ] A parenthesis can be escaped by a RegEx in SQL by using `[(]`

>Incorrect

### Q4

What is the correct syntax to
match anything not enclosed between letters `a` & `c`?

* `/^[a-c]/`
  * **Correct**
* `/{a-c}/`
* `/-[a-c]/`
* `/[a-c]/`

## Discussion 5.1: Defining Regular Expressions (45:00)

### Prompt

Mastering how to apply Regular Expressions is important because
it allows you to efficiently look for patterns in a text or debug your code.

For this discussion,
choose a segment (70 words maximum)
of an article about a data engineering topic that is of
particular interest to you.

Copy and paste the text at RegExr (Links to an external site.)
and look for patterns by using at least five Regular Expressions.
Ensure that all your Regular Expressions are combinations of
characters and symbols.

In your discussion post,
include a summary of the article you found and
a list of the Regular Expressions you used in the exercise described above.
Make sure to include a detailed description of
how the Regular Expressions you chose work and what they do.

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and
questions to deepen the discussion.

### Discussion

I found an interesting
[article](http://bit.ly/3kIPEI1) by
McKinsey about setting up a scalable data pipeline,
focusing on how to organize teams around it.
This particular snippet of text talks about the digital transformation around the pandemic.

>MOST POPULAR INSIGHTS
>When will the COVID-19 pandemic end?
>Coca-Cola: The people-first story of a digital transformation
>Americans are embracing flexible work—and they want more of it
>The potential value of AI—and how governments could look to capture it
>How can individuals use their influence for positive change?
>For today’s data and technology leaders,
>the pressure is mounting to create a modern data architecture that
>fully fuels their company’s digital and
>artificial intelligence (AI) transformations.
>In just two months,
>digital adoption vaulted five years forward amid the cov19 crisis.
>Leading AI adopters
>(those that attribute 20 percent or more of
>their organizations’ earnings before interest and taxes to AI)
>are investing even more in AI in response to
>the pandemic and the ensuing acceleration of digital.

```regex
\d+ ?(percent|%)
```

This RegEx pattern matches with any number followed either
directly (without white space) or
after whitespace the percent symbol or the word percent.
This can be used to find any form of writing out percentages.
This regex will match 20 percent above.

```regex
((cov)|(Cov)|(COV))(id|ID)?(-)?19?
```

Since this article talks about the implications of COVID-19 on
the digital world,
I thought it'd be good to try a Regex that
captures all the likely variations of the expression people use.
The above regex will capture anything with
the first three letters cov in different cases.
Then it can optionally capture id or ID,
then optionally a hyphen followed by 19.

```regex
(,[a-zA-Z][a-zA-Z0-9]*|[a-zA-Z][a-zA-Z0-9]*,)
```

If you want to find all words with comma separation,
this regex is useful.
In the clip above,
the groups of characters leaders, & months get.

```regex
\w+\.
```

Maybe you might want to match the whole word ending the sentence.
This regex will get those matches,
in this case `transformations.`, `crisis.`, `digital.` in the snippet above.

```regex
\w+-\w+
```

And finally I thought It'd be useful to capture hyphenated words.
This regex will capture any compound word with a hyphen.
Like COVID-19, Coca-Cola, people-first above.

## Self-Study Drag & Drop Activity 5.2: Regular Expressions (20:00)

Regular expressions (or *(regex)*)
are a part of most major *(coding)*
languages and they can be very powerful when looking for *(patterns)*.
Despite them being very popular,
their *(syntax)*
can quickly become complicated.

First of all,
every regular expression starts and ends with a *(slash)*
symbol.
Usually,
After the closing slash symbol,
you can see a *(flag)*
that changes depending on the *(environment)*
you are working in.

Between the opening and closing symbols,
you can write a *(combination)*
of alphabet characters and symbols,
such as `%`,`*`,`-`, etc. to define which pattern you want to look for.

There are different *(character classes)*
that can help you write a regular expression.
For example,
there are various character combinations that
can be used to search for numbers, text, *(ranges)*,
or simply to *(exclude)*
portions of the text that are not in your interest.

Another important part of a regular expression are *(anchors)*.
These symbols represent the beginning of strings.
They can be thought of as *(boundaries)*
when it comes to words or *(sequences)*
in the text or code you are examining.

Lastly,
regex can contain *(quantifiers)*,
which are used to specify
how many times a certain character must appear *(consecutively)*
for your regex to return a result.

## Knowledge Check 5.5: Joins (30:00)

### Q1

What is the purpose of using the INNER JOIN keyword?

* retrieve all the records from both the tables being joined.
* retrieve the recently added records in one of the tables being joined.
* retrieve matching records from both the tables being joined.
  * **Correct**
* retrieve the non-matching records from both the tables being joined.

### Q2

How many tables are required to perform a self join?

* 3
* 4
* 2
* 1
  * **Correct**

### Q3

What is the syntax to perform a self-join?

* `SELECT column_names FROM table AS tb1 INNER JOIN table AS tb2`
`ON tb1.column = tb2.column`
  * **Correct**

### Q4

How many tables are required to perform multi-join?

* More than two
  * **Correct**
* One
* There is no query called multi-join
* Two

### Q5

What is the equivalent result of performing a full join?

* The full join keyword creates the result-set by
combining the result of both the self-join and the multi-join
* The full join keyword creates the result-set by
combining the result of both the inner and outer join
* The full join keyword creates the result-set by
combining the results of both the left and right join
  * **Correct**
* The full join keyword creates the result-set by
combining the result of both the multi-join and outer join

## Codio Coding Activity 5.5: Joining Tables (45:00)

### 1. Codio Coding Activity 5.5: Joining Tables

Not much here, select the database first for answers:

```sql
USE database_name
```

### 2. The Education Database

Before starting the activity,
let’s have one more look at the Education database.
This database contains two tables: Colleges and Students.

The Colleges table contains the following entries:

```sql
SELECT * FROM Students;
SELECT * FROM Colleges;
```

### 3. The Inner Join

The INNER JOIN keyword selects records that
have matching values in both tables.

The syntax to perform an inner join is:

```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```

As an opening exercise,
suppose you would like to join the Students and Colleges tables so that
the resulting table will display the first and last name of
every student, the city in which the student attends university,
and the corresponding entries from the original tables.

The results table should be:

| FirstName | LastName  | CollegeID | City       |
| --------- | --------- | --------- | ---------- |
| Nancy     | Davolio   | 1         | Cambridge  |
| Andrew    | Fuller    | 9         | Baltimore  |
| Janet     | Leverling | 8         | Princeton  |
| Margaret  | Peacock   | 3         | Hanover    |
| Steven    | Buchanan  | 4         | Stanford   |
| Michael   | Suyama    | 7         | Cambridge  |
| Robert    | King      | 6         | New York   |
| Laura     | Callahan  | 5         | New Haven  |
| Anne      | Dodsworth | 2         | Providence |
| Ivy       | Johnson   | 1         | Cambridge  |
| Ana       | Trujillo  | 1         | Cambridge  |
| Thomas    | Hardy     | 9         | Baltimore  |
| Antonio   | Moreno    | 5         | New Haven  |
| Elizabeth | Brown     | 7         | Cambridge  |
| Ann       | Devon     | 3         | Hanover    |
| Ariel     | Cruz      | 2         | Providence |
| Giovanni  | Rovelli   | 6         | New York   |
| Marie     | Bertrand  | 10        | Evanston   |
| Philip    | Cramer    | 4         | Stanford   |
| Michael   | Holz      | 8         | Princeton  |

#### Solution

```sql
USE education;
SELECT
    S.FirstName, S.LastName, C.CollegeID, C.City
FROM Students S
INNER JOIN Colleges C
ON S.CollegeID = C.CollegeID;
```

Aliasing Tables:
Which SQL keyword do you need to use in order to alias a table? `AS` Correct

### 4. The Left Join

The left join returns all records from the left table,
and the matched records from the right table.

The syntax to perform a left join is:

```sql
SELECT table1.column1,table1.column2,table2.column1,....;
FROM table1 
LEFT JOIN table2
ON table1.matching_column = table2.matching_column;
```

Suppose you would like to join the Students and Colleges tables so that
the resulting table will display
the last name of every student,
the name of the university that they attend,
and the matching field for for the original tables.

| LastName  | CollegeID | Name          |
| --------- | --------- | ------------- |
| Davolio   | 1         | MIT           |
| Fuller    | 9         | Johns Hopkins |
| Leverling | 8         | Princeton     |
| Peacock   | 3         | Dartmouth     |
| Buchanan  | 4         | Stanford      |
| Suyama    | 7         | Harvard       |
| King      | 6         | Columbia      |
| Callahan  | 5         | Yale          |
| Dodsworth | 2         | Brown         |
| Johnson   | 1         | MIT           |
| Trujillo  | 1         | MIT           |
| Hardy     | 9         | Johns Hopkins |
| Moreno    | 5         | Yale          |
| Brown     | 7         | Harvard       |
| Devon     | 3         | Dartmouth     |
| Cruz      | 2         | Brown         |
| Rovelli   | 6         | Columbia      |
| Bertrand  | 10        | Northwestern  |
| Cramer    | 4         | Stanford      |
| Holz      | 8         | Princeton     |

#### Solution

```sql
USE education;
SELECT S.LastName, C.CollegeID, C.Name
FROM Students S
LEFT JOIN Colleges C
ON S.CollegeID = C.CollegeID;
```

### 5. The Right Join

The RIGHT JOIN keyword returns all records from
the right table and the matching records from the left table.

The syntax to perform a right join is:

```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name
```

Suppose you would like to join the Students and Colleges tables so that
the resulting table will display
the last name and the city of every student,
the name of the university that they attend,
and the matching field for for the original tables.

The resulting table should be:

| LastName  | City          | CollegeID | Name          |
| --------- | ------------- | --------- | ------------- |
| NULL      | NULL          | 15        | Berkeley      |
| Dodsworth | Portland      | 2         | Brown         |
| Cruz      | Portland      | 2         | Brown         |
| King      | San Francisco | 6         | Columbia      |
| Rovelli   | San Francisco | 6         | Columbia      |
| NULL      | NULL          | 12        | Cornell       |
| Peacock   | Phoenix       | 3         | Dartmouth     |
| Devon     | Denver        | 3         | Dartmouth     |
| NULL      | NULL          | 11        | Duke          |
| NULL      | NULL          | 16        | Georgetown    |
| Suyama    | Portland      | 7         | Harvard       |
| Brown     | Phoenix       | 7         | Harvard       |
| Fuller    | Dallas        | 9         | Johns Hopkins |
| Hardy     | Austin        | 9         | Johns Hopkins |
| NULL      | NULL          | 17        | Michigan      |
| Davolio   | Seattle       | 1         | MIT           |
| Johnson   | Chicago       | 1         | MIT           |
| Trujillo  | Seattle       | 1         | MIT           |
| Bertrand  | Memphis       | 10        | Northwestern  |
| NULL      | NULL          | 13        | Notre Dame    |
| NULL      | NULL          | 20        | NYU           |
| Leverling | Miami         | 8         | Princeton     |
| Holz      | Chicago       | 8         | Princeton     |
| Buchanan  | Denver        | 4         | Stanford      |
| Cramer    | Portland      | 4         | Stanford      |
| NULL      | NULL          | 19        | Tufts         |
| NULL      | NULL          | 14        | UCLA          |
| NULL      | NULL          | 18        | USC           |
| Callahan  | Memphis       | 5         | Yale          |
| Moreno    | Miami         | 5         | Yale          |

#### Solution

```sql
USE education;
SELECT S.LastName, S.City, C.CollegeID, C.Name
FROM Students S
RIGHT JOIN Colleges C
ON S.CollegeID = C.CollegeID;
```

### 6. The Self Join

A self-join is a regular join, but the table is joined with itself.
The syntax to perform a self-join is:

```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name
```

What is the name of each friend in the Students table?
In other words,
by performing a self-join,
create a table that displays, as columns:

* The StudentID
* The first name of each student
* The last name of each student
* The FriendID
* The first name and last name of each friend in a column named Buddy.

**Hint**: Use the KEYWORD CONCAT to create the last column.

The resulting table should be:

| StudentID | FirstName | LastName  | FriendID | Buddy            |
| --------- | --------- | --------- | -------- | ---------------- |
| 1         | Nancy     | Davolio   | 10       | Ivy Johnson      |
| 2         | Andrew    | Fuller    | 5        | Steven Buchanan  |
| 3         | Janet     | Leverling | 1        | Nancy Davolio    |
| 4         | Margaret  | Peacock   | 9        | Anne Dodsworth   |
| 5         | Steven    | Buchanan  | 2        | Andrew Fuller    |
| 6         | Michael   | Suyama    | 8        | Laura Callahan   |
| 7         | Robert    | King      | 3        | Janet Leverling  |
| 8         | Laura     | Callahan  | 7        | Robert King      |
| 9         | Anne      | Dodsworth | 4        | Margaret Peacock |
| 10        | Ivy       | Johnson   | 6        | Michael Suyama   |

#### Solution

```sql
USE education;
SELECT
    S.StudentID,
    S.FirstName,
    S.LastName,
    F.StudentID AS FriendID,
    CONCAT(F.FirstName, ' ', F.LastName) AS Buddy
FROM Students S
RIGHT JOIN Students F
ON S.FriendID = F.StudentID
WHERE S.FriendID IS NOT NULL;
```

Why does the table above miss some records compared to
the original `Students` table?

* Because the column FriendID contains NULL entries in the original Students table
  * **Correct**
* Because the self join always displays less records that the original table
* Because the keyword concat always displays less records that the original table

## Knowledge Check 5.6: Grouping and Aggregating Data (60:00)

### Q1

Purpose of the LEFT JOIN?

* retrieve recently added records from one of the tables
* retrieve the non matching records from both tables
* retrieve all records on the left hand side of the table and
only matching records on the right
  * **Correct**

### Q2

* left join
* right join
* self join
* cross join
  * **Correct**

### Q3

* Any Column
  * **Correct**

### Q4

* order by
  * **Correct**

### Q5

* GROUP BY
  * **Correct**

### Q6

* SELECT department_name, AVG(salary) FROM employee GROUP BY department_name

### Q7

* SELECT grade_number, count(student_name) FROM student GROUP  BY grade_number

### Q8

* SELECT subject_name, MAX(marks_scored) FROM student GROUP BY subject_name

## Codio Coding Assignment 5.1: Module 5 Final Assignment: Handling a Database

### 1. The Education Database

Throughout this activity,
you will be working with the Education database that
you have explored in Module 4 and in the last two videos.

What are the commands to show the tables in a dataset?

Hint: You won’t use all of the blocks.

You will have three attempts to complete this question.
After your final attempt,
you will be able to view the correct answers for each item.

#### Solution

```sql
SHOW TABLES;
```

### 2. Displaying the Tables

Of course,
it would be more useful to visualize the content inside each table.
In the file window,
type the commands to visualize the entries in the table Colleges.

The resulting table should have all columns of the `Colleges` table,
and the `CollegeID`s should be present for all, *ie 1-20*.

#### Solution

```sql
USE education;
SELECT *
FROM Colleges;
```

### 3. Retrieving Records From a Table

Now it’s time for you to have a look at the Students table.
In the file window,
type the correct commands to retrieve the entries in the Students table.

The results should have all columns of the `Students` table and
all rows *ie 1 through 20*.

#### Solution

```sql
USE education;
SELECT *
FROM Students;
```

### 4. The WHERE Clause I

As you have learned,
the `SELECT` statement can be combined with
other clauses to retrieve records based on a particular condition.

In the next exercise,
you will be required to retrieve the records of
all the students that come from the state of Washington.

The results should have all `Students` columns and
only the rows of `StudentID`s `1` & `11`.

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE Region = 'WA';
```

### 5. The WHERE Clause II

Suppose now that you still want to select only the rows in
the Students table where Region is equal to Florida,
but that now you only want to visualize the columns:
City, Region, and Country in the resulting table.

In the file window on the left,
type the correct command to
retrieve records according to the instructions above.

The results should be like this:

| City  | Region | Country |
| ----- | ------ | ------- |
| Miami | FL     | USA     |
| Miami | FL     | USA     |

#### Solution

```sql
USE education;
SELECT City, Region, Country
FROM Students
WHERE Region = 'FL';
```

### 6. The WHERE Clause III

Assume now that you want to
know how many students were born before June 1, 1995.

In the file window,
type the correct commands to
retrieve the entries in the Students table as described above.

The results should have all columns of Students table and
the rows of `StudentID`:
`1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 15, 16, 17`

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE BirthDate < '1995-06-01';
```

### 7. Concatenate Columns

In the next exercise,
concatenate the entries in the columns:
City, Region, and Country
from the Students table and display them in one column named Location.

Make sure that the names of
the city, state, and country are separated by a comma.

The results should mirror this table:

| City          | Region | Country | Location              |
| ------------- | ------ | ------- | --------------------- |
| Seattle       | WA     | USA     | Seattle, WA USA       |
| Dallas        | TX     | USA     | Dallas, TX USA        |
| Miami         | FL     | USA     | Miami, FL USA         |
| Phoenix       | AZ     | USA     | Phoenix, AZ USA       |
| Denver        | CO     | USA     | Denver, CO USA        |
| Portland      | OR     | USA     | Portland, OR USA      |
| San Francisco | CA     | USA     | San Francisco, CA USA |
| Memphis       | TN     | USA     | Memphis, TN USA       |
| Portland      | ME     | USA     | Portland, ME USA      |
| Chicago       | IL     | USA     | Chicago, IL USA       |
| Seattle       | WA     | USA     | Seattle, WA USA       |
| Austin        | TX     | USA     | Austin, TX USA        |
| Miami         | FL     | USA     | Miami, FL USA         |
| Phoenix       | AZ     | USA     | Phoenix, AZ USA       |
| Denver        | CO     | USA     | Denver, CO USA        |
| Portland      | OR     | USA     | Portland, OR USA      |
| San Francisco | CA     | USA     | San Francisco, CA USA |
| Memphis       | TN     | USA     | Memphis, TN USA       |
| Portland      | ME     | USA     | Portland, ME USA      |
| Chicago       | IL     | USA     | Chicago, IL USA       |

#### Solution

```sql
USE education;
SELECT City, Region, Country,
    CONCAT(City, ', ', Region, ' ', Country) AS Location
FROM Students;
```

### 8. The IN Operator

From the Students table,
select all the students that
come from Seattle, Miami, or Chicago.
Use the IN operator.

The resulting table should have all Students columns and rows of primary keys:
`1, 3, 10, 11, 13, 20`.

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE City IN ('Seattle', 'Miami', 'Chicago');
```

### 9. Combining the IN and AND operators

From the table Colleges,
select all the entries where City is equal to
Cambridge and CollegeID is greater than five.

The results should have all College columns & only row of primary key `7`.

#### Solution

```sql
USE education;
SELECT *
FROM Colleges
WHERE
    City IN ('Cambridge') AND
    CollegeID > 5;
```

### 10. Combining Operators I

From the `Students` table,
select all the records that meet the following criteria:

* `Region` is either equal to Washington or Tennessee, AND
* `City` is not equal to either New York, OR
* `CollegeID` is greater than six, AND
* `BirthDate` is between January 1, 1993 and May 1, 1995.

The results should have all Student columns and rows of ID: 1, 8, 11, 18

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE
    Region IN ('WA', 'TN') AND
    City <> 'New York' OR
    CollegeID > 6 AND
    BirthDate BETWEEN '1993-01-01' AND '1995-05-01';
```

### 11. The NULL and NOT NULL Operators I

From the Students table,
select all the students whose phone number is known.

The results have all columns from Students & rows of primary keys:
1, 3, 6, 8, 11, 14, 16, 17, 19

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE Phone IS NOT NULL;
```

### 12. The NULL and NOT NULL Operators II

From the Students table,
select all the students that don’t have a corresponding FriendID.

Results have all Students columns and primary keys: 11-20.

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE FriendID IS NULL;
```

### 13. The LIKE Operator

From the Colleges table,
retrieve the records of all the universities with names that start with N.

The results are all Colleges columns with primary keys: 10, 13, 20

#### Solution

```sql
USE education;
SELECT *
FROM Colleges
WHERE Name LIKE 'N%';
```

### 14. Combining Operators II

Retrieve all the records from
the Students table where
the area code is equal to 415 or the email address is under the apple domain.

Results have all Students columns and rows of primary keys: 5, 15, 17

#### Solution

```sql
USE education;
SELECT *
FROM Students
WHERE
    Phone LIKE '(415)%' OR
    Email LIKE '%@apple.com';
```

### 15. The Inner Join

Suppose you would like to join the Students and Colleges tables so that
the resulting table will display the last name of every student,
the city and state in which the student attends university,
and the matching field for the original tables.

The results table should be:

| LastName  | CollegeID | City       | Region |
| --------- | --------- | ---------- | ------ |
| Davolio   | 1         | Cambridge  | MA     |
| Fuller    | 9         | Baltimore  | MD     |
| Leverling | 8         | Princeton  | NJ     |
| Peacock   | 3         | Hanover    | NH     |
| Buchanan  | 4         | Stanford   | CA     |
| Suyama    | 7         | Cambridge  | MA     |
| King      | 6         | New York   | NY     |
| Callahan  | 5         | New Haven  | CT     |
| Dodsworth | 2         | Providence | RI     |
| Johnson   | 1         | Cambridge  | MA     |
| Trujillo  | 1         | Cambridge  | MA     |
| Hardy     | 9         | Baltimore  | MD     |
| Moreno    | 5         | New Haven  | CT     |
| Brown     | 7         | Cambridge  | MA     |
| Devon     | 3         | Hanover    | NH     |
| Cruz      | 2         | Providence | RI     |
| Rovelli   | 6         | New York   | NY     |
| Bertrand  | 10        | Evanston   | IL     |
| Cramer    | 4         | Stanford   | CA     |
| Holz      | 8         | Princeton  | NJ     |

#### Solution

```sql
USE education;
SELECT S.LastName, C.CollegeID, C.City, C.Region
FROM Students S
INNER JOIN Colleges C
ON S.CollegeID = C.CollegeID;
```

### 16. The Left Join

Suppose you would like to join the Students and Colleges tables so that
the resulting table will display the first and last name of every student,
their email, the city in which the student attends university, and
the matching field for the original tables.

Result should be:

| FirstName | LastName  | Email              | CollegeID | City       |
| --------- | --------- | ------------------ | --------- | ---------- |
| Nancy     | Davolio   | nancy@gmail.com    | 1         | Cambridge  |
| Andrew    | Fuller    | andrew@yahoo.com   | 9         | Baltimore  |
| Janet     | Leverling | janet@hotmail.com  | 8         | Princeton  |
| Margaret  | Peacock   | maggie@outlook.com | 3         | Hanover    |
| Steven    | Buchanan  | steve@apple.com    | 4         | Stanford   |
| Michael   | Suyama    | mike@icloud.com    | 7         | Cambridge  |
| Robert    | King      | rob@gmail.com      | 6         | New York   |
| Laura     | Callahan  | laura@gmail.com    | 5         | New Haven  |
| Anne      | Dodsworth | anne@msn.com       | 2         | Providence |
| Ivy       | Johnson   | ivy@gmail.com      | 1         | Cambridge  |
| Ana       | Trujillo  | ana@gmail.com      | 1         | Cambridge  |
| Thomas    | Hardy     | tom@yahoo.com      | 9         | Baltimore  |
| Antonio   | Moreno    | tony@hotmail.com   | 5         | New Haven  |
| Elizabeth | Brown     | beth@outlook.com   | 7         | Cambridge  |
| Ann       | Devon     | ann@apple.com      | 3         | Hanover    |
| Ariel     | Cruz      | ariel@icloud.com   | 2         | Providence |
| Giovanni  | Rovelli   | gio@gmail.com      | 6         | New York   |
| Marie     | Bertrand  | marie@gmail.com    | 10        | Evanston   |
| Philip    | Cramer    | phil@msn.com       | 4         | Stanford   |
| Michael   | Holz      | michael@gmail.com  | 8         | Princeton  |

#### Solution

```sql
USE education;
SELECT S.FirstName, S.LastName, S.Email, C.CollegeID, C.City
FROM Students S
LEFT JOIN Colleges C
ON S.CollegeID = C.CollegeID;
```

### 17. Ordering Data

Suppose that you want to order the entries in
the column Email in the Students table in descending order.

The results are easy enough,
the whole Students table with Email in alphabetic order

#### Solution

```sql
USE education;
SELECT *
FROM Students
ORDER BY Email DESC;
```

### 18. Aggregating Data I

In the file window, type the correct commands to visualize the following table:

| Count | Name          |
| ----- | ------------- |
| 1     | Berkeley      |
| 1     | Brown         |
| 1     | Columbia      |
| 1     | Cornell       |
| 1     | Dartmouth     |
| 1     | Duke          |
| 1     | Georgetown    |
| 1     | Harvard       |
| 1     | Johns Hopkins |
| 1     | Michigan      |
| 1     | MIT           |
| 1     | Northwestern  |
| 1     | Notre Dame    |
| 1     | NYU           |
| 1     | Princeton     |
| 1     | Stanford      |
| 1     | Tufts         |
| 1     | UCLA          |
| 1     | USC           |
| 1     | Yale          |

#### Solution

```sql
USE education;
SELECT COUNT(Name) AS Count, Name
FROM Colleges
GROUP BY Name
ORDER BY Name ASC;
```

### 19. Aggregating Data II

Suppose you want to generate the following table:

| MAX(Students) |
| ------------- |
| 51            |

#### Solution

```sql
USE education;
SELECT MAX(Students)
FROM Colleges;
```

## References

### Web Links

* [SQL Logical Operators (from SQLTutorial.org)][sql-logic-ops-tut]
* [RegExr: A Regular Expressions Playground & Teaching Tool][regexr.com]

<!-- Hidden Reference Links Below Here -->
[sql-logic-ops-tut]: https://www.sqltutorial.org/sql-logical-operators/ "SQL Logical Operators (from SQLTutorial.org)"
[regexr.com]: https://regexr.com/ "RegExr: A Regular Expressions Playground & Teaching Tool"

### Note Links

* [Logical Operators in SQL][sql-logic-ops-zk]

<!-- Hidden Reference Links Below Here -->
[sql-logic-ops-zk]: ./sql-logical-operators.md "Logical Operators in SQL"
