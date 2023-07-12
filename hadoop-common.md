---
created: 2023-07-12T10:46:10.470Z
modified: 2023-07-12T12:53:21.000Z
tags: [hadoop,library,java,data,pcde,module18]
---
# Hadoop: Common Library

## Introduction

**Hadoop Common** or (**Common Utilities**) includes
the [Java][-java] library, java files and java scripts that are needed for
all other components present in a [Hadoop cluster][-hadoop] to work together.
These utilities are used by the [HDFS][-hdfs], [YARN][-yarn] and
[MapReduce][-mr] components for running the cluster.

In particular it is responsible for how data is stored in the *HDFS* and
how *MapReduce* should handle the data stored by the *HDFS* in *chunks*.
It is also responsible for the communications between the *MapReduce* and
*YARN* frameworks for job scheduling and resource management.

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Java][-java]
* [Hadoop][-hadoop]
* [Hadoop Distributed File System (HDFS)][-hdfs]
* [Yet Another Resource Negotiator (YARN)][-yarn]
* [MapReduce][-mr]

<!-- Hidden References -->
[-java]: java.md "Java"
[-hadoop]: hadoop.md "Hadoop"
[-hdfs]: hadoop-dfs.md "Hadoop Distributed File System (HDFS)"
[-yarn]: hadoop-yarn.md "Hadoop: YARN"
[-mr]: hadoop-map-reduce.md "Hadoop: MapReduce"
