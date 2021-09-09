NAME
====

InterceptAllMethods - export ClassHOW to intercept all method calls

SYNOPSIS
========

    use InterceptAllMethods;
     
    class FooBar {
        method ^find_method(Mu $obj, Str $name) {
            return -> | { say "calling $name" }
        }
    }

DESCRIPTION
===========

Change the ClassHOW of the compilation unit so that you can create a class that has a `^find_method` that will be called for **any** method call to that class. This method should then return a `Callable` that will called as if it were the method.

This allows one to implement one's own caching methods, or not have any caching method at all.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/InterceptAllMethods . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2021 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

