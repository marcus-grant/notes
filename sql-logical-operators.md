---
created: 2023-01-24T16:53:22.000+01
modified: 2023-01-24T16:53:22.000+01
tags: [pcde, module5, data, sql, logic, boolean, database]
---
# Logical Operations in SQL

## What Are Logical Operators?

Logical *operators* allow you to test whether a condition is true or false.
Therefore,
the result returned by a logical *operator* is
either true, false, or NULL (unknown).

You can think of a NULL result as an outcome that is undetermined.
Therefore,
it’s impossible to tell whether a comparison to NULL is true or false.
Consider the following example:

```sql
(NULL = 1)
```

The comparison to NULL makes the first operand
*(i.e., the boolean expression you want to evaluate)* unknown because
it cannot be determined.

The focus of this mini-lesson is to
review the logical *operators* you have seen in
the previous video and how they operate.

## The `AND` *operator*

The `AND` (or `&&` ) *operator* is a logical *operator* that
combines two boolean expressions.
The AND *operator* returns true if both expressions evaluate to true.
If one of the two expressions is false,
then the AND *operator* returns false, even if one of the expressions is NULL.

The syntax for the AND *operator* in SQL is given by:

```sql
expression1 AND expression2;
```

The table below summarizes the results when
comparing boolean expressions using the AND *operator*.

### The AND *operator* Logic Table

|       | True  | False | NULL  |
| ----- | ----- | ----- | ----- |
| True  | True  | False | NULL  |
| False | False | False | False |
| NULL  | NULL  | False | Null  |

## The OR *Operator*

The `OR` (or `||` ) *operator* is a logical *operator* that
combines two boolean expressions.

The syntax for the OR *operator* in SQL is given by:

```sql
SELECT column1, column2,
FROM table1
WHERE expression1 OR expression2;
```

The table below summarizes the results when comparing boolean expressions using the `OR` *operator*.

### The `OR` *operator*

|       | True | False | NULL |
| ----- | ---- | ----- | ---- |
| True  | True | True  | True |
| False | True | False | NULL |
| NULL  | True | NULL  | NULL |

## The `NOT` *operator*

The `NOT` (or `!` ) *operator* is a logical *operator* that
combines two boolean expressions.
It reverses the result of any logical *operator*.

The syntax for the OR *operator* in SQL is given by:

```sql
NOT [expression1];
```

The table below summarizes the results when
comparing boolean expressions using the NOT *operator*.

### The NOT *Operator*

|       | NOT   |
| ----- | ----- |
| True  | False |
| False | True  |
| NULL  | NULL  |

## The `XOR` *Operator*

The XOR *operator* is a logical *operator* that
combines two boolean expressions.
It returns true if one expression is true,
and false otherwise.
If one of the expressions is NULL, then it returns NULL.

The syntax for the XOR *operator* in SQL is given by:

```sql
SELECT expression1 XOR expression2;
```

The table below summarizes the results when
comparing boolean expressions using the XOR *operator*.

### The `XOR` *Operator*

|       | True  | False | NULL  |
| ----- | ----- | ----- | ----- |
| True  | False | True  | NULL  |
| False | True  | False | NULL  |
| NULL  | NULL  | NULL  | False |

In summary,
it is important that you learn and understand how
logical *operators* and
their tables work to guarantee correct results in your code.

## Further Reading

A guide with details about additional *operators* can be found here:
[SQL Logical Operators][sql-logic-ops-tut]

## References

### Web Links

* [SQL Logical Operators (from SQLTutorial.org)][sql-logic-ops-tut]

<!-- Hidden Reference Links Below Here -->
[sql-logic-ops-tut]: https://www.sqltutorial.org/sql-logical-operators/ "SQL Logical Operators (from SQLTutorial.org)"

### Note Links

<!-- Hidden References -->

### Referenced By

* [PCDE: Course Overview][pcde-course-overview-zk]

<!-- Hidden References -->
[pcde-course-overview-zk]: ./pcde-course-overview.md "PCDE: Course Overview"
