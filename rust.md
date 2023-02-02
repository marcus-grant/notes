---
created: 2022-12-10T13:30:28.835Z
modified: 2023-02-02T13:42:56.956Z
tags: [rust,lang,software,dev,overview]
---
# Rust

## Learning Resources

* [Writing a NES Emulator in Rust (from bugzmanov.github.io/nes_ebook/)][nes-emu-rust]
  * Write a NES emulator using Rust!
  * Fantastic intermediate rust overview with a focus on systems programming
* [Considering Rust (from YouTube by Jon Gjengset)][consider-rust-yt]
  * Great talk by Jon Gjengset
  * Gets you the basic ideas of Rust's capabilities
* [rustlings: Small exercizes to get started reading & writing rust code (from GitHub by rust-lang)][rustlings-gh]
  * Great byte sized exercizes to learn rust
  * Do these once a week or something

## Collections

Hello World!

## Iteration

The `iter()` function generates an iterator trait to
iterate a collection of values by reference.
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

<!-- Hidden References -->

### Web References

* [Writing a NES Emulator in Rust (from bugzmanov.github.io/nes_ebook/)][nes-emu-rust]
* [Considering Rust (from YouTube by Jon Gjengset)][consider-rust-yt]
* [rustlings: Small exercizes to get started reading & writing rust code (from GitHub by rust-lang)][rustlings-gh]
* [Rust Documentation: Module std::collections][rust-docs-collections]

<!-- Hidden References -->
[rust-docs-collections]: https://doc.rust-lang.org/std/collections/ "Rust Documentation: Module std::collections"
[consider-rust-yt]: https://www.youtube.com/watch?v=DnT-LUQgc7s "Considering Rust (from YouTube by Jon Gjengset)"
[nes-emu-rust]: https://bugzmanov.github.io/nes_ebook/chapter_1.html "Writing a NES Emulator in Rust (from bugzmanov.github.io/nes_ebook/)"
[rustlings-gh]: https://github.com/rust-lang/rustlings "rustlings: Small exercizes to get started reading & writing rust code (from GitHub by rust-lang)"
