# Mapping

Key mapping refers to creating a shortcut for repeating a sequence of keys or commands.
You can map keys to execute frequently used key sequences or to invoke an Ex command or to invoke a Vim function or to invoke external commands.
Using key maps you can define your own Vim commands.

Vim supports several editing modes - `normal`, `insert`, `replace`, `visual`, `select`, `command-line` and `operator-pending`.
You can map a key to work in all or some of these modes.

The general syntax of a map command is:

{cmd} {attr} {lhs} {rhs}

where
{cmd} is one of `:map`, `:map!`, `:nmap`, `:vmap`, `:imap`,
`:cmap`, `:smap`, `:xmap`, `:omap`, `:lmap`, etc.

{attr} is optional and one or more of the following: `<buffer>`, `<silent>`,
`<expr>` `<script>`, `<unique>` and `<special>`.
More than one attribute can be specified to a map.

{lhs} left hand side, is a sequence of one or more keys that you will use
in your new shortcut.

{rhs} right hand side, is the sequence of keys that the {lhs} shortcut keys
will execute when entered.

## Listing key maps

You can display a list of existing key maps using the following commands without any arguments:

:map - Display the maps that work in normal, visual and select and operator pending mode.
:map! - Display the maps that work in insert and command-line mode.

To display the mode specific maps, prefix the ':map' command with the letter representing the mode.

:nmap - Display normal mode maps
:imap - Display insert mode maps
:vmap - Display visual and select mode maps
:smap - Display select mode maps
:xmap - Display visual mode maps
:cmap - Display command-line mode maps
:omap - Display operator pending mode maps
