declare parameter alt.
set lambda to 500.

set cnode to node(time:seconds + eta:periapsis, 0,0,0).
add cnode.

set adjustment to 100.

// switch between raising and lowering apoapsis
if alt < ship:apoapsis {
  set adjustment to adjustment * -1.
}

set delta to abs(alt - cnode:orbit:apoapsis).
print "Adjusting apoapsis node...".
until delta < lambda {
    set cnode:prograde to cnode:prograde + adjustment.

    //check if we overshot
    if cnode:orbit:apoapsis - alt > lambda and abs(cnode:orbit:periapsis - alt) > lambda {
        print "overshot by " + (cnode:orbit:apoapsis - alt).
        set cnode:prograde to cnode:prograde - adjustment.
        // make the adjustments more fine.
        set adjustment to adjustment / 2.
    }

    set delta to abs(alt - cnode:orbit:apoapsis).
    wait 0.25.
}


