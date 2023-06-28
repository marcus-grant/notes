---
created: 2023-06-21T16:32:04.292Z
modified: 2023-06-28T14:48:39.593Z
tags: [pcde,data,javascript,pipeline,visual,graphic]
---
# PCDE Course Module 23 Content

## Introduction

In this module,
you will be working on another project that you can add to your portfolio.
In the first section, you will be introduced to Project 23.1,
in which you will create a sense-making data pipeline.
In the next section, you will learn about visualization, unstructured data,
and JavaScript.
First, you will learn how unstructured data differs from structured data.
Next, you will learn how JavaScript can be used for web development and
will research specific use cases for JavaScript.
You will also learn how the document object model (DOM) and
HTML tags can be used to enhance web pages.
Finally,
you will practice visualization using the Data-Driven Documents (D3) library to
visualize word frequency data.
In Project 23.1,
you will perform data analysis on unstructured MIT course catalog data and
use the D3 library to create a visualization of word frequency data.

Note: Make sure you have installed the tools you will need for Modules 23-24 in
the Course Tools Module before beginning this module.

## Lecture 23.2: Sense-making Using Course Catalog Data

***TODO:*** consider turning the sense-making pipeline into a document

Sense-making is something that we're always doing.
We're always trying to make sense of the world.
And in this project we're going to be doing precisely that with data.
And we'll be looking at data from MIT's course catalog.
During that process we'll try to *sense-make* from the data within
the online course catalog,
we're going to learn this process to
create a [sense-making data pipeline][-sense-pipe].

MIT's course catalog exists on this address
[https://student.mit.edu/catalog/index.cgi][mit-catalog].
To explore the data, a good start might be to use [cURL][-curl].

```sh
curl http://student.mit.edu/catalog/index.cgi
```

Then we get some HTML back that acts as an index to the catalog.
We should be able to collect those and crawl deeper into the site map.
For that though we should probably use [Python][-py] or another scripting language.
Specifically, we're going to use [Python's Standard Library URL-Lib][-py-url].
Then we'll parse the response which is an [HTML document][-html].
Then we'll extract the necessary data.
Then we'll create a sense-making data pipeline.
Finally, visualize the data using word frequency representations.

All this is covered in the [PCDE Course Project 23.1][-pcde-proj-23-1] note.

## Knowledge Check 23.1: Visualization, Unstructured Data, and Javascript.

* Q1: What is unstructured data?
  * Unstructured data is data that does not come with a predefined structure and
    and cannot be stored in a traditional database. **(Correct)**
* Q2: Which of the following categories does the data coming from emails,
  texts, social media, and weather imagery fall into?
  * Unstructured data **(Correct)**
* Q3: What does DOM stand for?
  * Document Object Model **(Correct)**
* Q4: What are HTML tags?
  * HTML tags are used to define and format the way content is displayed in a
    web browser. **(Correct)**
* Q5: What is the D3 library used for?
  * D3 is Javascript library used for visualizing data. **(Correct)**
* Q6: Which of the following tools can be used to manage unstructured data?
  * All the above **(Correct)**
* Q7: What is airflow used for?
  * Airflow can be use ot create fully automated data engineering pipelines.
    **(Correct)**
* Q8: What are reserved words in javascript?
  * Reserved words are keywords that have specific meaning in a code block and
    and cannot be used as variable names. **(Correct)**
* Q9: Which D3 function can you call to enhance the appearance of a bubble chart by,
  for example, adding the frequency of each word to the corresponding bubble?
  * text() **(Correct)**

## Discussion 23.1: Use Cases for JavaScript

### Discussion 23.1: Introduction

As you continue to learn about JavaScript,
you will see how using it can improve interactive behavior on a website by
transforming the site from static and unresponsive to dynamic and interactive.
The popularity of JavaScript has increased steadily over the last 10 years,
so you have most likely encountered many websites that use JavaScript in some way.

In this discussion,
you will determine whether or not the use of JavaScript would be important in
specific web application development use cases.
The key question to consider when
assessing the use of JavaScript programming is whether you want users to
interact with your website or not and what extent of interaction you would expect.

### Discussion 23.1: Instructions

For this discussion, research the following questions,
and describe the scope of JavaScript in web development.
In your discussion post, respond to the following prompts:

* Conduct some research on JavaScript as a game development tool.
  Can browser games be developed using JavaScript?
  If so, how? Discuss your findings.
* In the web development industry,
  would JavaScript be used on the front-end or back-end to program a website?
* What are some popular JavaScript frameworks,
  and which applications can be developed with each of them?
* Which types of interactive behaviors can be developed to
  enhance websites using JavaScript?
