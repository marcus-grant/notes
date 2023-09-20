---
created: 2023-09-20T12:40:37.240Z
modified: 2023-09-20T19:53:51.217Z
tags: [work,applied-value,group,plan,knowledge,data,database,manage,system]
---
# AVG KMS: Plan 2023Q4

## The Plan

### Primary Goals

* The goal initially is to build up our database with info about our documents.
  * Every feature added in the future needs to have this derived info
* Because of this:
  * The first feature will be a case-closed submission client and server
    * Ensures all new closed case files are tagged and organized correctly
  * A server that brokers all data requests about our Box store needs to be made.
  * A client that allows colleagues to make sense of this data is then required.
  * A database that stores all learned information about the documents is needed.
* These three components then will need to have their own features developed to:
  * Increase utility of the system for consultants and managers.
  * Analyze the data so models can be developed or integrated to automate further.
  * Backfill old case files with a more usable organization structure and metadata.

### Before the Really Fun Stuff

* Before we get into the really desirable features such as:
  * Training **LLM**s *(Large Language Models ie ChatGPT/Copilot)*.
  * Using AI embeddings to generate content.
  * AI embeddings for suggestions on general case knowledge.
* The main features that should be developed before year's end:
  * Submissions Feature
  * Automated Tagging Feature
  * Search Feature
* This plan considers what features implement the most pre-requisites first.

## Features in Detail

### Case Submission Feature MVP

#### Case Submission Feature: The Why

* Teams has an SDK *(Software Development Kit)* for installable plugins on Teams.
  * It's easy to develop for with components we can compose relatively easily.
* Teams is a familiar interface for most people in this organization.
  * Less onboarding problems
* Therefore suited as a client for the **KMS** *(Knowledge Management System)*.
* In short it's a good first feature because:
  * It requires all three components that will need to be developed.
  * Normalizes the workflow and data for all future cases.
  * Onboards the staff with an easy to use feature.

#### Case Submission Feature: The What

* Should be the first feature to implement.
* Will give an interface to properly submit closed case files into box and
  * feed the database with the correct metadata.
* Ensures all new case files are correctly submitted making our lives easier.
* Requires file handling and authentication functions that future features need.
* Requires a database with the first schemas needed to both submit and...
  * ...later make requests for to make the system useful for consultants.

#### Case Submission Feature MVP: The How

* The case submission Feature will act as the client that consultants and managers use.
* The client will communicate with a Python server running on Azure functions.
* This server is the backend to the knowledge management system or **KMS-server**.
* The KMS-server will...
  * Handle requests from the Teams client.
  * Submit new case files to Box with user-selectable metadata like tags.
  * Update the database with file references, metadata such as tags and user.
* The Managed Database by Azure is there to store and return all derived data.

#### Case Submission Feature MVP: The plan

* Ekin has already prepared the UI for the Teams plugin
  * Needs networking features to connect to the KMS server.
  * Once the server is ready one to two weeks should be needed for it to work.
* Marcus is working on the KMS server which will need these functions:
  * Box API authentication as a service user and authenticated as Box users (done).
  * Box API file management can create, read, but **NOT** delete or modify documents.
    * Only Box modifications this server will be capable of is the metadata.
    * Should be done in one week from the offsite.
  * The HTTP communication portion of the server that brokers client requests.
    * Will make use of the Box API functionality that's soon to be completed.
    * Needs to be connected to the Teams Plugin Client
    * Should take about two weeks from offsite.
* An azure managed PostgreSQL database to store all derived metadata about Box
  * Working with Matti to setup administration privileges to setup the database.
* In short, this feature should be complete by end of October.

### Automated Tagging Feature

#### Automated Tagging Feature: The Why

* There's an estimated 2TB of case documents, vast majority are untagged.
* Impossible to perform manually in a timely manner.
* The KMS-server & database will have a trained model to create tag inferences.
  * This means we can slowly start letting the server automatically tag old files.
  * But first we should have some manual interventions in place.
  * (Discuss this workflow)

#### Automated Tagging Feature: The What

* With a pre-existing set of properly tagged documents we can...
  * Train a model that the KMS-server will run to suggest tags for old documents.
* The KMS-server will periodically classify a new batch of documents.
* Then the KMS-server will update its findings on the database.
  * These suggested tags can live on the database till the accuracy is validated.
* Once we're happy with the results in the database, the server will update Box.

#### Automated Tagging Feature: The How

