# Vim as Language

Arguably the most brilliant thing about vim is that as you use it you begin to think in it. vim is set up to function like a language, complete with nouns, verbs, and adverbs.

Keep in mind that the terms I'm going to use here are not technically correct, but should help you understand better how vim works. Again, this guide is not meant to replace a full book or the help—it's mean to help you get what doesn't come easily from those types of resources.

## Operators (verbs)

Verbs are the actions we take, and they can be performed on nouns.
[more](vim-languag-operators.md)

## Modifiers

Modifiers are used before nouns to describe the way in which you're going to do something.
[more](vim-languag-modifiers.md)

## Objects (nouns)

In English, nouns are objects you do something to.
They are objects. With vim it's the same.
[more](vim-languag-objects.md)

## Nouns as motion

You can also use nouns as motions, meaning you can move around your content using them as the size of your jump.
[more](vim-languag-motions.md)

## Building sentences (commands) using this language

Ok, so we have the various pieces, so how would you build a sentence using them?
Well, just like English, you combine the verbs, modifiers, and nouns in (soon to be) intuitive ways.

Here's what it looks like:

### Delete two words

d2w

### Change inside sentence (delete the current one and enter insert mode)

cis

### Yank inside paragraph (copy the paragraph you're in)

yip

### Change to open bracket (change the text from where you are to the next open bracket)

ct<

Remember, the "to" here was an open bracket, but it could have been anything.
And the syntax for "to" was simply t, so I could have said dt. or yt; for "delete to the next period", or "copy to the next semicolon".

Isn't that beautiful? Using this thought process turns your text editing into an intuitive elegance, and like any other language the more you use it the more naturally it will come to you.
