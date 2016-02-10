// Parameters
set target_alt to 75000.
set POM_start_alt to 7500.
set POM_release_alt to 10000.
set POM_release_alt to 20000.
set begin_circ_alt to 71000.
set pitch to 15.

// prepare to launch
lock steering to up.
lock throttle to 0.66.
stage.

// POM
when altitude > POM_start_alt then {
    set target_pitch to 90 - pitch.
    print "Exec POM of " + target_pitch + "deg.".
    lock steering to heading(90, target_pitch).
    lock throttle to 0.6.

    when altitude > POM_release_alt then {
      print "POM complete.".
      unlock steering.
      lock throttle to 0.5.
    }
}

// Go parallel
when altitude > 70000 then {
  lock steering to heading (90, 0).
}

// Drop lower stage
set now_thrust to maxthrust.
when maxthrust < now_thrust then {
  print "Jettisoning first stage.".
  lock throttle to 0.
  stage.
}

// Cicularization burn.
wait until altitude > begin_circ_alt.
lock throttle to 1.

wait until periapsis > target_alt.
lock throttle to 0.
