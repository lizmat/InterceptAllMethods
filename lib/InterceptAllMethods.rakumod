use v6.d;

# https://stackoverflow.com/questions/51031264/how-to-create-a-class-that-doesnt-inherit-from-any-other-class
class InterceptAllMethods is Metamodel::ClassHOW {
    method publish_method_cache(|) { }
}
package EXPORTHOW {
    constant class = InterceptAllMethods;
}

=begin pod

=head1 NAME

InterceptAllMethods - export ClassHOW to intercept all method calls

=head1 SYNOPSIS

    use InterceptAllMethods;
 
    class FooBar {
        method ^find_method(Mu $obj, Str $name) {
            return -> | { say "calling $name" }
        }
    }

=head1 DESCRIPTION

Change the ClassHOW of the compilation unit so that you can create a class
that has a C<^find_method> that will be called for B<any> method call to that
class.  This method should then return a C<Callable> that will called as if
it were the method.

This allows one to implement one's own caching methods, or not have any caching
method at all.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/InterceptAllMethods .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2021, 2023 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
