set nd to nextnode().

print "Node in " + round(nd:eta) + ".".
print "DeltaV: " + round(nd:deltav:mag).

set max_acc to shi:maxthrust/ship:mass.
set duration to nd:deltav:mag/max_acc.
print "Duration: " + round(duration) + "s.".

wait until node:eta <= (duration/2 + 60).
set np to lookdirup(nd:deltav, ship:facing:topvector).
lock steering to np.

wait until abs(np:pitch - facing:pitch) < 0.15 and abs(np:yaw - facing:yaw) < 0.15.

wait until nd:eta < (burn_duration / 2)
