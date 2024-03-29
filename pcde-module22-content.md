---
created: 2023-06-14T18:56:46.442Z
modified: 2023-07-14T15:29:34.557Z
tags: [pcde,module22,data,big,science,sql,python,dask,feather,parquet]
---
# PCDE Course Module 22 Content

## Introduction

In this module,
you will learn about processing and
streaming big data using the pandas library, the [Apache Parquet format][-parquet],
and the [Apache Feather format][-feather].
You will begin by comparing the functionality and speed of the Parquet and
Feather formats when processing large datasets.
Next, you will explore the advantages of
[parallel computing][-parallel] and learn the basics of [DASK][-dask],
a parallel computing Python library.
You will practice using the DASK library to create, read, write,
and analyze multiple files in parallel and
simulate parallel processing across distributed machines.
In the next section,
you will learn how web sockets are used as a communication protocol and
how to stream data through [web sockets][-web-sock].
The final assignment for this module consists of two parts.
In the first part of the final assignment,
you will compare the performances of parallel computing with
the pandas, NumPy, and DASK libraries.
In the second part of the final assignment,
you will practice streaming data using web sockets.

## Try-It Activity 22.1: Reading Big Data

### Try-It 22.1 Introduction

In this try-it activity,
you will begin by comparing the reading and writing performances of
the Apache [Parquet][-parquet] and [Feather][-feather] formats on
a dataframe with two million rows.
Next, you will discuss which format performed better at
reading and writing big data and why you think that may be.
Finally,
you will be asked to select a publicly available large dataset and
describe why it would be convenient to store it either in
Parquet or Feather format.

### Try-It 22.1 Instructions

1. In a terminal, run `pip install lorem` to generate large lorem ipsum data.
2. Download the [Try_It_22_1][try-it-22-1] directory.
    Open it using Jupyter Notebook.
    There are four questions throughout the notebook.
3. Read the instructions and modify the code that is provided in
    the cells for questions 1, 2, 3, 4.

Now that you have some experience comparing the performances of
the Parquet and Feather formats when reading and writing big data,
discuss your experience with your peers.
In your discussion post, respond to each of the questions below:

* Which format seems to be more efficient when writing data?
* Which format seems to be more efficient when reading data?
* What are the main differences between the Parquet and Feather formats?
  * How do you think these differences impact the performance of each format?
    * Especially in reading and writing data.
* Select a publicly available large dataset (more than 500,000 rows).
  * Describe the dataset and research why it would be convenient to
    store it in either Parquet or Feather format.

**Suggested Time**: 75 minutes
**Suggested Length**: 250~300 words

### My Response

#### Which format seems to be more efficient when writing data?

I wrote the lorem and random numbers dataframe created in the notebook to
both the Parquet and Feather formats.
On my machine, an Apple Silicon M1 Mac, the feather format was faster.

Here's the output of the `%%time` magic command for the Parquet write:

```text
CPU times: user 2.19 s, sys: 170 ms, total: 2.36 s
Wall time: 2.42 s
```

And here's the feather write:

```text
CPU times: user 1.46 s, sys: 172 ms, total: 1.63 s
Wall time: 1.29 s
```

As you can see, the feather write was faster by 1.13 seconds.
A speedup of about 46.7%.

#### Which format seems to be more efficient when reading data?

With the parquet and feather files written, I could then test the read speed.
Doing largely the same thing except using the `read_parquet` and
`read_feather` functions of pandas on two different file formats,
I got the following results.

Here's the parquet read:

```text
CPU times: user 1.82 s, sys: 573 ms, total: 2.4 s
Wall time: 2.9 s
```

And the feather read:

```text
CPU times: user 1.6 s, sys: 769 ms, total: 2.37 s
Wall time: 2.44 s
```

As you can see, the feather read was faster by 0.46 seconds.
A speedup of about 15.9%.
The difference isn't as great here,
which I imagine is due to the fact that the reading is more limited by
the speed of the disk than the data formatting and processing being done in RAM.

#### What are the main differences between the Parquet and Feather formats?

While both formats aim to improve the performance of data file formats by
storing data in a columnar format,
the Parquet format is more intended for broader ecosystems and for
longer term storage.
As such it has more compatibility built in and
crucially as it's designed for archives, it uses compression.
This will make the files slower to read and write,
but smaller to store.
Whereas the Feather format is designed for speed,
so it stores the data in a binary format without compression.
Binary formats don't use any kind of text encoding,
it's just raw bits arranged in a particular way, particularly to
optimize for the CPU's cache.
It also uses in-memory operations to speed up the reading and writing.
This makes it great for more *warm* or *ephemeral* data than Parquet.
Consider it a tier between raw databases and Parquet's colder archival tier.

