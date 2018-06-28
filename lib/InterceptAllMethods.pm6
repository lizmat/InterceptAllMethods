use v6.c;

# https://stackoverflow.com/questions/51031264/how-to-create-a-class-that-doesnt-inherit-from-any-other-class
class InterceptAllMethodsHOW:ver<0.0.1>:auth<cpan:ELIZABETH> is Metamodel::ClassHOW {
    method publish_method_cache(|) { }
}
package EXPORTHOW {
    constant class = InterceptAllMethodsHOW;
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

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/InterceptAllMethods .
Comments and Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: ft=perl6 expandtab sw=4
