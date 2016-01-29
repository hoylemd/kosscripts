declare parameter alt.
set lambda to 500.

set cnode to node(time:seconds + eta:apoapsis, 0,0,0).
add cnode.

set adjustment to 100.

// switch between raising and lowering periapsis
if alt < ship:periapsis {
  set adjustment to adjustment * -1.
}

set delta to abs(alt - cnode:orbit:periapsis).
print "Adjusting periapsis node..." + adjustment.
until delta < lambda {
    set cnode:prograde to cnode:prograde + adjustment.

    //check if we overshot
    if cnode:orbit:periapsis - alt < lambda and abs(cnode:orbit:apoapsis - alt) > lambda {
        print "overshot by " + (cnode:orbit:periapsis - alt).
        set cnode:prograde to cnode:prograde - adjustment.
        // make the adjustments more fine.
        set adjustment to adjustment / 2.
    }

    set delta to abs(alt - cnode:orbit:periapsis).
}