#### Select a Publicly Available Large Dataset: Reddit Comment Archives

I chose to try and download some of the reddit archives on [archive.org][archive].
Since the Reddit API is being heavily charged per use starting this week,
I thought it'd be topical to try and download some of the archives.
I got a history of a subreddit from 2005 to earlier in the year.
Compressed with Z-standard, the archive is 180MB.
Uncompressed, it's 631MB as a collection of JSON files.

Due to it being the responses to Reddit's once public API,
it makes sense to store it in the JSON format as
that's the format the response is already in.
To store it for long term archival,
and distribution to other researchers,
it may make sense to use Parquet.

Parquet is great for distribution because it already comes compressed and
is significantly smaller than raw JSON and much faster to process.
The only reason it might not be used to archive reddit today is that
it's a relatively new format and
a lot of wrapper libraries for Python and R already exist to
perform analysis on the JSON data with all its nested structures and
particularly named keys.

## Try-It Activity 22.2: Running Parallel Operations in DASK

### Introduction to Try-It Activity 22.2

The DASK library in Python takes advantage of the multiple cores available in
modern computers to run threads in parallel.
In this try-it activity,
you will practice using Python’s DASK library to run threads in parallel.

This try-it activity will help you to analyze the performance gains realized by
running threads in parallel.
First, you will run functions sequentially.
Then, you will run the same functions in parallel.
Finally, you will compare the performance in both cases.

### Instructions for Try-It Activity 22.2

#### Try-It Activity 22.2 Step 1

Download the [Try-It Activity 22.2][try-it-22-2-dl] Jupyter Notebook folder.

#### Try-It Activity 22.2 Step 2

Open the command prompt with admin privileges and run the following commands to
install both the DASK and Graphviz libraries in the same terminal window.

```sh
pip install dask
pip install graphviz
jupyter notebook
```

#### Try-It Activity 22.2 Step 3

Once you have your local instance of Jupyter Notebook open,
navigate to the Try_It_Activity_22.2 folder.
There are nine questions in the notebook.

#### Try-It Activity 22.2 Step 4

Read the instructions and modify the code that is provided in
the related cells for each question

### Try-It Activity 22.2 Discussion Prompt

Now that you have some practice using Python’s DASK library to
run threads in parallel, discuss your experience with your peers.
In your discussion post, respond to each of the questions below:

* Do you observe any time differences between running threads sequentially and
  in parallel?
* Are there any performance gains when running threads in parallel?
  If so, describe those benefits in detail.
* Parallelization is an important technique for dealing with
  very large volumes of data.
  Why do you think it is necessary to implement parallel operations when
  working with large data files?

**Suggested Time**: 60 minutes

**Suggested Length**: 250-300 words

This is a required activity and counts toward course completion.

### Try-It Activity 22.2: My Response

#### Do you observe any time differences between running threads sequentially and in parallel?

Yes, there are time differences between running threads sequentially and in parallel.
Assuming that parts of the total computation can be performed in parallel,
that is that the operations are independent from one another,
then you can split the task up and perform it on many threads or
even separate computers entirely.

#### Are there any performance gains when running threads in parallel?

Depending on how independent each mathematical operation is,
whether intermediate results can be computed independently of each other,
you could potentially scale close to linearly by making a workload parallel.
If you look up Amdahl's law however you see that
most computation doesn't scale linearly when parallel.
Due to the fact that most computation does have some kind of dependency on
previous states, at some point you get diminishing returns when adding threads.

#### Importance of Parallelization for Large Datasets

When working with large datasets,
it's important to parallelize the computation because
otherwise it can take far too long to perform computation for it to be useful.
Datasets today can be far too large to even fit into the memory space that
modern RAM offers, and even if it could would take too long to compute single thread.
Efficiency can also be increased with parallelization.
A lot of CPU architectures have an ideal operating clock-rate in terms of
performing computation using the least amount of energy.
Operating within that range and splitting the workload to more CPU cores can
actually increase efficiency.

## Activity 22.1: Using DASK to Create Multiple Files in Parallel

## Introduction to Activity 22.1

