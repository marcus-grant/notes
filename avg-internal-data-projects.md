---
created: 2023-08-07T10:41:14.762Z
modified: 2023-08-09T15:29:07.370Z
tags: [work,avg,project,data,pipeline,learn,system]
---
# AVG: Internal Data Projects Planning

## Introduction

This document collects some of the proposals for AVG's internal data projects.

## Ekin Initial Suggestions (2023-08-02)

### Main Points

#### ROIC

* ROIC already has a sufficiently automated workflow for acquiring data.
  * **ME** *Does this however benefit from
    storing the data ourselves in databases?*
* Part of the ROIC workflow that takes time is target company research &
  peer research.
  * **ME** *It's possible we could use LLMs deployed locally to perform this stuff*.
  * **ME** *It's possible we could use something like LLaMa2 to*
    * format search requests
    * parse results
    * evaluate search results
    * filter results
    * store relevant results for current and archival use
    * compile necessary links and footnotes for the report
* The investment side is less excel savvy so a web interface option could be useful.
  * Would draw from CapitalIQ's API
    * Would also require negotiating with CapitalIQ to expose the endpoint

#### Knowledge Management

* Debugger already working on something like this? (Confirm)
  * Relational Database to store completed AV cases and query for future reference.
    * **Me** What is the object store (Microsoft Office Cloud?)
    * **Me** What kind of queries are we talking about?
* Some additional use-cases came to mind:
  * **Content Suggestions**: Recommendation system to suggest relevant cases.
    * **Me** Naive Bayes Classifier on case text seems low hanging fruit?
* Content tagging
  * Potentially could use NLP or other algorithms to tag content
  * Should be able to do this as documents are uploaded
* Content creation
  * could generate content to automatically create summaries, abstracts or
    init drafts of documents based on specific keywords, services or
    cases provided by AV consultants using the AV cases database

>I think the knowledge management piece is really crucial.
>At least for me, whenever I am about to start a new case,
>I tend to go and check previous cases on similar topics or clients to
>get an idea of what to expect and deliver.
>Or I check previous cases whenever I am preparing a proposal to
>see what AV had already done with similar clients/topics.
>Navigating the Box to find such cases is extremely time-consuming and
>sometimes impossible since a junior person might not know which
>cases/clients to check out.
>So, for example, when Max tells me to check out X and Y cases for inspiration,
>they actually really help a lot.
>
>-- Ekin Gultekin on Knowledge Management Importance (2023-08-02)

## Notes on Ekin's Experiences

* React
* Next.js
* Node.js through Express
* Django
* SQL
* MongoDB
* Low-Code implementations

<!-- ## References

### Web Links -->

<!-- Hidden References -->

<!-- ### Note Links -->

<!-- Hidden References -->
