---
created: 2022-12-27T16:34:00Z
tags: [www,gatsby,js,ts,ssg,static,web]
---

# Gatsby

<!-- TODO: Add note links to this section -->
Gatsby is a static site generator using NodeJS,
[React](./react.md), Webpack & GraphQL.

## Init a Gatsby Project

To get an interactive prompt to generate a blank gatsby project use this.

```sh
npm init gatsby
```

## Sourcing Markup from Filesystem

There's a [plugin][gatsby-docs-source-fs] `gatsby-source-filesystem`
that sources data into the Gatsby application's graph from
the local filesystem.
The plugin crteates `File` nodes from local files.
From there *transformer* plugins can *transform*
`File` nodes into many kinds of data.

### Configure gatsby-source-filesystem

```js
// ./gatsby.config.js
module.exports = {
  plugins: [
    // You can have many instances of this plugin
    // to read source nodes from different locations on your
    // filesystem.
    //
    // The following sets up the Jekyll pattern of having a
    // "pages" directory for Markdown files and a "data" directory
    // for `.json`, `.yaml`, `.csv`.
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `pages`,
        path: `${__dirname}/src/pages/`,
      },
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `data`,
        path: `${__dirname}/src/data/`,
        ignore: [`**/\.*`], // ignore files starting with a dot
      },
    },
  ],
}
```

### Options for gatsby-source-filesystem

On top of the name & path parameters,
an *optional* `ignore` array of file globs to ignore.

The newly specified globs get added to the default list of file globs:

```txt
**/*.un~
**/.DS_Store
**/.gitignore
**/.npmignore
**/.babelrc
**/yarn.lock
**/node_modules
../**/dist/**
```

To prevent concurrent requests overload of `processRemoteNode`,
you can adjust the `200` default concurrent downloads,
with `GATSBY_CONCURRENT_DOWNLOAD` environment variable.

### How to Query File Nodes

Query file nodes like this:

```graphql
{
  allFile {
    edges {
      node {
        extension
        dir
        modifiedTime
      }
    }
  }
}
```

To filter by the `name` specified in the config,
use `sourceInstanceName`:

```graphql
{
  allFile(filter: { sourceInstanceName: { eq: "data" } }) {
    edges {
      node {
        extension
        dir
        modifiedTime
      }
    }
  }
}
```

### Helper functions for gatsby-source-filesystem

`gatsby-source-filesystem` exports 3 helper funcs:

* `createFilePath`
* `createRemoteFileNode`
* `createFileNodeFromBuffer`

### createFilePath

When building pages from files,
you often want to create a URL from file paths.
*Ie.* if you have a markdown file @
`src/content/2018-01-23-exploration-of-nature-of-reality.md`,
you might want to transform that into a page on your site @
`example.com/2018-01-23-exploration-of-nature-of-reality.md`.
`createFilePath` is a helper function that makes this easier.

```js
createFilePath({
  // The node you'd like to convert to a path
  // e.g. from a markdown, JSON, YAML file, etc
  node,
  // Method used to get a node
  // The parameter from `onCreateNode` should be passed in here
  getNode,
  // The base path for your files.
  // It is relative to the `options.path` setting in the `gatsby-source-filesystem` entries of your `gatsby-config.js`.
  // Defaults to `src/pages`. For the example above, you'd use `src/content`.
  basePath,
  // Whether you want your file paths to contain a trailing `/` slash
  // Defaults to true
  trailingSlash,
})
```

#### Example Usage

```js
const { createFilePath } = require(`gatsby-source-filesystem`)

exports.onCreateNode = ({ node, getNode, actions }) => {
  const { createNodeField } = actions
  // Ensures we are processing only markdown files
  if (node.internal.type === "MarkdownRemark") {
    // Use `createFilePath` to turn markdown files in our `data/faqs` directory into `/faqs/slug`
    const relativeFilePath = createFilePath({
      node,
      getNode,
      basePath: "data/faqs/",
    })

    // Creates new query'able field with name of 'slug'
    createNodeField({
      node,
      name: "slug",
      value: `/faqs${relativeFilePath}`,
    })
  }
}
```

### createRemoteFileNode

When building source plugins for remote data sources such as headless CMSs,
their data will often link to files stored remotely that
are often convenient to download so you can work with them locally.

The `createRemoteFileNode` helper makes it easy to download remote files.
Then it adds them to the project's GraphQL schema.

While downloading the assets,
special characters (regex:
`/:|\/|\*|\?|"|<|>|\||\\/g`)
in filenames are replaced with a hyphen ”-“.
When special characters are found a file hash is added to keep files unique
*e.g* `a:file.jpg` becomes `a-file-73hd.jpg`
*(as otherwise `a:file.jpg` and `a\*file.jpg` would overwrite themselves)*.

