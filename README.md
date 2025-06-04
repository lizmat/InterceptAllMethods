[![Actions Status](https://github.com/lizmat/InterceptAllMethods/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/InterceptAllMethods/actions) [![Actions Status](https://github.com/lizmat/InterceptAllMethods/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/InterceptAllMethods/actions) [![Actions Status](https://github.com/lizmat/InterceptAllMethods/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/InterceptAllMethods/actions)

NAME
====

InterceptAllMethods - export ClassHOW to intercept all method calls

SYNOPSIS
========

```raku
use InterceptAllMethods;

class FooBar {
    method ^find_method(Mu $obj, Str $name) {
        return -> | { say "calling $name" }
    }
}
```

DESCRIPTION
===========

Change the ClassHOW of the compilation unit so that you can create a class that has a `^find_method` that will be called for **any** method call to that class. This method should then return a `Callable` that will called as if it were the method.

This allows one to implement one's own caching methods, or not have any caching method at all.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/InterceptAllMethods . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2021, 2023, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