In this activity, you will practice defining a pandas dataframe and
then writing the contents to files in parallel by using the DASK library.

## Instructions for Activity 22.1

To complete this activity, follow these steps:

1. In a Terminal window, run this command,
   `pip install dask` to install the DASK library locally.
    Provide a screenshot to show that you successfully installed DASK.
2. Download the [Activity 22_1.py][pcde-act-22-1-dl] file and open it using VS Code.
    Provide a screenshot to show that you opened the file correctly.
3. In the `Activity 22_1.py` file, use the pandas DataFrame function to
    create a dataframe with two columns.
    The first column, odd_num, will contain, as entries,
    all the odd numbers between 1 and 10.
    The second column, even_num, will contain, as entries,
    all the even numbers between 1 and 10.
    Assign this dataframe to the pandas_df variable.
    Provide a screenshot to
    show that you created the pandas_df dataframe correctly.
4. In the `Activity 22_1.py` file, set the npartitions argument inside
    the from_pandas function equal to 2.
    Provide a screenshot to show that you set the `npartitions` argument equal to 2.
5. Run and debug your code in VS Code.
    Provide a screenshot to show that you ran the code without any errors.
6. In a Terminal window, navigate to the `activity22.1` folder.
    List the files inside of the `activity22.1` folder.
    Provide a screenshot to show that the `0.part` and
    `1.part` files are present inside of the `activity22.1` folder.
7. In a Terminal window, use the `cat` command to visualize the contents of
    the `0.part` and `1.part` files.
    Provide two screenshots. The first screenshot should show the contents of
    the `0.part` file. The second screenshot should show the contents of
    the `1.part file`.

You have now completed this activity and
practiced defining a pandas dataframe and writing the contents to
files in parallel by using the DASK library.

### Activity 22.1 Deliverable

Your submission for this activity should be a Word document that
includes the following screenshots, each labeled for the corresponding step:

1. Provide a screenshot to show that you successfully installed DASK.
2. Provide a screenshot to show that you opened the file correctly.
3. Provide a screenshot to show that you create the `pandas_df` dataframe correctly.
4. Provide a screenshot to show that you set the `npartitions` argument equal to 2.
5. Provide a screenshot to show that you ran the code without any errors.
6. Provide a screenshot to show that the `0.part` and
    `1.part` files are present inside of the `activity22.1` folder.
7. Provide two screenshots. The first to show the contents of the `0.part` file.
    The second to show the contents of the `1.part` file.

## Activity 22.2: Using DASK to Read and Analyze Multiple Files in Parallel

### Activity 22.2 Introduction

In this activity, you will practice reading multiple files in parallel using DASK.
A common task for data engineers is reading and processing large numbers of files.
These files can come from many sources.
Some files may contain data that needs to be preprocessed and then added to a database.
In other cases,
large files may need to be scanned and
transformed before being sent to another application.
Regardless of the application,
reading and analyzing files is a time-intensive and thus relatively slow task.
In order to speed up this process, it is desirable to read files in parallel.
DASK provides a simple and easy to implement solution for
parallel processing and parallel read operations.

### Activity 22.2 Instructions

#### Activity 22.2 Steps 1

First, create a folder titled `Activity_22.2`.
Download the [`GenerateFilesWithDask.py`][pcde-act22-2-dl] file to this folder.
Provide a screenshot to show the `GenerateFilesWithDask.py` file in the folder.

#### Activity 22.2 Steps 2

Run the `GenerateFilesWithDask.py` file.
This should create a `/data` folder with some large files.
Provide a screenshot to show that the `/data` folder was created.

#### Activity 22.2 Steps 3

Navigate out of the `/data` folder, within the Activity_22.2 folder,
and create a new Python file called `Activity22-2.py`.
Provide a screenshot to show the `Activity22-2.py` file is in
the `Activity_22.2` folder.

#### Activity 22.2 Steps 4

In the `Activity22-2.py` file,
import the necessary DASK libraries using the command below:

```python
import dask.dataframe as ddf
from dask import delayed
```

Provide a screenshot to show that
the correct DASK libraries have been imported into the `Activity22-2.py` file.

#### Activity 22.2 Steps 5

Use a wildcard to read all of the files generated in the `/data` folder.
A wildcard is a designated symbol or character which
helps pattern match specific words.
In this case, the `*` symbol directs the CSV reader to grab all files as long as
the beginning starts with `data/2000` and ends with `.csv`.
Add the following command to read all of the CSV files:

