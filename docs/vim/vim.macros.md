# vim macros

Recording a macro is a great way to perform a one-time task, or to get things done quickly when you don't want to mess with Vim script or mappings, or if you do not yet know how to do it more elegantly.

In Vim, the word "macro" may refer to:

- A sequence of commands recorded to a register (this tip).
- A mapping to expand a sequence of typed keys to a longer sequence (see tutorial).
- A script written in the Vim script language (stored in a file with extension .vim – see :help script).

## Recording a macroEdit

Each register is identified by a letter a to z.

To enter a macro, type:

```vim
q<letter><commands>q
```

To execute the macro `<number>` times (once by default), type:

```vim
<number>@<letter>
```

So, the complete process looks like:

`qd` start recording to register d
`...` your complex series of commands
`q` stop recording
`@d` execute your macro
`@@` execute your macro again
