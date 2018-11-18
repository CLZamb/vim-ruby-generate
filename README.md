Ruby Generate.vim
===============

This plugin provides the ability to generate code in Vim using the provided mappings.
Sorting lines and argument lists manually can be a hassle, and thus
most write it off as a waste of effort, but when its as easy as anything else
in Vim, it becomes a viable option.

### Mapping

- `<leader>ga` - Generate att_accessor with the variables given
- `<leader>gg` - Generate getter with the variables given
- `<leader>gr` - Generate setter with the variables given
- `<leader>gv` - Generate private variables with the variables given
- `<leader>gw` - Generate writter with the variables given

In addition, if the text object is within a line then `sort-motion` will
attempt to sort the text as a comma separated list.

Examples:

`gsi(` => Sort within parenthesis. `(b, c, a)` would become `(a, b, c)`

### Visual

For continuity, `sort-motion` also defines a visual mode mapping for `gs`.
This behaves as a linewise sort over the lines defined by the visual selection.

You can also (optionally) specify a blockwise command to use for block
selections (example: `Vissort`).

Configuration
-------------

### sort_motion_flags

If you'd like to pass any options to `sort`
you can set `g:sort_motion_flags`. For example you could use:

```vim
let g:sort_motion_flags = "ui"
```

To make all sorts case insensitive and remove duplicates.

*Note*: this only applies to linewise sorting (including visual), but does
not apply to the character based sorting of comma separated lists.

### sort_motion_visual_block_command

If you'd like to specify a specific command to use for blockwise selections you
can set it here. This is useful if for example you want to use `Vissort` so that
you can sort by a column.

```vim
let g:sort_motion_visual_block_command = "Vissort"
```

By default the command used is `sort`.

NOTE: To use `Vissort` you will need to install this plugin.
