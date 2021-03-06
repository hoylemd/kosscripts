set nd to nextnode.

// hardcode parameters for now.
set turntime to 60.

// report node parameters.
print "Node in " + round(nd:eta) + ".".
print "DeltaV: " + round(nd:deltav:mag).

//calculate ship's max acceleration
set max_acc to ship:maxthrust/ship:mass.
set duration to nd:deltav:mag/max_acc.
print "Duration: " + round(duration) + "s.".

// attitude adjustments
wait until nd:eta <= (duration/2 + turntime).
set np to lookdirup(nd:deltav, ship:facing:topvector). //points to node, keeping roll the same.
lock steering to np.
print "Adjusting attitude...".

//now we need to wait until the burn vector and ship's facing are aligned
wait until abs(np:pitch - facing:pitch) < 0.15 and abs(np:yaw - facing:yaw) < 0.15.
print "Attitude locked.".

//the ship is facing the right direction, let's wait for our burn time
wait until nd:eta < (duration / 2).
print "Initiating burn.".

//we only need to lock throttle once to a certain variable in the beginning of the loop, and adjust only the variable itself inside it
set tset to 0.
lock throttle to tset.
set done to False.

//initial deltav
set dv0 to nd:deltav.

until done {
    //recalculate current max_acceleration, as it changes while we burn through fuel
    set max_acc to ship:maxthrust/ship:mass.

    //throttle is 100% until there is less than 1 second of time left to burn
    //when there is less than 1 second - decrease the throttle linearly
    set tset to min(nd:deltav:mag/max_acc, 1).

    //here's the tricky part, we need to cut the throttle as soon as our nd:deltav and initial deltav
    // start facing opposite directions
    //this check is done via checking the dot product of those 2 vectors
    if vdot(dv0, nd:deltav) < 0 {
        print "End burn, remain dv " + round(nd:deltav:mag,1) + "m/s, vdot: " + round(vdot(dv0, nd:deltav),1).

        lock throttle to 0.
        break.
    }

    //we have very little left to burn, less then 0.1m/s
    if nd:deltav:mag < 0.1 {
        print "Finalizing burn, remain dv " + round(nd:deltav:mag,1) + "m/s.".
        print "vdot: " + round(vdot(dv0, nd:deltav),1).

        wait until vdot(dv0, nd:deltav) < 0.5.

        lock throttle to 0.
        print "End burn, remain dv " + round(nd:deltav:mag,1) + "m/s, vdot: " + round(vdot(dv0, nd:deltav),1).
        set done to True.
    }
}
unlock steering.
unlock throttle.
wait 1.

//we no longer need the maneuver node
remove nd.

//set throttle to 0 just in case.
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
