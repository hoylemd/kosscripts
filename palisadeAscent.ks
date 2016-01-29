// DEPENDANCIES: lockup, staging
// COMPLETION VARIABLE: ascentComplete

declare parameter inclination.

set alt to 100000.

// prepare to launch
LOCK STEERING TO UP.
WAIT 2.

print "Launching!"
stage.

// roll program
print "executing roll program".
when ship:airspeed > 10 then {
  lock steering to heading(inclination, 90).
}

set pitch_over_start_speed to 20
set pitch_over_end_speed to 50

// pitch-over
print "executing pitch-over"
when ship:airspeed > pitch_over_start_speed then {
  lock steering to heading(inclination, 80)
}

// release controls
print "releasing controls"
when ship:airspeed > pitch_over_end_speed then {
  unlock steering
}
