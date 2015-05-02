set nd to nextnode().

// hardcode parameters for now.
set turntime to 60.

// report node parameters.
print "Node in " + round(nd:eta) + ".".
print "DeltaV: " + round(nd:deltav:mag).

// determine initial burn parameters.
set max_acc to shiip:maxthrust/ship:mass.
set duration to nd:deltav:mag/max_acc.
print "Duration: " + round(duration) + "s.".

// execute attitude adjustments just before burn.
when nd:eta <= (duration / 2 + turntime) then {
  set np to lookdirup(nd:deltav, ship:facing:topvector).
  lock steering to np.
  print "Adjusting attitude...".

  // make sure we don't start burning before we are lined up.
  when abs(np:pitch - facing:pitch) < 0.15 and abs(np:yaw - facing:yaw) < 0.15 then {
    print "Attitude locked.".

    // start burn so that it is temporally centered on the node.
    when nd:eta < (duration / 2) then {
      print "Initiating burn.".
      // initialize burn state variables
      set tset to 0.
      lock throttle to tset.
      set done to False.

      // remember initial deltav
      set dv0 to nd:deltav.

      // burn loop
      until done {
        // recalculate accelleration
        set max_acc to ship:maxthrust/ship:mass.

        // throttle down at last second
        set tset to min(nd:deltav:mag / max_acc, 1).

        // stop when dot product of initial and current vector switches over?
        if vdot(dv0, nd:deltav) < 0 {
          print "Burn completed. Remaining dv: " + round(nd:deltav:mag, 1) + "m/s.".
          print " vdot: " + round(vdot(dv0, nd:deltav), 2).
        }


      }

    }
  }
}
