---
tags: [processor,benchmark,geekbench]
created: 2023-08-01T09:35:57.100Z
modified: 2023-08-01T09:35:57.100Z
---
# CPU Benchmark

## Introduction

This is a collection of notes that aggregates and compares the benchmarking
results of several CPU benchmarks on several pieces of hardware to
get a rough idea of relative performance of different systems.

## Geekbench 6

* [Hetzner CAX31 (ARM 8 Core 16GB RAM)][geek6-hetzner-cax31]
  * Results
    * Single Core Scores
      * Aggregate Score: 1099
      * File Compression: 1218 *(175MB/s)*
      * CLang: 1300 *(6.4 kLines/s)*
    * Multi-Core Scores
      * Aggregate Score: 5812
      * File Compression: 5124 *(735.8 MB/s)*
      * CLang: 8967 *(44.2 kLines/s)*
  * Hardware Info
    * Hetzner VPS (ARM Ampere Series)
    * CAX31
    * 8 Homogenous CPU cores
    * 16GB of RAM
* [Average of Late 2020 Macbook Air M1][geek6-avg-macbook-air-m1]
  * Results
    * Single Core Scores
      * Aggregate Score: 2327
    * Multi-Core Scores
      * Aggregate Score: 8285
  * Hardware Info
    * System: Apple Macbook Air (Late 2020)
    * CPU: Apple M1
    * CPU Cores BIG: 4
    * CPU Cores little: 4
    * Memory: 16GB

## References

### Web References

* [Geekbench 6 Results: Hetzner VPS CAX31 (8 ARM cores & 16GB RAM)][geek6-hetzner-cax31]
* [Geekbench 6 Results: Average of Macbook Air (Late 2020) M1][geek6-avg-macbook-air-m1]

<!-- Hidden References -->
[geek6-hetzner-cax31]: https://browser.geekbench.com/v6/cpu/2110441 "Geekbench 6 Results: Hetzner VPS CAX31 (8 ARM cores & 16GB RAM)"
[geek6-avg-macbook-air-m1]: https://browser.geekbench.com/macs/macbook-air-late-2020 "Geekbench 6 Results: Average of Macbook Air (Late 2020) M1"
