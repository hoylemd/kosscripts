// COMPLETION VARIABLE: ascentComplete
declare parameter inclination.

set pitch_over_start_speed to 20.
set pitch_over_end_speed to 100.

set ascentComplete to false.

// prepare to launch
lock steering to up.
wait 2.

// launch
print "Launching!".
stage.

// pitch-over
print "Executing pitch-over".
when ship:airspeed > pitch_over_start_speed then {
  lock steering to heading(inclination, 85).
}

// release controls
print "Releasing controls".
when ship:airspeed > pitch_over_end_speed then {
  unlock steering.
  set ascentComplete to true.
}

wait until ascentComplete.