* All currently tagged documents need to have their text content stored in database.
  * This will be used to train a model efficiently, off of Box's API.
* Then that text content with the in-place tags will be used to train a model.
  * This model is known as a classifier and will use the Naive Bayes algorithm.
  * It essentially correlates words frequency with pre-defined labels or tags.
  * Still used today to classify spam and is a proven text classification algo.
  * Relatively easy to implement algorithm.
* Once trained & validated, the model will be applied by the KMS-server in batches.
* The suggested tags will live on the database till we're happy with the accuracy.
* Some discussion needed on how we will determine "good enough" accuracy.
  * This also includes potentially developing an approval interface in Teams.
* When the accuracy is good enough, KMS-server will update Box with tags.
  * Will be done in batches to avoid going over daily budgeting of computation.

#### Automated Tagging Feature: The Plan (Part 1)

* The Database
  * Needs to be updated to include suggested tags vs manual ones.
  * Needs to add text contents for each document used for training.
  * This will be useful for other features in the future such as search.
  * These database updates should take about a week.
* Training the Model
  * With tags and text content we can start to train the model.
  * Some rounds of iteration may be needed to improve accuracy before deployment.
  * Might also need an approval interface and process that managers can use.
    * If so, that will be another feature to be developed in early 2024.
  * It's hard to guage development time of this part
    * Probabilistic models need iteration till error rate is low enough.
    * An early version could be developed in 1-2 weeks.
      * ...but iterated improvements could be necessary.
    * Discuss what "good enough" is & if manual approval should be implemented.

#### Automated Tagging Feature: The Plan (Part 2)

* Deploy Model to KMS-Server
  * The KMS-server is where this model will live in production.
  * Batches of documents will be indexed, probably by date (most recent first).
  * Batches will be sized to avoid exceeding daily budgetary limits on azure.
  * Daily, new batches will be created and tagged.
  * Integrating the model into the server is roughly 1 week of development.

### Search Feature

#### Search Feature: The Why

* Currently Box-based search for case files is not an efficient or pleasant experience.
* Box is not context sensitive enough.
* Tags will certainly help, but only so much.
* By combining the Box search with queries on our database - search will improve.

#### Search Feature: The What

* The goal is to integrate a search engine (i.e Elastic Search or Algolia) with:
  * The Box API that already exists for our Box files
  * Our document derived database
* The search results of these two combined will be far more nuanced.
* A naive combination of the results is the initial target.
* Tons of room for iterated improvements later on via ranking and machine learning.
* The interface to search would be on the Teams Plugin as another UI.

#### Search Feature: The How

* The server needs to integrate with the Box API to request search results.
  * 1 week of development time
* A search
* Instead of spending time crafting a search engine...
  * Try integrating one of the big name search engines as a service:
    * Elastic Search being most prominent, another up-and-coming is Algolia.
    * Only problem is data custody, need to discuss.
* Otherwise we can evaluate embedded search engines, would take more time.
* Depending on our solution, evaluation could take as much as 3 weeks
* Likewise, integration after evaluation as much as 2 weeks.

### Roadmap

* These 3 features involving 3 to 4 components, form a roadmap.
* Some evaluation could alter the timetable due to...
  * Unknowns about external services such as Box, Teams SDK, Azure, etc.
  * Non-deterministic nature of probabilistic models.
  * So far the biggest time sinks have been figuring out how to authenticate Box.
* Focus will be on getting a functioning version out the door fast.
* Iteration to improve the experience can and probably should be made in 2024.

### Future Topics: LLM

* Microsoft is hyping up Copilot being used to analyze documents improving ChatGPT.
* Very interesting possibility to decrease development and admin time.
* Probably not as smooth an integration experience as we'd like.
  * Having derived and labelled data in our databases should help significantly.
* Results in a chat-bot experience with specialized correlations from case files.
* Beware of AI Hallucinations.

### Future Topics: Iteration

* To know how to improve this system, actual user experiences will be needed.
* Give these features some time with staff and involve them in day-to-day workflows.
* The feedback should dictate what improvements to prioritize.

### Future Topics: How about You?

* Ultimately this is a tool to improve workflows at this firm.
* A single employee can only speculate so much which workflow improvements are most needed.
* Discuss what future goals this project should evaluate and attempt to reach.

* The next component is the KMS server
* Something needs to manage the authentication & data transfers with Box
* Putting this on the server side makes most sense
  * Batch jobs that need to happen in the background for data analysis
* The Teams Plugin will act as the client to this server.
