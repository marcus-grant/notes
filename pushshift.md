---
created: 2023-06-15T09:05:38.668Z
modified: 2023-06-15T11:22:48.233Z
tags: [pushshift,api,data,reddit,social,media,aggregate,set,archive]
---
# Pushshift API

## Preface

>The **pushshift**.io [Reddit][-reddit] API was designed and created by
>the [/r/datasets][r-datasets] mod team to
>help provide enhanced functionality and search capabilities for
>searching Reddit comments and submissions.
>The project lead, [/u/stuck_in_the_matrix][u-stuck],
>is the maintainer of the Reddit comment and
>submissions archives located at [https://files.pushshift.io][pushshift-files].
>
>--[github/pushshift/api (2023)][gh-pushshift]

## API Basics

The API mirrors most of the conventions of the Reddit API it sources from.

## PMAW

[PMAW][gh-pmaw] is a Python wrapper for the Pushshift API.
It is highly optimized to deal with the limitations of the free Pushshift API.
Such as queuing requests and handling delays inline with
the rate limits of the API.
The library is written and maintained by Matt Podolak.

## PMAW Tutorial

A lot of these steps are taken from [Matt Podolak's Tutorial][med-pmaw-tut].
This example will download 100,000 comments from
the subreddit r/dataengineering between 2021-01-01 and 2021-06-01.
Then [pandas][-pd] will be used to convert the data into a DataFrame and
then store the data as a [CSV file][-csv].

### Installation and Import

Install the PMAW library and pandas.

```bash
pip install pmaw pandas
```

Then set up the imports and instantiate the `PushshiftAPI` `api` object.

```python
import pandas as pd
from pmaw import PushshiftAPI
api = PushshiftAPI()
```

### Keywords Introduction

The `search_comments()` method is used to request Reddit comments from Pushshift.
Using keyword arguments we define a date range *(marked as **`before`** and **`after`**)*.
The keyword **`subreddit`** and **`limit`** are also used as filters.

### Subreddit Keyword

The **`subreddit`** keyword is pretty self-explanatory,
it filters comments by the subreddit that they are posted in.
This doesn't regard them by the post they are in,
it will get all comments from the subreddit regardless of the post.
They will need to be filtered by other means to limit them.
But these comment entities will have connections to among other things,
the post they came from.

```python
subreddit = 'dataengineering'
data_comments = api.search_comments(subreddit=subreddit)
```

### Limit Keyword

The **`limit`** keyword is the number of comments to return.
This keyword will have a huge effect on the time it takes to request and
the size of the dataset.
This keyword requires some consideration about what it is you want.

```python
limit = 100000
data_comments = api.search_comments(subreddit=subreddit, limit=limit)
```

### Before and After Keywords

The **`before`** and **`after`** keywords are used to define a date range.
`PMAW` only accepts dates in the epoch time format,
so the `datetime` module is needed to create the correct date object to
feed into the `search_comments()` method.

```python
import datetime as dt
before = int(dt.datetime(2021, 2, 1, 0, 0).timestamp())
after = int(dt.datetime(2020, 12, 1, 0, 0).timestamp())
date_comments = api.search_comments(subreddit=subreddit, before=before, after=after)
```

Here a year, month, date, hour and minute date unit object is converted to
epoch time using the `timestamp()` method.
When calling the `search_comments()` method,
now the `before` and `after` variables can be used as arguments.

### Requesting Comments

Now that we have some useful keywords to filter the comments,
we can request entire subreddits worth of comments in one batched task.
The whole task gets managed by PMAW so long as the program is running.

>**NOTE**: This process will retrieve 100,000 comments as per the **`limit`** keyword.
>Under the hood, due to the pushshift limits, PMAW will limit requests to 1 per second.
>Each request can only return 100 comments, so the maximum comments per second is 100.
>So the minimum time to request 100,000 comments is 1000 seconds or 16 minutes and 40 seconds.
>Keep in mind a lot of times requests will be rejected due to traffic,
>So this is the theoretical **minimum time**.

As the previous examples hinted at,
we'll be requesting 100,000 comments prioritized from earliest to latest for
the `r/dataengineering` subreddit from December 1st, 2020 to February 1st, 2021.
So putting it all together,
the code to start this batched request routine becomes something like this.

## References

### Web Links

* [Github. pushshift/api. Accessed 2023-06-15][gh-pushshift]
* [Reddit. r/datasets.][r-datasets]
* [Baumgartner, Jason (stuck_in_the_matrix). Reddit. u/stuck_in_the_matrix][u-stuck]
* [Pushshift. Archive Files. files.pushshift.io][pushshift-files]
* [mattpodolak/pmaw. Github. README.md. Accessed 2023-06-15][gh-pmaw]
* [Podolak, Matt. Medium. "How to Scrape Large Amounts of Reddit Data". 2021-04-09][med-pmaw-tut]

<!-- Hidden References -->
[gh-pushshift]: https://github.com/pushshift/api "Github. pushshift/api. Accessed 2023-06-15"
[r-datasets]: https://reddit.com/r/datasets "Reddit. r/datasets."
[u-stuck]: https://reddit.com/u/stuck_in_the_matrix "Baumgartner, Jason (stuck_in_the_matrix). Reddit. u/stuck_in_the_matrix"
[pushshift-files]: https://files.pushshift.io "Pushshift. Archive Files. files.pushshift.io"
[gh-pmaw]: https://github.com/mattpodolak/pmaw/blob/master/README.md "mattpodolak/pmaw. Github. README.md. Accessed 2023-06-15"
[med-pmaw-tut]: https://medium.com/swlh/how-to-scrape-large-amounts-of-reddit-data-using-pushshift-1d33bde9286 "Podolak, Matt. Medium. 'How to Scrape Large Amounts of Reddit Data'"

### Note Links

* [Reddit][-reddit]
* [Pandas][-pd]
* [CSV file][-csv]

<!-- Hidden References -->
[-reddit]: reddit.md "Reddit"
[-pd]: pandas.md "Pandas"
[-csv]: csv.md "CSV file"
