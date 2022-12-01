---
tags: [data,graph,node,edge,computers,structures,sql,db]
---
# Comparison of Implementations of Graph Data Structures

## SQL Implementations

Sometimes graphs need to be implemented in [SQL](sql.md). To build hierarchical graph structures in SQL there's various tradeoffs to choose from. Often it is said that adjacency lists perform poorly in most SQL query methods when storing tree hierarcies. The devil is usually in optimization details however.

Chapter 6 of ["SQL Design Patterns" by Vadim Tropashko][sql-design-patterns-book] shows this summary of implementations. With the table shown in [Vadim's article][nested-vs-adjacency-sql] comparing them.

| Adjacency relation (tree edges; standalone, or combined with the tree nodes)                                     | Nested Sets                                                                                                          | Materialized Path                                                                                   | Nested Intervals via Matrix encoding                                                      |
|------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| Have to use proprietory SQL extensions for finding ancestors and descendants; although the queries are efficient | Standard SQL                                                                                                         | Standard SQL                                                                                        | Standard SQL                                                                              |
| Finding descendants is relatively efficient (i.e. proportional to the size of the subtree)                       | Finding descendants is easy and relatively efficient (i.e. proportional to the size of the subtree)                  | Finding descendants is easy and relatively efficient (i.e. proportional to the size of the subtree) | Same as MP: Finding descendants is easy and relatively efficient                          |
| Finding ancestors is efficient                                                                                   | Finding ancestors is easy but inefficient                                                                            | Finding ancestors is tricky but efficient                                                           | Same as MP: Finding ancestors is tricky but efficient                                     |
| Finding node’s children is trivial                                                                               | Finding node’s children as all the descendants restricted to the next level is inefficient (e.g. consider root node) | Finding node’s children as descendants on next level is inefficient                                 | Same as AR: Finding node’s children is trivial                                            |
| Finding node’s parent is trivial                                                                                 | Finding node’s parent as ancestor on the previous level is inefficient due to inefficiency of ancestors search       | Finding node’s parent as ancestor on the previous level is efficient                                | Same as AR: Finding node’s parent is trivial                                              |
| Aggregate queries are relatively efficient (i.e. proportional to the size of the subtree)                        | Aggregate queries are relatively efficient (except counting, which is super fast)!                                   | Aggregate queries are relatively efficient (i.e. proportional to the size of the subtree)           | Aggregate queries are relatively efficient (i.e. proportional to the size of the subtree) |
| tree reorganization is very simple                                                                               | tree reorganization is hard                                                                                          | tree reorganization is easy                                                                         | tree reorganization is easy (but not as simple as in AR)                                  |

## Adjacency List Implementation of File Hierarchies

Here we learn how to implement this in [SQL](sql.md) using adjacency lists. There are some [tutorials][hierarchies-adj-list-sql-tutorial]


## References

* [Vadim Tropashko: One More Nested Intervals vs. Adjency List Comparison][nested-vs-adjacency-sql]
* [SQL Design Patterns Book by Vadim Tropashko][sql-design-patterns-book]

<!-- Hidden References -->

[nested-vs-adjacency-sql]: https://vadimtropashko.wordpress.com/2008/08/09/one-more-nested-intervals-vs-adjacency-list-comparison/ "Vadim Tropashko: One More Nested Intervals vs. Adjency List Comparison"
[sql-design-patterns-book]: http://www.rampant-books.com/book_0601_sql_coding_styles.htm "SQL Design Patterns Book by Vadim Tropashko"
[hierarchies-adj-list-sql-tutorial]: https://www.mysqltutorial.org/mysql-adjacency-list-tree/ "Managing Hierarchiac"