* Some popular use cases of JavaScript are web applications, smart watches,
  digital art creation, and ML.
  Select from the list below or research a use case of your own,
  and explain how JavaScript can be used as a development tool in
  your selected use case.
  * [Espruino: Bangle.js - A Javascript Smartwatch][banglejs]
  * [P5: A Javascript Library for Digital Art Creation][p5]
  * [ml5: A JavaScript Library for ML][ml5]

Read the statements posted by your peers.
Engage with them by responding with thoughtful comments and questions to
deepen the discussion.

### Discussion 23.1: My Response

#### Can Browser Games be Developed Using Javascript? If so How?

Yes, as Javascript is the only language with DOM access,
games actually **must** have some Javascript in them.
Typically when games use 3D,
WebGL gets used which is basically a browser based version of OpenGL.
This gives OpenGL like graphics instructions to render 3D scenes.
One popular library for this is *Three.js* which uses WebGL in the backend.

For sprite based games other options exist.
One of my favorite games, *Vampire Survivors*, though it can be launched from
the Desktop, is actually played on Electron,
a Desktop compatibility layer for browser based apps.
This game uses a library known as `Phaser.js` and
I've actually used it myself before.

#### Would Javascript be Used on the Front-end or Back-end to Program a Website?

Both are possible thanks to Node.js and Deno.js.
My current career is front-end engineering and I've frequently used Javascript both
in the front end and in the backend.

There's actually some paradigms for front-ends that even stretch this dichotomy of
the front and back-end.
Next.js is something I use nearly daily.
This is a library that allows you to develop React-based applications to
be served from the backend so there's less javascript being sent over the internet.
Next.js can also be used to implement HTTP APIs like we've seen before,
so theoretically you could even implement headless APIs without any front-end using it.

#### Some Popular Javascript Frameworks, Which Applications can be Developed with Them?

As I mentioned before,
Next.js is a full-stack framework for make full web applications using the React.js
rendering engine.
Sticking within the React ecosystem, which is likely the most popular way to
develop web apps to date,
there are three general ways to create web apps using this ecosystem.

First is the *Single Page Applicaiton*, which is what the original React library is used for.
These are applications that reside entirely in your browser.
API calls to access data is done from the browser to an API server.
Any manner of front-end application can be made from it.

Secondly there's the *Static Site Generator*.
One example of this using the React library is Gatsby.js.
This takes the React engine and some kind of content,
like markdown files, or CMS pages, or even just HTML and Javascript to
render templated HTML elements using React's syntax.
It determines what is static content and renders that as HTML & CSS and
the rest is sent as the minimal possible amount of javascript.
This greatly reduces the time it takes for a page to load.
It's also easy to deploy as you can just throw the generated files on a CDN,
kind of like the GitHub portfolio page we practiced on earlier.

Thirdly, there's the *Server Side Rendering* paradigm.
This is where the web app is fully, or partially rendered on a server and
the resulting HTML, CSS, and reduced javascript is sent directly to
the browser.
This combines the benefits of both SPAs and SSGs.
You get the faster load times and SEO of SSGs and
the added responsiveness of a fully client side SPA. 



## References

### Web Links

* [MIT Course Catalog Index][mit-catalog]
* [Espruino: Bangle.js - A Javascript Smartwatch][banglejs]
* [P5: A Javascript Library for Digital Art Creation][p5]
* [ml5: A JavaScript Library for ML][ml5]

<!-- Hidden References -->
[mit-catalog]: https://student.mit.edu/catalog/index.cgi "MIT Course Catalog Index"
[banglejs]: https://www.espruino.com/Bangle.js2 "Espruino: Bangle.js - A Javascript Smartwatch"
[p5]: https://p5js.org/ "P5: A Javascript Library for Digital Art Creation"
[ml5]: https://ml5js.org/ "ml5: A JavaScript Library for ML"

### Note Links

* [PCDE Course Project 23.1][-pcde-proj-23-1]
* [cURL (C HTTP Client)][-curl]
* [Sense-Making Pipelines][-sense-pipe]
* [Python][-py]
* [URL-Lib (Python StdLib)][-py-url]
* [HyperText Markup Language (HTML)][-html]
* [Exploratory Data Analysis (EDA, Data Science)][-eda]
* [Javascript][-js]

<!-- Hidden References -->
[-pcde-proj-23-1]: pcde-project-23-1.md "PCDE Course Project 23.1"
[-curl]: curl.md "cURL (C HTTP Client)"
[-sense-pipe]: sense-making-pipeline.md "Sense-Making Pipelines"
[-py]: python.md "Python"
[-py-url]: python-urllib.md "URL-Lib (Python StdLib)"
[-html]: html.md "HyperText Markup Language (HTML)"
[-eda]: ./exploratory-data-analysis.md "Exploratory Data Analysis (EDA, Data Science)"
[-js]: javascript.md "Javascript"
