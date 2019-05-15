:construction: __NOTE:__ vimrg is a work-in-progress and in active development! :construction:

Ruby Generate.vim
===============

This plugin provides the ability to generate code in ruby using the provided mappings.

### Mapping

- `<leader>ga` - Generate attr_accessor with the variables given
- `<leader>gg` - Generate getter with the variables given
- `<leader>gr` - Generate setter with the variables given
- `<leader>gw` - Generate writter with the variables given
- `<leader>gv` - Generate private variables with the variables given
- `<leader>gb` - Generate public variables with the variables given
- `<leader>gt` - Generate protected variables with the variables given

Examples:


### Visual
coming soon

Configuration
-------------
chossing the position inside of class
default layout
```vim
    let g:ruby_generatePositions = {
          \ 'getter':        'bottom',
          \ 'setter':        'bottom',
          \ 'writer':        'top',
          \ 'reader':        'top',
          \ 'accessor':      'top',
          \ 'publicVars':    'bottom',
          \ 'privateVars':   'bottom',
          \ 'protectedVars': 'bottom',
          \ }
 ```