```js
createRemoteFileNode({
  // The source url of the remote file
  url: `https://example.com/a-file.jpg`,

  // The id of the parent node
  // (i.e. the node linked to the new remote file node.
  parentNodeId,

  // Gatsby's cache which the helper uses to check if the file has been downloaded already. It's passed to all Node APIs.
  getCache,

  // The action used to create nodes
  createNode,

  // A helper function for creating node Ids
  createNodeId,

  // OPTIONAL
  // Adds htaccess authentication to the download request if passed in.
  auth: { htaccess_user: `USER`, htaccess_pass: `PASSWORD` },

  // OPTIONAL
  // Adds extra http headers to download request if passed in.
  httpHeaders: { Authorization: `Bearer someAccessToken` },

  // OPTIONAL
  // Sets the file extension
  ext: ".jpg",
})
```

The following example is pulled from
[gatsby-source-wordpress][gatsby-docs-source-wordpress].
Downloaded files are created as `File` nodes and then
linked to the WordPress Media node,
so it can be queried both as a regular `File` node and from the
`localFile` field in the Media node.

```js
const { createRemoteFileNode } = require(`gatsby-source-filesystem`)

exports.downloadMediaFiles = ({
  nodes,
  getCache,
  createNode,
  createNodeId,
  _auth,
}) => {
  nodes.map(async node => {
    let fileNode
    // Ensures we are only processing Media Files
    // `wordpress__wp_media` is the media file type name for WordPress
    if (node.__type === `wordpress__wp_media`) {
      try {
        fileNode = await createRemoteFileNode({
          url: node.source_url,
          parentNodeId: node.id,
          getCache,
          createNode,
          createNodeId,
          auth: _auth,
        })
      } catch (e) {
        // Ignore
      }
    }

    // Adds a field `localFile` to the node
    // ___NODE appendix tells Gatsby that this field will link to another node
    if (fileNode) {
      node.localFile___NODE = fileNode.id
    }
  })
}
```

The file node can then be queried using GraphQL.
See an example of this in the
[gatsby-source-wordpress README][gatsby-docs-source-wordpress]
where downloaded images are queried using `gatsby-transformer-sharp`
to use in the component `gatsby-image`.

#### Retrieving the remote file name and extension

The helper tries first to retrieve the file name and
extension by parsing the url and the
path provided *(e.g. if the url is `https://example.com/image.jpg`,*
*the extension will be inferred as `.jpg` and the name as `image`).*
Finally, the name and the extension can be explicitly passed, like so:

```js
createRemoteFileNode({
  // The source url of the remote file
  url: `https://example.com/a-file-without-an-extension`,
  parentNodeId: node.id,
  getCache,
  createNode,
  createNodeId,
  // if necessary!
  ext: ".jpg",
  name: "image",
})
```

### createFileNodeFromBuffer

When working with data that isn’t already stored in a file,
such as when querying binary/blob fields from a database,
it’s helpful to cache that data to the filesystem in order to
use it with other transformers that accept files as input.

The `createFileNodeFromBuffer` helper accepts a `Buffer`,
caches its contents to disk,
and creates a file node that points to it.

The name of the file can be passed to the
`createFileNodeFromBuffer` helper.
If no name is given,
the content hash will be used to determine the name.

#### Example Usage

The following is adapted from the source of `gatsby-source-mysql`.

```js
// ./gatsby-node.js
// gatsby-node.js
const createMySqlNodes = require(`./create-nodes`)

exports.sourceNodes = async ({ actions, createNodeId, getCache }, config) => {
  const { createNode } = actions
  const { conn, queries } = config
  const { db, results } = await query(conn, queries)

  try {
    queries
      .map((query, i) => ({ ...query, ___sql: results[i] }))
      .forEach(result =>
        createMySqlNodes(result, results, createNode, {
          createNode,
          createNodeId,
          getCache,
        })
      )
    db.end()
  } catch (e) {
    console.error(e)
    db.end()
  }
}

// create-nodes.js
const { createFileNodeFromBuffer } = require(`gatsby-source-filesystem`)
const createNodeHelpers = require(`gatsby-node-helpers`).default

const { createNodeFactory } = createNodeHelpers({ typePrefix: `mysql` })

function attach(node, key, value, ctx) {
  if (Buffer.isBuffer(value)) {
    ctx.linkChildren.push(parentNodeId =>
      createFileNodeFromBuffer({
        buffer: value,
        getCache: ctx.getCache,
        createNode: ctx.createNode,
        createNodeId: ctx.createNodeId,
      })
    )
    value = `Buffer`
  }

  node[key] = value
}

