---
created: 2022-12-02T155:45:00
tags: [neovim,vim,editors,utils,dev,productivity]
---
# NeoVim

NeoVim is a minimalistic [source-code editor][code-editor-wiki] as opposed to
a fully fledged [IDE][ide-wiki] that runs on a UNIX [shell](os-shell.md).
It is a fork of [vim][vim-home] editor of
contributors that were tired of the main maintainer's
slow rate of development, overly legacy API, release cycle, and documentation.
On top of fixing these problems, it also focuses on:

* Extensibility
  * API is first class
    * [Documented][nvim-docs-api]
    * Discoverable
    * Versioned
  * [MessagePack][msgpack-home] structured communication
    * Enables extensions in any language
  * Remote plugins run as co-processes, safely & asynchronously
  * [Lua Plugins][nvim-docs-lua] are easy to create
    * Unlike Vim's vimscript...
      * A common language with a wide knowledge base
      * Embaddable with the C/C++ of the project
      * Easy to create plugins
    * Config quite simply just lives in `init.lua`
      * The expected places Neovim looks for configuration
      * Typically located in `~/.config/nvim`
  * AST-Producing [parsing engine][treesitter-home]
    * Improves native...
      * Faster syntax highlighting
      * Code navigation
      * Refactoring
      * Text objects
      * Motions
* Usability
  * Builtin [LSP Client][nvim-docs-lsp]
    * Semantic code inspection
    * Refactoring
      * Go-to definition
      * Find references
      * Format
      * ETC.
  * Strong [defaults][nvim-docs-defaults]
  * Modern terminal features
    * Cursor styling
    * Focus Events
    * Bracketed paste
  * Builtin [terminal emulator][nvim-yt-term-demo]
* Drop-in Compatibility with Vim
  * Fully compatible with Vim's editing model & Vimscript v1
  * Start with `:help nvim-from-vim` if you already use vim to get started

## References

* [Neovim Homepage: Hyperextensible Vim-based text editor][nvim-home]
* [Integrated Development Environment (from Wikipedia, the free encyclopedia)][ide-wiki]
* [Source-code editor (from Wikipedia, the free encyclopedia)][code-editor-wiki]
* [Vim - The ubiquotous text editor (Homepage)][vim-home]
* [Neovim Docs: API][nvim-docs-api]
* [MsgPack Homepage][msgpack-home]
* [NeoVim Documentation: LUA][nvim-docs-lua]
* [Tree-Sitter Homepage][treesitter-home]
* [NeoVim Docs: LSP Client][nvim-docs-lsp]
* [NeoVim Documentation: Better Defaults][nvim-docs-defaults]
* [Neovim builtin terminal emulator demonstration on Youtube][nvim-yt-term-demo]

<!-- Hidden Reference Links Below Here -->
[nvim-home]: https://neovim.io "Neovim Homepage: Hyperextensible Vim-based text editor"
[ide-wiki]: https://en.wikipedia.org/wiki/Integrated_development_environment "Integrated Development Environment (from Wikipedia, the free encyclopedia)"
[code-editor-wiki]: https://en.wikipedia.org/wiki/Source-code_editor "Source-code editor (from Wikipedia, the free encyclopedia)"
[vim-home]: https://www.vim.org "Vim - The ubiquotous text editor (Homepage)"
[nvim-docs-api]: https://neovim.io/doc/user/api.html#api-mapping "Neovim Docs: API"
[msgpack-home]: http://msgpack.org/ "MsgPack Homepage"
[nvim-docs-lua]: https://neovim.io/doc/user/lua.html "NeoVim Documentation: LUA"
[treesitter-home]: https://tree-sitter.github.io/ "Tree-Sitter Homepage"
[nvim-docs-lsp]: https://neovim.io/doc/user/lsp.html "NeoVim Docs: LSP Client"
[nvim-docs-defaults]: https://neovim.io/doc/user/vim_diff.html#nvim-defaults "NeoVim Documentation: Better Defaults"
[nvim-yt-term-demo]: https://www.youtube.com/watch?v=xZbMVj9XSUo "Neovim builtin terminal emulator demonstration on Youtube"
