---
created: 2023-02-08T16:45:44.050Z
modified: 2023-02-21T11:13:46.137Z
tags: [pcde,module7,etl,analysis,visual,data,engineer,programming,python]
---
# PCDE Course Module 7 Content: ETL, Analysis & Visualization

## Discussion 8.1: ETL Process

### Instructions

Now that you have become familiar with the ETL process,
it’s time for you to summarize your knowledge about it.

Why is ETL important?
What’s your general understanding of ETL?
What are the key considerations in each step of ETL?
What are the key advantages of having an integrated ETL process in your Python code?

### Response

#### Why is ETL Important?

ETL, or **E**xtract, **T**ransform, **L**oad,
is standard way of accumulating, standardizing and centralizing data.
When you need to work on several datasets to perform your work,
this process is how you effectively integrate multiple data sources practically.
It effectively establishes a single source of truth for
the data in an organization,
by ensuring data quality and centralizing its source.

#### What's your General Understanding of ETL?

That it's a broad name for the process of integrating,
standardizing, cleaning, and centralizing the data of an organization.
Ultimately it's deciding on standards early on for how data is to be structured,
then transforming the data from different sources so it fits that structure.
Then of course adding it to the appropriate database.

#### What are the Key Considerations in each Step of ETL?

* Extract:
  * Consider the source
  * Any restrictions?
  * Any format or structure changes necessary, like it being an Excel sheet?
* Transform
  * How do you transform the data source to work with your systems?
  * Should the data be reorganized to better fit your needs?
  * What should be an entity and property?
  * Do you need all the data points?
  * Is data cleaning or reformating necessary?
* Load
  * How will the data get transformed to suit the database?
  * What will be indexed?
  * What are the datatypes?
  * What are the primary and foreign keys?

#### What are the key advantages of having an integrated ETL process in Python?

Python has several key advantages, perhaps better suited to a list:

* It's flexible:
  * Python is one of the biggest ecosystems in software
  * That makes python easy to use with just about any data source & destination
  * Usually your use case already has a python library to streamline the process
* Python is great at automation workflows:
  * Python has been integrated in several automation workflows
  * This simplifies the process of
periodically updating data with fresh updates from its sources
* Analysis
  * Python is a first-class citizen in the world of data analysis
  * We know this from experience through pandas, numpy, scipy, matplotlib, etc.
* Interoperability
  * Python is effectively built through standardization
  * This leads to a culture of making highly portable code
  * As a result it works on more data sources and sinks than just about anything

## Try-It Activity 8.1: ETL Implementation

I looked up some information about the dataset from its
[census.gov page](https://www.census.gov/retail/index.html).
And that along with some attempts to arrive at the sums on the top of each
Excel sheet made it clear that they would likely not be useful to me.
Some strange combination of categories leads to those sums so I decided to
stick to the yearly totals to act as a checksum when going through the ETL process.

I also looked up what a NAICS code is and found that it's a
[standard classification system](https://www.naics.com/what-is-naics-code/).
Which was somewhat helpful in understanding each business type in the data.

When it came to what data I wouldn't include,
the video showed the obvious rows and columns to exclude,
namely the ones that were just blank or or descriptions about the data.
I also determined that the adjustments they made wouldn't be useful to me,
as part of this project is analyzing the long and short-term trends in retail sales.
That means their adjustment methodology would potentially remove some of the
periodic trends I'm looking for.
With the raw data I can make my own adjustments if I need to.

I also tried summing each set of row and columns' missing values to
see if there was a pattern to the missing data.
And there were quite a few actually.
Most of the missing values were adjacent to each other,
along long ranges of months and sometimes years.
To me that suggests that the data was missing because it was never collected,
or as time went on methodology changed,
or the market changed enough that the categorization needed changing.
For example, online retail, which is a fairly new phenomenon,
wouldn't have been included in the data before 1997.

Another period of time where a lot of data went missing was during the 2020 pandemic.
I'm not sure if that's because the data wasn't collected,
or if it was collected but the methodology changed,
or if the lockdowns made it so these businesses were no longer open.
A potential hint lies in that
[census.gov page](https://www.census.gov/retail/index.html),
where it says that data gets omitted if the reporting quality is too low,
so I'm going to guess that's the case for a lot of the business types in 2020.

So I actually left in the missing data for now,
and depending on the specific analysis I'm doing,
I'll impute the data or change the time range of data to analyze.
There doesn't seem to be any imputation method that
would fit all potential analyses cases.

## Discussion 8.2: ETL, Analysis & Visualization Project Summary

### Prompt

* What are the major steps you performed to complete your project?
* What are the key advantages of having one integrated ETL and
analysis process in your Python code?
* Which questions about your data were you trying to answer,
and which steps did you perform to complete your analysis?
* What was the most challenging part for you when developing your project?
* What aspect of your project could you have improved on?
* What are some possible directions for future work?

### Response

#### What are the major steps you performed to complete your project?

During the extraction process I had to iterate through every sheet,
representing a year, for every business type so
that I could extract every year's data for each business type.
Then during the transform stage,
the most complicated part of the process was verifying the data by
taking the sum of each business type's monthly sales and comparing it to
the Excel sheet's yearly total.
It worked out alright so I could continue with the install script.

#### Key advantages of having one integrated ETL & analysis process in your Python code?

Python has a huge ecosystem of libraries that make it easy to work with.
Debugging Python code is fairly easy.
Whereas debugging in SQL is almost non-existent and
there's no way of using libraries of software to help with formats like Excel.

#### Which questions about your data were you trying to answer, what steps were involved in analysis?

I personally was most interested to see how department stores, online shopping,
and warehouse clubs have changed over time.
My hypothesis was that department stores would have been on a steady declining trend,
while online shopping and warehouse clubs would have been on a steady increasing trend.
To analyze this hypothesis I examined the percentage change in sales for the three.
I also used a 12-month moving average to smooth out the data to make it easier to
see the long-term trends between the three categories.

#### What was the most challenging part for you when developing your project?

The most challenging part is probably the constant need to
re-examine the process.
A bad choice in the extraction phase makes it difficult to
fix in the transform phase and so on.
So it's important to make sure you're making the right choices at each step and
be open to iterating the process as things come up.

#### What aspect of your project could you have improved on?

I could have improved on
the extraction phase particularly.
I found out later in the webinar on this module that I could've just stuck
with reading all the data directly from the Excel file and gone from there.
That would've saved **a lot** of time and complication.

#### What are some possible directions for future work?

I think a lot more interesting conclusions can be drawn from
the pandemic years in the data.
The pandemic had a lot of unique, and unfortunately negative, effects on retail.
There's probably more analysis to be done on the years 2020 and beyond.

## References

### Web Links

<!-- Hidden References -->

### Note Links

<!-- Hidden References -->