function createMySqlNodes({ name, __sql, idField, keys }, results, ctx) {
  const MySqlNode = createNodeFactory(name)
  ctx.linkChildren = []

  return __sql.forEach(row => {
    if (!keys) keys = Object.keys(row)

    const node = { id: row[idField] }

    for (const key of keys) {
      attach(node, key, row[key], ctx)
    }

    node = ctx.createNode(node)

    for (const link of ctx.linkChildren) {
      link(node.id)
    }
  })
}

module.exports = createMySqlNodes
```

### Troubleshooting

In case that due to spotty network,
or slow connection,
some remote files fail to download.
Even after multiple retries and adjusting concurrent downloads,
you can adjust timeout and
retry settings with these environment variables:

* `GATSBY_STALL_RETRY_LIMIT`, default: `3`
* `GATSBY_STALL_TIMEOUT`, default: `30000`
* `GATSBY_CONNECTION_TIMEOUT`, default: `30000`

## Transforming Markdown

The plugin [`gatsby-plugin-mdx`][gatsby-docs-plugin-mdx] is the
official *de-facto* plugin for transforming mardkown files.

***TODO ADD DETAILED INSTRUCTIONS ABOUT THIS FROM ABOVE LINK***

## GraphQL Type Generation

From [gatsby's article on GraphQL typegen][gatsby-graphql-typegen].

>One of Gatsby's strenghts is combining multiple sources of data into
>one universal GraphQL API and then templating that content into pages.
>In the end the only thing needed to learn is the graphQL API of Gatsby.
>This makes it easier to use the Typescript annotation system to
>do the rest.


For more details please read
[Gatsby's GraphQL typegen documentation][gatsby-docs-gql-typegen].

### How to Use GraphQL Typegen

To activate the built-in feature:

```js
module.exports = {
    graphqlTypegen: true,
}
```

Now when `gatsby develop` is commanded,
you'll see a new activity printed to the console,
*"Generating GraphQL & Typescript types".*
More files will get created as well.
The `src/gatsby-types.d.ts` file contains
all the schema/query types of the project.

It's a good idea to include this in the project `.gitignore`.
Include this file as well in the `./tsconfig.json` configuration.
That way typescript will automatically pickup any new types.
The below `tsconfig.json` will contain `./src/**/*` which is necessary
to pickup the new types file.

```json
{
    "compilerOptions": { /* Your options */ },
    "include": ["./src/**/*", ".gatsby-node.ts",
        "./gatsby-config.ts", "./plugins/**/*"]
}
```

### Using Auto-Generated Queries Types

Once the types are generated there will be a `Queries` namespace
available through the Typescript ecossystem.
For this exmaple to work you'll have to have a `title` inside your
`siteMetadata` (in `gatsby-config`).

### GraphQL ES-Lint

You can optionally use [graphql-eslint][graphql-eslint-gh]
to lint GraphQL queries. It seamlessly integrates with the 
`graphql.config.js` file created previously.
To install it install all the dependencies using `npm`.

```sh
npm install --save-dev eslint @graphql-eslint/eslint-plugin @typescript-eslint/eslint-plugin @typescript-eslint/parser
```

Then edit your `pakcage.json` to add two scripts.

```json
// package.json
{
  "scripts": {
    "lint": "eslint --ignore-path .gitignore .",
    "lint:fix": "npm run lint -- --fix"
  },
}
```

Create a `.eslintc.js` file to configure ESLint

```js
// ./.eslintrc.js
module.exports = {
  root: true,
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      processor: '@graphql-eslint/graphql',
      parser: "@typescript-eslint/parser",
      extends: [
        "eslint:recommended",
        "plugin:@typescript-eslint/recommended"
      ],
      env: {
        es6: true,
      },
    },
    {
      files: ['*.graphql'],
      parser: '@graphql-eslint/eslint-plugin',
      plugins: ['@graphql-eslint'],
      rules: {
        '@graphql-eslint/no-anonymous-operations': 'error',
        '@graphql-eslint/naming-convention': [
          'error',
          {
            OperationDefinition: {
              style: 'PascalCase',
              forbiddenPrefixes: ['Query', 'Mutation', 'Subscription', 'Get'],
              forbiddenSuffixes: ['Query', 'Mutation', 'Subscription'],
            },
          },
        ],
      },
    },
  ],
}
```

Create a `graphql.config.js` @ project root.

```js
// ./graphql.config.js
module.exports = require("./.cache/typegen/graphql.config.json")
```

Start the Gatsby development server with `gatsby develop` & check that
it created `.cache/typegen/graphql.config.json`.

You can now run `npm run lint` & `npm run lint:fix` to check your
GraphQL queries, like if they're named.

## Install TailwindCSS

Most of this content is taken from this
[tailwind on gatsby guide][tailwind-gatsby-install].

### Install Dependencies

After creating a gatsby project, go to its root directory.
Then using `npm install -D` to install peer dependencies,
enter the below command:

```sh
npm install -D tailwindcss postcss autoprefixer gatsby-plugin-postcss
npx tailwindcss init -p
```

### Enable Gatsby PostCSS Plugin

In `./gatsby-config.js`, enable the `gatsby-plugin-postcss` plugin.
For more information see the [plugin's documentation][gatsby-docs-postcss]

```js
// ./gatsby-config.js
plugins: [
  {
    // ...
    plugins: [
      'gatsby-plugin-postcss',
      // ...
    ],
  },
]
```

### Configure Template Paths

Add the paths to all the template files that will be used with postCSS.
This gets done in the `./tailwind.config.js` file.

```js
// ./tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/pages/**/*.{js,jsx,ts,tsx}",
    "./src/components/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

