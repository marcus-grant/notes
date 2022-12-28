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

There's a [plugin][gatsby-docs-source-fs]
that sources data into the Gatsby application's graph from
the local filesystem.
The plugin crteates `File` nodes from local files.
From there various *transformer* plugins can *transform*
`File` nodes into various kinds of data.


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

## References

### Web Links

* [Gatsby Plugin gatsby-source-filesystem (from gatsbyjs.com plugins)][gatsby-docs-source-fs]
* [Install Tailwind CSS with Gatsby (from TailwindCSS.com Documentation)][tailwind-gatsby-install]
* [Gatsby Plugin gatsby-plugin-postcss (from gatsbyjs.com plugins)][gatsby-docs-postcss]
* [Gatsby Plugin gatsby-source-git (from gatsbyjs.com plugins)][gatsby-docs-source-git]
* [Git-URL-Parse a high level git url parser for common git providers. (from Github by IonicaBizau)][git-url-parse]

<!-- Hidden References -->
[gatsby-docs-source-fs]: https://www.gatsbyjs.org/packages/gatsby-source-filesystem/ "Gatsby Plugin gatsby-source-filesystem (from gatsbyjs.com plugins)"
[tailwind-gatsby-install]: https://tailwindcss.com/docs/guides/gatsby "Install Tailwind CSS with Gatsby (from TailwindCSS.com Documentation)"
[gatsby-docs-postcss]: https://www.gatsbyjs.com/plugins/gatsby-plugin-postcss/ "Gatsby Plugin gatsby-plugin-postcss (from gatsbyjs.com plugins)"
[gatsby-docs-source-git]: https://www.gatsbyjs.com/plugins/gatsby-source-git/ "Gatsby Plugin gatsby-source-git (from gatsbyjs.com plugins)"
[git-url-parse]: https://github.com/IonicaBizau/git-url-parse "Git-URL-Parse a high level git url parser for common git providers. (from Github by IonicaBizau)"

### Note Links

* [React Overview][react-zk]

<!-- Hidden References -->
[react-zk]: ./react.md "React Overview"
[gatsby-source-fs-zk]: 

### Referenced By

* [React Overview][react-zk]

