set alt to ship:apoapsis.
set lambda to 5.

set cnode to node(time:seconds + eta:apoapsis, 0,0,0).
add cnode.

set adjustment to 100.
set initial_delta to alt - cnode:orbit:periapsis.
until abs(initial_delta) < lambda {
    set delta to alt - cnode:orbit:periapsis.

    // don't need to check for negative case
    set cnode:prograde to cnode:prograde + adjustment.

    //check if we overshot
    if cnode:orbit:apoapsis > alt {
        set cnode:prograde to cnode:prograde - adjustment.
        adjustment = adjustment / 2.
    }
}
