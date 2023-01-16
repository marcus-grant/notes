---
tags: [jest, test, javascript, typescript]
created: 2023-01-13T12:15:00Z
---
# Jest

Jest is one of the most commonly used testing environments used in
the javascript & typescript developer communities.

## Setup

### Install Jest

Install jest as a dev dependency using this command (for npm):

```sh
npm install --save-dev jest
```

For yarn or pnpm:

```sh
pnpm add -D jest
```

The default environment is often not sufficient,
so next let's configure it.

### Configure Jest Environment

Jest automatically looks for tests with the following pattern:

```txt
**/__tests__/*
*.test.[js|jsx|ts|tsx]
```

This means any `.test.js`, `.test.jsx`, `.test.ts`, `.test.tsx` file or
file within `__tests__` will get executed by jest to evaluate tests.

Now this is a good default search path to use,
let's not fight it and setup a `./__tests__/` directory.
Then create a testing spec file.

```sh
mkdir __tests__
touch __tests__/some-module.test.js
```

### First Test File

With a test file set up,
create the first test to make sure it works.
We'll assume a module `some-module.js` is being tested with
the test file `./__tests__/some-module.test.js`, shown below.

```js
// ./__tests__/some-module.js
const some-module = require('./some-module.js');

describe('some-module.addTwoNums(a, b)', () => {
  it('a = 1, b = 2, returns 3', () => {
    expect(some-module.addTwoNums(1, 2).toBe(3);
  });
});
```

Jest uses a common function pattern of `describe`-`it`-`expect`.
The `describe()` function sets up a collection of individual tests.
This is a good place to put entire modules or functions of a module.
It can even be nested, maybe one for an entire module and the
nested `describe` within it could be used for each funciton.
The `describe` function takes a string to describe the test collection and
a function that gets called to perform the various tests.

Then the `it()` function is used for an individual test.
Typically it's used to describe a single condition to test against.
In the above example `a = 1`, `b = 2` should result in the number `3`.
You can test many cases of this condition within `it`.
Each `it` should have one or more `expect` statements within it.

Each `expect` is a test case,
so proving additions of numbers result in the correct sum would be one
test condition represented by `it`.
There's several ways to test this condition,
infinate ways in fact in this case.
To test a couple of those you could have several `expect` statements.
Maybe one for `a = 1, b = 2`, one for `a = 1, b = -1`
and `a = -10, b = -5` modifying the above example like below:

```js
// ./__tests__/some-module.js
// inside describe()
it('returns correct sum', () => {
  expect(some-module.addTwoNums(1, 2)).toBe(3);
  expect(some-module.addTwoNums(1, -1)).toBe(0);
  expect(some-module.addTwoNums(-10, -5)).toBe(-15);
});
// ...
```

Now there's several test cases to test the same condition described in
the `it` function by using several `expect` functions.
You'll notice there's `toBe(someValue)` following `expect`.
This is known as a [matcher](./jest.md#Matchers).

## Matchers

After accepting the return of a function within an `expect` statement,
it's going to be necessary to evaluate the result to some specification.
This is where **matchers** come into play.
The `expect` return object comes with several **matcher** functions.
So far the `toBe()` matcher has been used and it handles scalar values.

For more details check out Jest's [matcher API][jest-docs-matchers].

## Recipes

These are specific use cases for Jest that has come up for me.

### Ensuring Jest only Uses UTC Timezone

When testing using `Date` objects or any time based API,
a lot of problems occur that depend on the current time zone of
the computer running the tests.
The computer doing the testing might not even be in the same timezone as
as the computers that run the code.
Not to mention problems associated w/ daylight savings times.
The best way to avoid all of this is to use one consistent timezone,
ideally *UTC*.

Here is how to setup jest to consistently execute tests as if
the computer is in the *UTC* or equivalent *GMT* timezone.
Most of these suggestions come from a
[stackoverflow answer][stackoverflow-jest-tz]
on setting jest timezone to UTC.

#### Ensure Jest Configuration has a globalSetup

Global setup is the only lifecycle configuration that happens early enough
in the jest testing procedure to ensure a timezone is set correctly.
Do this by editing the jest config to have a script run during the
`globalSetup` lifecycle step.
Substitute the path here with the file location preferred for the
global setup script.

```json
{
    "globalSetup": "./.jest/global-setup.js"
}
```

#### Set Timezone in globalSetup Script

Now within the globalSetup script,
defined here as a file in `./.jest/global-setup.js`,
and ensure the environment variable for timezone `tz` is set to `UTC`.

```js
// ./.jest/global-setup.js
module.exports = async () => {
  // ... other setup actions, preferably environment variables happen 1st
  process.env.tz = 'UTC';
  // ... other setup options, most should probably happen after env
};
```

#### (Optional) Add a Test that Ensures UTC Execution

It would be useful to ensure in any Date sensitive test file that
the node interpreter thinks the current timezone is UTC.
To do that,
in any test file or describe block where time testing is necessary,
use the below example `describe-it-expect` block to ensure UTC is in use.

```js
describe('Ensure TZ is set to UTC for this test suite', () => {
  it('timeZoneOffset is 0', () => {
    expect(new Date().getTimezoneOffset()).toBe(0);
  });
});
```

This creates a timestamp of the current time.
Then it checks the timezone offset from the host nodejs timezone.
If the timezone is `UTC` or `GMT` it should be *0*.

## References

### Note Links

* [Javascript Notes Overview][js-zk]

<!-- Hidden Reference Links Below Here -->
[js-zk]: ./javascript.md "Javascript Overview Notes"

### Referenced By

<!-- Hidden Reference Links Below Here -->

### Web Links

* [Jest Documentation: Using Matchers (from jestjs.io)][jest-docs-matchers]
* [Set Jest Timezone to UTC (from stackoverflow.com by Can)][stackoverflow-jest-tz]

<!-- Hidden Reference Links Below Here -->
[jest-docs-matchers]: https://jestjs.io/docs/using-matchers "Jest Documentation: Using Matchers (from jestjs.io)"
[stackoverflow-jest-tz]: https://stackoverflow.com/a/56482581 "Set Jest Timezone to UTC (from stackoverflow.com by Can)"
