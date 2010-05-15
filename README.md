Trith
=====

Trith is an experimental [concatenative][concat.org] programming language
founded on the [unholy][lispers.org] trinity of [Forth][], [Lisp][] and
[RDF][] triples.

* <http://trith.org/>
* <http://github.com/trith/trith>

Description
-----------

Trith is a stack-based, concatenative, dynamically-typed functional
programming language with a simple and concise homoiconic syntax:

* [Stack-based][stack-oriented] means that instead of having named
  parameters, Trith functions operate on an implicit data structure called
  the _operand stack_. Trith functions can be thought of in terms of popping
  and pushing operands from and onto this stack, or equivalently in purely
  functional terms as unary functions that map from one stack to another.
* [Concatenative][concatenative] means that the concatenation of any two
  Trith functions also denotes the [composition][] of those functions.
* [Dynamically-typed][type system] means that operands to Trith functions
  are type-checked dynamically at runtime.
* [Homoiconic][homoiconic] means that in Trith there is no difference
  between code and data. You can manipulate and construct code at runtime as
  easily as you would manipulate any other data structure, enabling powerful
  metaprogramming facilities. Trith programs are simply nested lists
  of operators, operands and quotations, and can be represented externally
  either as [S-expressions][S-expression] or as [RDF][] data.

Trith is inspired and influenced by [Forth][], [Lisp][] and [Scheme][] in
general, and the concatenative languages [Joy][], [XY][], [Factor][] and
[Cat][] in particular.

Status
------

The Trith implementation currently consists of a virtual machine,
interpreter, and compiler toolchain written in Ruby and an in-the-works
runtime targeting the [JVM][].

At this stage, Trith is as yet little more than a glorified interactive
calculator. Nonetheless, it can already answer the ultimate question of
life, the universe, and everything:

    $ 3sh 
    >> 6 7 * 
    => [42] : [] 

In the above Trith shell (`3sh`) output, `>>` indicates lines that you type,
and `=>` indicates the result from the shell. After each input line is
evaluated, the shell will show you the current state of the Trith virtual
machine's data stack and code queue.

Thus in our above example, the `[42]` on the left-hand side shows that the
machine stack contains a single operand, the number 42. The `[]` on the
right-hand side shows that the code queue is empty, which is generally the
case after all input has been successfully evaluated.

Let's run through the above example one step at a time by using the
`--debug` option to `3sh`, enabling the tracing of each execution step in
the virtual machine:

    $ 3sh --debug
    >> 6 7 *
    .. [] : [6 7 *]
    .. [6] : [7 *]
    .. [6 7] : [*]
    => [42] : []

As you can see, when input operands such as numbers are encountered, they
are added to the data stack, which grows from left to right. When an
operator such as the multiplication operator `*` is encountered and
executed, it will pop operands from the stack and then push its result(s)
onto the stack.

When fooling around in the Trith shell, two useful operators to know are
`reset`, which clears the data stack, and `halt`, which clears the code
queue (thus halting execution).

To get a listing of all operators supported in the current release, enter
the `?` metacommand in the Trith shell.

Dependencies
------------

* [Ruby](http://ruby-lang.org/) (>= 1.9.1) or
  [JRuby](http://jruby.org/) (>= 1.4.0)
* [RDF.rb](http://rubygems.org/gems/rdf) (>= 0.1.9)
* [SXP](http://rubygems.org/gems/sxp) (>= 0.0.2)

Installation
------------

The recommended installation method is via [RubyGems](http://rubygems.org/).
To install the latest official release of the `trith` gem, do one of the
following:

    $ [sudo] gem install trith                  # Ruby 1.9+
    $ [sudo] gem1.9 install trith               # Ruby 1.9 with MacPorts
    $ [sudo] jruby --1.9 -S gem install trith   # JRuby 1.4+

Once Trith is installed, you will have four new programs available:

* `3sh`, aka "trish", is the Trith interactive shell and interpreter.
* `3vm`, aka "trivium", is the Trith virtual machine runtime.
* `3cc`, aka "tricksy", is the Trith compiler.
* `3th`, aka "trith", is the Trith package manager.

Note that as of the current release, only the first two do anything much as
yet.

Download
--------

To get a local working copy of the development repository, do:

    $ git clone git://github.com/trith/trith.git

Alternatively, you can download the latest development version as a tarball
as follows:

    $ wget http://github.com/trith/trith/tarball/master

Authors
-------

* [Arto Bendiken](mailto:arto.bendiken@gmail.com) - <http://ar.to/>

License
-------

Trith is free and unencumbered public domain software. For more
information, see <http://unlicense.org/> or the accompanying UNLICENSE file.

[stack-oriented]: http://en.wikipedia.org/wiki/Stack-oriented_programming_language
[concatenative]:  http://en.wikipedia.org/wiki/Concatenative_programming_language
[composition]:    http://en.wikipedia.org/wiki/Function_composition
[type system]:    http://en.wikipedia.org/wiki/Type_system#Dynamic_typing
[homoiconic]:     http://en.wikipedia.org/wiki/Homoiconicity
[S-expression]:   http://en.wikipedia.org/wiki/S-expression
[RDF]:            http://en.wikipedia.org/wiki/Resource_Description_Framework
[JVM]:            http://en.wikipedia.org/wiki/Java_Virtual_Machine
[Lisp]:           http://en.wikipedia.org/wiki/Lisp_(programming_language)
[Scheme]:         http://en.wikipedia.org/wiki/Scheme_(programming_language)
[Forth]:          http://en.wikipedia.org/wiki/Forth_(programming_language)
[Factor]:         http://en.wikipedia.org/wiki/Factor_(programming_language)
[Joy]:            http://en.wikipedia.org/wiki/Joy_(programming_language)
[Cat]:            http://en.wikipedia.org/wiki/Cat_(programming_language)
[XY]:             http://www.nsl.com/k/xy/xy.htm
[lispers.org]:    http://lispers.org/
[concat.org]:     http://concatenative.org/wiki/view/Concatenative%20language