```python
df = ddf.read_csv("data/2000*.csv")
Then, display the data that you just read into the DASK dataframe using the commands below:

df.compute()
print(df.head())
```

Run the `GenerateFilesWithDask.py` Python file.
Provide a screenshot to show the head of the DASK dataframe and display that
the DASK dataframe correctly displays the first five rows.

#### Activity 22.2 Steps 6

Next, process the data by calculating and displaying the mean of
the x column using the code below:

```python
mean = df['x'].mean().compute()
print(f'mean: {mean}')
```

After you have entered the above code, run the file.
Provide a screenshot of your Terminal window to show the output after
you have printed the computed mean of the dataframe.

#### Activity 22.2 Steps 7

Compute the number of columns in the dataframe using the code below:

```python
cols = len(df.columns)
print(f'columns: {cols}')
```

After you have entered the code above,
run the `GenerateFilesWithDask.py` Python file again.
Provide a screenshot of your Terminal window to
show the number of columns in the dataframe.

#### Activity 22.2 Steps 8

Compute the number of rows in the dataframe using the code below:

```python
rows = len(df.index)
print(f'rows:{rows}')
```

After you have entered the code above,
run the `GenerateFilesWithDask.py` Python file again.
Provide a screenshot of your Terminal window to
show the number of rows in the dataframe.

## Activity 22.3: Simulating Parallel Processing

### Activity 22.3 Introduction

In this activity,
you will simulate running parallel operations in DASK across multiple machines.

### Activity 22.3 Instructions

To complete this activity, follow these steps:

#### Activity 22.3 Step 1

In a Terminal window, run the command below to install the DASK library locally:

```sh
pip install dask
```

Provide a screenshot to show that you successfully installed DASK.

#### Activity 22.3 Step 2

Depending on what operating system you are using,
open the Anaconda Prompt (for Windows) or the Terminal (for Mac) and
run the `dask-scheduler`.
Provide a screenshot to show that you successfully ran the `dask-scheduler`.

#### Activity 22.3 Step 3

Take note of the address of the for the `dask-scheduler`.
Open two additional Anaconda command prompts and start two `dask-worker` processes.
Pass the address of the `dask-scheduler` to each of
the `dask-worker` processes when you run them.
Provide two screenshots to show that you successfully started both of
the `dask-worker` processes by passing the correct address to the `dask-scheduler`.

#### Activity 22.3 Step 4

Create a Jupyter Notebook to simulate a client program that
has complex computation.
Add the following code to your Jupyter Notebook to
import the required DASK libraries:

```python
import dask.array as da
from dask.distributed import Client
```

Provide a screenshot to show that you created a Jupyter Notebook and
successfully imported the DASK libraries.

#### Activity 22.3 Step 5

Complete the following code to
create a 50,000 by 50,000 matrix of random numbers in DASK.
Compute the mean and assign the value to the y variable:

```python
x = da.random.random((50000, 50000))
y = da.exp(x).????
```

Provide a screenshot to show that you successfully executed the command to
create a matrix, compute the mean, and assign the value to the `y` variable.

#### Activity 22.3 Step 6

Now create a DASK `client` that passes the address of your `dask-scheduler`.
Call the `compute` function on the `y` variable to instruct DASK to
execute the command:

```python
client = Client("????????")
y.??
```

Provide a screenshot to show that
you successfully computed your calculations using DASK using the `compute` function.

You have completed this activity and
practiced simulating running complex operations across
multiple machines using DASK.

### Activity 22.3 Submission Instructions

Your submission for this activity should be a Word document that
includes the following screenshots,
each labeled for the step that the screenshot represents:

1. Provide a screenshot to show that you successfully installed DASK.
2. Provide a screenshot to show that you successfully ran the `dask-scheduler`.
3. Provide two screenshots to show that you successfully started both of
    the `dask-worker` processes by passing the correct address to
    the `dask-scheduler`.
4. Provide a screenshot to show that you created a Jupyter Notebook and
    successfully imported the DASK libraries.
5. Provide a screenshot to show that you successfully executed the command to
    create a matrix, compute the mean, and assign the value to the `y` variable.
6. Provide a screenshot to show that
    you successfully computed your calculations using DASK using the `compute` function.

### Activity 22.3 Additional Information

* **Estimated Time**: 45 minutes
* This is a required activity and counts towards your course grade.

