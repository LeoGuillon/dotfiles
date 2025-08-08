# Espanso

text expander written in Rust : [espanso](https://espanso.org/)

## Command rules

general personal rules for writting expanders :

- `:` is the default keycharacter, mostly for commands and symbols ; symbols are ended also by a second `:` ;
- `,` stands for short expressions ; currently used mainly for quick chat messages ;
- no symbols for spellcheck, as it’s meant to auto-correct live during typing.

## App-specific config

- in the terminal, try to enable only commands starting with `:`, as spellcheck expanders can conflict with vim commands ;
- in messaging apps (e.g. Beeper, Discord and MatterMost), disable emojis as these are already provided natively.