### Add the Tailwind directives to CSS

Create a `./src/styles/global.css` file &
add the `@tailwind` directives for ea. of Tailwind's layers.

```js
// ./src/styles/global.css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### Import the CSS File

Create a `gatsby-browser.js` file at the root of the project if
it doesn't already exist.

```js
import './src/styles/global.css'
```

### Start Build Process

Run the build process with `gatsby develop`

```sh
gatsby develop
```

### Start Using Tailwind

Start using Tailwind's utility classes to style your content.

```js
// ./pages/index.jsx
export default function IndexPage() {
  return (
    <Layout>
      <h1 className="text-3xl font-bold underline">
        Hello world!
      </h1>
    </Layout>
  )
}
```

## Creating Tags Pages for Blog Posts

Taken from Gatsby's documentation for [creating tag pages][gatsby-tag-pages].

>Creating tag pages for your blog post is a way to
>let visitors browse related content.

***TODO*** Link & notetake on the datalayer link in this article &
the adding markdown pages article

>To add tags to your blog posts,
>you will first want to have your site set up to
>turn your markdown pages into blog posts.
To get your blog pages set up,
>see the tutorial on Gatsby’s data layer and Adding Markdown Pages.
***TODO*** Link these above line



## Gatsby Git Source Plugin

A [source plugin][gatsby-docs-source-git] for pulling files into
the Gatsby graph from arbitrary git repositories.
This is very useful for separating the markup from
the site templates and logic.
The plugin is also handy for aggregating content from disparate repositories.

It *(shallow as in into cache)* clones the configured repo and
puts the files and their contents into the graph as `File` nodes.
From there, it's as if [gatsby-source-filesystem](./gatsby.md#Sourcing Markup from Filesystem) was used to poll files from the local filesystem.

The only difference is that the `File` nodes created by this plugin
have `gitRemote` fields, which provide git based metadata.
The metadata is mostly provided by [IonicaBazau/git-url-parse][git-url-parse].
There's only the `ref` & `weblink` fields that are added.
Two things you really want if you need *"edit on github"* style links.

### Install gatsby-source-git

Install from terminal using `npm` with this command.

```sh
npm install --save gatsby-source-git
```

### Plugin Options

* `name`: A machine name label for ea. plugin instance.
* `remote`: The url to clone from
* `branch`: *(Optional)* The git branch to use.
With none supplied, it uses the *default* branch
* `patterns`: *(Optional)* Passed to [fast-glob][glob-zk] to
determine which files get sucked into the graph.
* `local`: *(Optional)* Specify local path for the repo to be cloned into.
It will default to a directory within the local Gatsby cache.
Note that using a location outside the cache will
prevent you changing the branch via gatsby-config.js.
You will need to synchronise the branch of the local checkout yourself.
However if clones are painful and slow for you,
then using a custom location will prevent your local repo getting trashed when
Gatsby clears the cache, which should help.

### Example gatsby-config.js

```js
// ./gatsby-config.js
module.exports = {
  plugins: [
    // You can have multiple instances of this plugin to read source files from
    // different repositories or locations within a repository.
    {
      resolve: `gatsby-source-git`,
      options: {
        name: `repo-one`,
        remote: `https://bitbucket.org/stevetweeddale/markdown-test.git`,
        branch: `develop`,
        // Only import the docs folder from a codebase.
        patterns: `docs/**`
      }
    },
    {
      resolve: `gatsby-source-git`,
      options: {
        name: `repo-two`,
        remote: `https://bitbucket.org/stevetweeddale/markdown-test.git`,
        // Specify the local checkout location, to avoid it being trashed on
        // cache clears.
        local: '/explicit/path/to/repo-two',
        // Multiple patterns and negation supported. See https://github.com/mrmlnc/fast-glob
        patterns: [`*`, `!*.md`]
      }
    }
  ]
};
```

### How to Query

You can query file nodes exactly as you would query nodes created with
[gatsby-source-filesystem](./gatsby#How to Query File Nodes).
Just follow the same instructions in the above section for
querying `File` nodes.

However, there's also some extra metadata about the git references to query.

```graphql
{
  allFile {
    edges {
      node {
        gitRemote {
          webLink
          ref
        }
      }
    }
  }
}
```

## References

### Web Links

* [Gatsby Plugin gatsby-source-filesystem (from gatsbyjs.com plugins)][gatsby-docs-source-fs]
* [Gatsby Plugin gatsby-plugin-mdx (from gatsbyjs.com plugins)][gatsby-docs-plugin-mdx]
* [How to Use Gatsby GraphQL Type Generation][gatsby-graphql-typegen]
* [GraphQL Typegen (from gatsbyjs.com documentation)][gatsby-docs-gql-typegen]
* [ESLint parser, plugin, rules for GraphQL (from GitHub by B2o5T)][graphql-eslint-gh]
* [Install Tailwind CSS with Gatsby (from TailwindCSS.com Documentation)][tailwind-gatsby-install]
* [Gatsby Plugin gatsby-plugin-postcss (from gatsbyjs.com plugins)][gatsby-docs-postcss]
* [Creating Tags Pages for Blog Posts (from gatsbyjs.com docs)][gatsby-tag-pages]
* [Gatsby Plugin gatsby-source-git (from gatsbyjs.com plugins)][gatsby-docs-source-git]
* [Git-URL-Parse a high level git url parser for common git providers. (from Github by IonicaBizau)][git-url-parse]
* [Gatsby Plugin gatsby-source-wordpress (from gatsbyjs.com plugins)][gatsby-docs-source-wordpress]

<!-- Hidden References -->
[gatsby-docs-source-fs]: https://www.gatsbyjs.org/packages/gatsby-source-filesystem/ "Gatsby Plugin gatsby-source-filesystem (from gatsbyjs.com plugins)"
[gatsby-docs-plugin-mdx]: https://www.gatsbyjs.com/plugins/gatsby-plugin-mdx/ "Gatsby Plugin gatsby-plugin-mdx (from gatsbyjs.com plugins)"
[gatsby-docs-gql-typegen]: https://www.gatsbyjs.com/docs/how-to/local-development/graphql-typegen/ "GraphQL Typegen (from gatsbyjs.com documentation)"
[gatsby-graphql-typegen]: https://www.gatsbyjs.com/blog/how-to-use-gatsby-graphql-type-generation/ "How to Use Gatsby GraphQL Type Generation"
[graphql-eslint-gh]: https://github.com/B2o5T/graphql-eslint "ESLint parser, plugin, rules for GraphQL (from GitHub by B2o5T)"
[tailwind-gatsby-install]: https://tailwindcss.com/docs/guides/gatsby "Install Tailwind CSS with Gatsby (from TailwindCSS.com Documentation)"
[gatsby-docs-postcss]: https://www.gatsbyjs.com/plugins/gatsby-plugin-postcss/ "Gatsby Plugin gatsby-plugin-postcss (from gatsbyjs.com plugins)"
[gatsby-tag-pages]: https://www.gatsbyjs.com/docs/adding-tags-and-categories-to-blog-posts/ "Creating Tags Pages for Blog Posts (from gatsbyjs.com docs)"
[gatsby-docs-source-git]: https://www.gatsbyjs.com/plugins/gatsby-source-git/ "Gatsby Plugin gatsby-source-git (from gatsbyjs.com plugins)"
[git-url-parse]: https://github.com/IonicaBizau/git-url-parse "Git-URL-Parse a high level git url parser for common git providers. (from Github by IonicaBizau)"
[gatsby-docs-source-wordpress]: https://github.com/gatsbyjs/gatsby/tree/master/packages/gatsby-source-wordpress "Gatsby Plugin gatsby-source-wordpress (from gatsbyjs.com plugins)"

### Note Links

* [React Overview][react-zk]
* [Glob Patterns][glob-zk]

<!-- Hidden References -->
[react-zk]: ./react.md "React Overview"
[glob-zk]: ./glob-patterns.md "Glob Patterns"

### Referenced By

* [React Overview][react-zk]