## Discussion 22.1: Use Cases for Parallel Computing

### Discussion 22.1 Introduction

Nvidia is the premier organization that designs and
produces graphic processing units (GPUs).
Since Nvidia introduced GPUs that could process general application data in
parallel in 2006, the practice of parallel computing has expanded to
all levels of the data engineering industry [(Gossett 2020)][gossett20].
GPUs are ideal for parallel computing,
as they have large shared memory busses and multiple cores.
Now that this technology has taken off and become widely available,
here are a few interesting ways in which parallel computing is being used today:

### Discussion 22.1 Implementations of Parallel Computing

#### Parallel Computing in Banking

Today, large banks use tens of thousands of cutting edge GPUs to
process credit scores, perform risk modeling, and detect fraud.
By processing this data in parallel using GPUs vs. CPUs,
banks have reported savings of up to 80% and have improved risk calculations by
40% [(Gossett 2020)][gossett20].
GPUs are also used within the crypt-mining industry.

#### Parallel Computing in the Automotive Industry

The intricate,
complex systems of modern automobiles require hundreds of computers to drive a car.
Today, cars must process information in real time to
successfully run advanced technologies, such as lane-keeping assistant and
adaptive cruise control [(Gossett 2020)][gossett20].
The instantaneous output of these computers is made possible by parallel computing.
Not only is the technology in automobile design reliant on parallel computing,
but modern race car drivers also use complex simulation software,
which is only made possible through the speed of parallel computing [(Gossett 2020)][gossett20].

#### Parallel Computing in the Medical Industry

The processing power of parallel computing also
allows for advances in medical research.
Acellera is a London-based organization that
applies parallel computing architecture to
run simulations of molecular dynamics to aid in drug discovery. [(Gossett 2020)][gossett20]

### Discussion 22.1 Instructions

In this discussion post, you will consider the examples above and
research other ways that parallel computing is used across different industries.
In your discussion post, respond to the following prompts:

* Identify two different implementations of parallel computing that
* have led or could lead to innovation in a specific field.
* What are some challenges of each of these implementations?
* Could the use of parallel computing in these instances potentially lead to
* the development or discovery of entirely new technologies?
* If the examples you have selected are new technologies,
  what are some of the limitations or challenges that
  prevented their development previously?
* If the examples you have selected are existing technologies,
  how is the use of parallel computing changing the way that
  the product is developed or used?

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and questions to
deepen the discussion.

### Discussion 22.1: My Response

#### Examples of Parallel Computing that Led to Innovation

Similar to how the medical industry has used parallel computation and
machine learning algorithms to
experiment in simulated environments different kinds of biochemical interactions,
the metallurgy industry has done the same to develop new composite materials that
have beneficial properties.
Those sorts of simulations and synthetic experiments would take far too long to
execute on single threaded execution.

Another example is the use of parallel computing in
the development of new kinds of batteries.
The exact electrochemical physics of battery technology is highly complex and
finding the exact kinds of geometries, cathode materials, anode materials,
and nano-structures within the battery leaves a state space of
unimaginable numbers of configurations.
While highly trained scientists can make good hypotheses of what to experiment on,
the minute details are extremely hard to predict and
that experimental process can again be accelerated through simulations before
it gets verified in real world experiments.
This has led to improvements in the capacity of batteries that are in use today.

#### Challenges of these Implementations

Both my examples involve synthetic experiments run in simulators.
The main challenge in these sorts of
uses of parallel computing is the accuracy of the simulations.
These simulations need to be as close to our real world physics as possible to
be useful.
That often involves going well beyond the typical 2nd order differential equations
that most undergraduate courses will teach about physical phenomena.
This increases computational complexity and thus requires more computing power.
So while the complexity of coding these simulations is still there,
at least the computation time can be reduced by parallelizing the workload.

#### Parallel Computing Leading to New Technologies

I think my two examples demonstrate this quite well.
Especially when machine learning is involved.
Machine learning algorithms are naive about the physics involved,
it just has an objective function to optimize.
This means that our own human biases aren't as involved in the experimental process and
a whole new set of unique solutions to physical problems can be quickly experimented and
validated in the real world.

#### Previous Problems

The previous issues with discovering new composites and battery chemistries was that
without synthetic experiments involving physics simulations was that
experimentation takes a lot of effort to set up.
It's also likely the experiment only tests a small range of possibilities each time.
Running simulations in parallel can greatly accelerate the process and
afterwards the best virtual experiments can then be taken to the real world for validation.

