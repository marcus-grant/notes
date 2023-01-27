---
created: 2022-12-10T13:30:28.835Z
modified: 2022-12-10T13:30:28.835Z
tags: [rust,lang,software,dev,overview]
---
# Rust

## Collections


## Iteration

The `iter()` function generates an iterator trait to
iterate a collection of valuues by reference.
This includes arrays, vectors, slices, etc.
The function will return an iterator of type `T`,
where T is the reference type of the elements of the collection.

Iterators have a wide array, pun intended,
of functions to help performing actions on all or specific collection items.
There's the `next()`, `position()`, `Map`, `Filter`, but most importantly
it can function inside loop structures to define the loop.
<!-- TODO: Verify accuracy of last sentence above ^^^ --->

### Position

The `Iterator` trait comes with it the `position()` function that,
with the help of a predicate expression passed into it,
find the index of an item in a [collection](./rust.md#Collections).
Using the function signature,
`Iterator.position(predicate: P) -> Option<usize>`,
you simply pass a predicate expression into it and get the index or None in return.

```rust
names = ["Bob", "Steve", "Karen", "Lindsey"];
index = names.iter().position(|&n: String| n == "Karen").unrwap();
println!("{} has index of {}", names[index], index)
```

The above code snippet sets up a vector of name strings.
An `index` is set from calling `position` with predicate
`n == "Karen"` from lambda function of arg `|&n: String|`.
Then the `index` is found,
since it's found and `unwrap`ed it can access the name `Karen`.

## Optionals

## References

### Note References

* [Rust: Collections][self-collection]

<!-- Hidden References -->
[self-collect]: ./rust.md#Collections "Rust: Collections"

### Web References

* [Rust Documentation: Module std::collections][rust-docs-collections]

<!-- Hidden References -->
[rust-docs-collections]: https://doc.rust-lang.org/std/collections/ "Rust Documentation: Module std::collections"

