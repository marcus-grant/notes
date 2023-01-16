---
tags: [data,pcde,db,design,architecture,computers,software,storage]
---
# Database Design

**TODO** When the PCDE course gets here,
start looking through the notes in the course repo already written and put them here.
Then start to go through the course as intended and refine the notes and add to them.

## Relational Database Design

### Pros vs Cons

#### Pros

* You do not define physical storage,
  * You let the platform handle the particularities of individual bits, metadata, etc
* You do not need to define the logical access paths to data
  * NO hardcording paths or access, etc.
  * We are creating a data model,
or schema instead and the platform takes care of the rest

#### Cons

* NO built in protections against bad decisions about schema and
their relationships, they're everything.

## Process of Creating a Database Model

1. Understand what you are modeling
2. Identify the separate *entities* that need to be captured
3. Identify the *properties* of said *entities*
4. Identify what unique identifiers exist for those *entities*
5. Identify relationships between *entities* and *properties*.

### Understand the Entity or Domain

#### Get info about the domain, it takes time & effort.

* What is the environment
* What are the sources of info?
* How will the input be done? By Whom?
* Actions to learn about data model to be made in an organization:
  * Review files & forms
  * Track how data moves through the organization
  * Interview people who owk in different departments & perform different functions.
  * Talk about data consumers & producers
  * Think about how this data is consumed.
    * Reports, purchase orders, statistical information, etc.
* Understan that gettting the data model wrong can be paintful.
* It's important to understand that the design process is highly iterative
* First results should be early so feedback can be made early

### Identify Entities & Properties

* An *entity* is an object that has *properties*.
  * *Entity*: person
  * *Properties*:
    * Name
    * DOB
    * Weight
    * Email
    * etc.
* Each entity has corresponding *properties*
* *Entities* are the potential tables
* *Properties* are the potential columns
* Questions to ask yourself:
  * Did I miss any *entities* or *properties*?
  * Are the *properties* attached to the right *entity*?
    * *This is easy to get wrong*

### Identify Primary Keys, or What Makes an Entity Unique

* Why do you need a unique identifier?
  * To look through tons of records and recall any one of them
  * Also to tie different entities and properties together by their relationships
* Check if it already exists in the table
  * For example, a GUID (Globally Unique Identifier) or UUID (Universally Unique Identifier)
* Take a look at the *properties* of a `Student` *entity*:
  * FirstName
  * LastName
  * BirthDate
  * City
  * Region
  * Country
  * Which of these are unique?
    * The answer is none
    * FirstNames and LastNames frequently get reused.
      * So does every other *property*.
    * Not even combining FirstName and LastName results in true uniqueness
* Maybe combining everything creates a unique identifier,
  * but this is often overcomplicated.
* Attaching a *primary* key `StudentID` is much simpler and provides uniqueness
* *Primary Keys* are the unique identifier of an entity.
* When creating relations to other entities or properties,
*Foreign Keys* are the unique identifiers as a property on an entity
pointing to another entity

## References

### Web Links

* [Database Design Basics (from Microsoft Access Docs)][db-design-basics-msft]
* [Data Modeling 101 (from Agile Data by Scott Wambler)][data-modeling-101-agile]
* [Identifying Entities & Attributes (from Embarcadero Documentation)][ents-attrs-embarcadero]
* [What is a Unique Identifier & How Do we Use it?][unique-id-dbbee]

<!-- Hidden Reference Links Below Here -->
[db-design-basics-msft]: https://support.microsoft.com/en-us/office/database-design-basics-eb2159cf-1e30-401a-8084-bd4f9c9ca1f5 "Database Design Basics (from Microsoft Access Docs)"
[data-modeling-101-agile]: http://www.agiledata.org/essays/dataModeling101.html "Data Modeling 101 (from Agile Data by Scott Wambler)"
[ents-attrs-embarcadero]: https://docwiki.embarcadero.com/InterBase/2020/en/Identifying_Entities_and_Attributes "Identifying Entities & Attributes (from Embarcadero Documentation)"
[unique-id-dbbee]: https://www.dbbee.com/what-is-unique-identifier-and-how-to-use-it- "What is a Unique Identifier & How Do we Use it?"