#### How is Parallel Computing Changing the Way these Products are Developed

As I've already explained,
the experimental phase of developing products like composites or
batteries can now be accelerated.
Checking hypotheses can be accelerated.
Designing experiments can be accelerated.
The experiments can even be avoided and let simulations run them and
once promising simulated experiments have been found,
then take the effort to validate it in the real world through real experiments.
All this means is that research and development in the physical sciences can
go much faster,
assuming the simulations are accurate enough.

## Knowledge Check 22.1: DASK and Parallel Computing

* Q1: Which of the following is correct about DASK?
  * DASK allows multiple tasks to run in parallel **(correct)**.
* Q2: Which of the following options is correct about threads?
  * All the answer options are correct **(correct)**.
* Q3: Which of the following libraries from DASK can be used for
  parallel computing?
  * `delayed` **(correct)**.
* Q4: Which of the following statements can be used to create a DASK dataframe?
  * `datasets.timeseries()`
  * `dask.timeseries()`
  * `dask.datasets.timeseries()` **(correct)**.
  * `dask.datasets.time()`
* Q5: Which of the following pandas libraries can be used to
  create 100 files in parallel?
  * DASK **(correct)**.
* Q6: Which of the Python statements can be used to import DASK dataframes?
  * `import dask.dataframe` **(correct)**.
* Q7: Which of the following DASK functions are for distributed computing w/ DASK?
  * `dask-scheduler` and `dask-worker` **(correct)**.
* Q8: Which Python statements import a DASK client to a Python workspace in
  a distributed processing environment?
  * `from dask.distributed import Client` **(correct)**.
* Q9: What is the meaning of thread in parallel computing?
  * single pipeline that is responsible for processing a specific smaller task in
    order to solve a larger problem. **(correct)**.
* Q10: Which of the following are the levels of parallel computing?
  * Bit-level, instruction-level, data-level, task-level **(wrong)**.
  * Instruction level and task level **(correct)**.
* Q11: Given a task, `a`, which DASK command is used for task visualization?
  * `a.visualize()` **(correct)**.
* Q12: What does the `dask-scheduler` command do?
  * It manages the memory distribution across `dask-workers` **(wrong)**.
  * It manages all dask tasks **(correct)**.

## Discussion 22.2: Use Cases of Web Sockets

### Discussion 22.2 Introduction

As you continue to learn about data streaming platforms,
you will build on your understanding of how web sockets are useful for
maintaining a steady connection between the client and the server.
Web sockets enable instant data exchange and
are supported by all modern browsers.
You can begin using web sockets immediately in your web applications.

This discussion will help you determine whether or
not web sockets would be useful for a particular project scenario.
The key questions to consider when assessing the use of web sockets are:

* Would the application involve multiple users communicating?
* Would the application alignment with the server-side data that's
  constantly changing?

### Discussion 22.2 Instructions

For your discussion post, choose any two project scenarios from
the list below and explain why you might need to use web sockets for that
specific application type.
Be sure to address the two questions above in each scenario that you analyze.
See the project scenarios below:

1. Social Feeds
2. Multiplayer Games
3. Collaborative Editing / Coding
4. Click-stream Data
5. Live Stock Market
6. Location Based Applications

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and questions to
deepen the discussion.

**Suggested Time:** 60 minutes
**Suggested Length:** 250 words

### Discussion 22.2 Response

#### Multiplayer Games

Web sockets would be useful for multiplayer games because
of the real-time nature of how game clients need to interact in a shared environment.
Many if not most online games have a lot of real-time synchronization between
the game clients and the game server.
Sometimes games can be asynchronous and changes can be waited on,
but a lot of the time the simulation stops making sense when there isn't
a clear causality for everyone's interactions in the game.
This means that actions in-game,
need to update a centralized instance of the game in
a central server as quick as possible.
Web sockets help this problem by making communications immediate.
There's no need to wait for responses,
you just immediately send data over the open, long-lived connection to the server.

#### Live Stock Market

Web sockets help with live stock markets as well.
When stock trading,
a lot of data gets produced very quickly.
Sending the data to a stock trading client immediately through an open connection
is very important.
Not only does it improve the user experience,
it makes the servers serving the data more efficient.
It means it doesn't have to constantly leave thousands of connections paused to
await responses.
With web sockets an open connection is maintained and
as soon the server has up-to-date data on a stock a user is viewing,
it immediately sends it.

