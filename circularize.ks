set alt to ship:apoapsis.
set lambda to 500.

set cnode to node(time:seconds + eta:apoapsis, 0,0,0).
add cnode.

set adjustment to 100.
set delta to alt - cnode:orbit:periapsis.
print "Adjusting circularization node...".
until delta < lambda {

    // don't need to check for negative case
    set cnode:prograde to cnode:prograde + adjustment.

    //check if we overshot
    if cnode:orbit:apoapsis - alt > lambda {
        print cnode:orbit:apoapsis - alt.
        set cnode:prograde to cnode:prograde - adjustment.
        // make the adjustments more fine.
        set adjustment to adjustment / 2.
    }

    set delta to alt - cnode:orbit:periapsis.
}

run executeNode.
