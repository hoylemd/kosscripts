declare parameter alt.
set lambda to 500.

set cnode to node(time:seconds + eta:apoapsis, 0,0,0).
add cnode.

set adjustment to 100.
set delta to alt - cnode:orbit:periapsis.
print "Adjusting periapsis node...".
until delta < lambda {

    // don't need to check for negative case
    set cnode:prograde to cnode:prograde + adjustment.

    //check if we overshot
    if abs(cnode:orbit:periapsis - alt) < lambda and abs(cnode:orbit:apoapsis - alt > lambda) {
        print "overshot by " + (cnode:orbit:apoapsis - alt).
        set cnode:prograde to cnode:prograde - adjustment.
        // make the adjustments more fine.
        set adjustment to adjustment / 2.
    }

    set delta to alt - cnode:orbit:periapsis.
}