## Activity 22.4: Streaming Web Sockets

### Activity 22.4 Introduction

In this module, you learned about streaming data implementation strategies and
how web sockets are beneficial in implementing live data connection apps.

In this activity,
you will implement web socket communication by using the Python sockets library.
Through the steps of this activity,
you will execute packet transfer from server to
client to help you better understand how packets can be created by
putting the message length as a header.

### Activity 22.4 Instructions

#### Activity 22.4 Step 1

Download and extract the Python code from
the [johntango Streaming GitHub repository][gh-act-22-4] to your local machine.
Provide a screenshot to show that you have successfully downloaded and
extracted the johntango Streaming GitHub repository on your local machine.

#### Activity 22.4 Step 2

Open the `streamServer.py` file in VS Code.
Provide a screenshot to show that
you successfully opened the `streamServer.py` file in VS Code.

#### Activity 22.4 Step 3

To start a web socket server, execute the `python streamServer.py` command from
the Terminal window in VS Code.
This will not print anything until the client connects to the server.
Provide a screenshot to show that you successfully opened the command prompt in
the `streamServer.py` folder and
ran the `python streamServer.py` command without errors.

#### Activity 22.4 Step 4

To start a web socket client,
open a new command line interface in the VS Code Terminal and
execute the `python streamClientEx1.py` command from the Terminal.
This will establish a connection with the server and
receive packets from the server.
Provide a screenshot to show that you successfully opened the command prompt in
the `streamClientEx1.py` folder, ran the `python streamClientEx1.py` command,
and received the message from the server.

#### Activity 22.4 Step 5

Review the server console that indicates that
the connection has been established and shows that
packets are being sent to the client.
Provide a screenshot to show that after running the client packets that
are being sent to the client.
Provide a screenshot to show that after running the client code,
you can view the sent messages output over the server CLI.

#### Activity 22.4 Step 6

To review another client communication,
open a new command line interface in the VS Code Terminal and
execute the `python streamClient01Soln.py` command from the Terminal.
This will establish another connection with
the server and receive packets from the server.
Provide a screenshot to show that you successfully opened the command prompt in
the `streamClient01Soln.py` file, ran the `python streamClient01Soln.py` command,
and can view the received message from the server.

#### Activity 22.4 Step 7

Open the `streamclient01Soln.py` file.
Add a debugging checkpoint at line 13 and run the code to debug it.
Provide a screenshot to show that you successfully opened the client code in
the `streamClient01Soln.py` folder and added a debugging checkpoint at line 13.

#### Activity 22.4 Step 8

The previous step will establish a connection with
the server and receive packets from the server.
The variables listed in the left panel in VS Code when debugging your code show that
the value of the Python `msg` variable is "`'29    The ti'`".
Provide a screenshot to show that you were able to
run the client code in debugging mode and see that
the value of the Python `msg` variable is "`'29    The ti'`" in VS Code.

## Final Assignment 22

### Part 1: Parallel Computing with Pandas, NumPy, and DASK

#### 22.1: Introduction

The final assignment for this module is divided into two parts.

In Part 1 of the final assignment, you will compare the performance of the pandas,
NumPy, and DASK libraries when performing calculations.
In the first section, you will be working with NumPy and DASK arrays to
analyze which library is faster.
In the next section, you will make the same comparison working with
pandas and DASK dataframes.

Part 1 of the final assignment is worth 60 points.

#### 22.1: Instructions

##### Step 1

Download the [Assignment 22.1][pcde-assignment-22-1-dl] folder and
open it using your local instance of Jupyter Notebook.
There are 14 questions throughout the Jupyter Notebook for this activity.
Some questions will require you to modify code,
and others will require open-ended written responses.

##### Step 2

Read the instructions and modify the code that
is provided in the related cells for the following questions:

* a: Part 1: 1, 2, 4, 5, 6, 8, 9
* b: Part 2: 11, 13

##### Step 3

Read the instructions and complete the open-ended questions for
questions 3, 7, 10, 12, and 14.
Below each cell that contains a question,
you will see a Markdown cell in which you can answer that question.
Responses should fully answer the question that is provided,
and each response should be approximately two or three sentences.

### 22.1: Submission

Your submission for this activity should be a Jupyter Notebook that
includes your completed code and your open-ended responses:

#### Part1: Numpy vs. DASK

