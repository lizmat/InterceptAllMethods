use v6.c;
use Test;

# Alas, we need to do some NQP here to be able to check the type of the
# created object without actually calling any methods on the object.
use nqp;
use InterceptAllMethods;

plan 4;

my @seen;
class Foo {
    method ^find_method(Mu \obj, Str $name) {
        my constant &the-method = proto method handler(|) {*};
        multi method handler(Foo:U: |c) {
            @seen.push("type", $name);
            use nqp;
            $name eq 'new' ?? nqp::create(obj) !! $name
        }
        multi method handler(Foo:D: |c) {
            @seen.push("instance",$name);
            $name
        }

        &the-method
    }
}

my $foo := Foo.new;
ok nqp::eqaddr($foo.WHAT, Foo), 'did we get a Foo';
is Foo.foo,  "foo", 'did Foo return foo';
is $foo.bar, "bar", 'did $foo return bar';

is @seen, "type new type foo instance bar", 'did we see all the calls';

# vim: ft=perl6 expandtab sw=4