1. Update the code cell by filling in the ellipsis to
    create a two-dimensional NumPy array, `arr`, with entries from
    1 to 1,000 and dimensions 2,000 by 2,000.
2. Update the code cell by setting the value of the `chunks` argument to
    be equal to a tuple with elements equal to 250 and 250 to
    divide the NumPy array into smaller chunks, each with dimensions 250 by 250.
3. Describe your observations from the result that prints from
    running the code provided.
    State the size of each chunk and
    how many chunks the NumPy array is divided into.
4. Update the code cell by calling the `npartitions` method on the DASK array to
    print the number of partitions to the screen.
5. Update the code cell by setting the `axis` argument equal to
    0 to sum over the rows.
6. Update the code cell by calling the correct DASK function to
    visualize how each row is summed.
7. Explain your observations of the graph produced by the code provided.
8. Update the code cell by calling the `numpy_arr_chk()` function and
    assigning the result to the `num_time` variable.
9. Update the code cell by calling the `dask_arr_chk()` function and
      assigning the result to the `dask_time` variable.
10. Describe which library performs better,
    NumPy or DASK, and explain your reasoning.
11. Update the code cell by completing the code to
    read the same dataset using DASK with the DASK `read_csv()` function.
12. Describe which dataframe takes longer, pandas or DASK,
    and explain your reasoning.
13. Update the code cell by setting the `npartition` argument inside of
    the `from_pandas` function equal to 2 and run the code cell to
    compare the `df_pandas_big` and `df_dask_big` dataframes.
14. Describe which library takes less time to run, pandas or DASK,
    and explain your reasoning.

## References

### Web Links

* [PCDE Emeritus Try-It Activity 22.1 Download][try-it-22-1]
* [Archive.org][archive]
* [PCDE Try-It Activity 22.2 Download][try-it-22-2-dl]
* [PCDE Activity 22.1 Download][pcde-act-22-1-dl]
* [Activity 22.2 Download][pcde-act22-2-dl]
* [Gossett, Stephen. '9 Parallel Processing Examples & Applications'. 2020-01-22][gossett20]
* [Activity 22.4: Web Socket Streaming Download][gh-act-22-4]
* [PCDE Course Assignment 22.1 Download][pcde-assignment-22-1-dl]

<!-- Hidden References -->
**TODO**: Add this archive to your own archive for reliable access.
***TODO***: Then add this archive to a permalink short-link.

[try-it-22-1]: https://classroom.emeritus.org/courses/1412/files/1004624/download "PCDE Try-It Activity 22.1 Download"
[archive]: https://archive.org/ "Archive.org"
[try-it-22-2-dl]: https://classroom.emeritus.org/courses/1412/files/1004602/download "PCDE Try-It Activity 22.2 Download"
[pcde-act-22-1-dl]: https://classroom.emeritus.org/courses/1412/files/1004651/download "PCDE Activity 22.1 Download"
[pcde-act22-2-dl]: https://classroom.emeritus.org/courses/1412/files/1004592/download "Activity 22.2 Download"
[gossett20]: https://builtin.com/hardware/parallel-processing-example "Gossett, Stephen. '9 Parallel Processing Examples & Applications'. 2020-01-22"
[gh-act-22-4]: https://github.com/johntango/Streaming "Activity 22.4: Web Socket Streaming Download"
[pcde-assignment-22-1-dl]: https://classroom.emeritus.org/courses/1412/files/1004594/download "PCDE Course Assignment 22.1 Download"

### Note Links

* [Pandas (Python Dataframe Library)][-pd]
* [Parquet (Apache Columnar Storage Format)][-parquet]
* [Feather (Apache Columnar Storage Format)][-feather]
* [Parallel Computing][-parallel]
* [DASK (Python Multiprocessing Library)][-dask]
* [Web Sockets][-web-sock]
* [Web Sockets in Python][-py-ws]

<!-- Hidden References -->
[-pd]: pandas.md "Pandas (Python Dataframe Library)"
[-parquet]: parquet.md "Parquet (Apache Columnar Storage Format)"
[-feather]: apache-feather.md "Feather (Apache Columnar Storage Format)"
[-parallel]: parallel-computing.md "Parallel Computing"
[-dask]: python-dask.md "DASK (Python Multiprocessing Library)"
[-web-sock]: web-socket.md "Web Sockets"
[-py-ws]: python-web-socket.md "Web Sockets in Python"
