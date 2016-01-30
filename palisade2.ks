lock steering to up.

set inclination to 90.
set pitch_over_start_speed to 20.
set pitch to 2.
set max_hvel to 10.
set return_hvel to 2.
set chute_altitude to 500.

// prepare to launch
lock steering to up.
wait 2.

// launch
print "Launching!".
stage.

// pitch-over
wait until ship:airspeed > pitch_over_start_speed.
print "Groundspeed is " + groundspeed + "m/s".
print "Airspeed is " + airspeed + "m/s".
set target_pitch to 90 + pitch.
print "Executing pitch-over of " + target_pitch + "degrees to " + max_hvel + "m/s groundspeed.".
lock steering to heading(inclination, 90).

when groundspeed > max_hvel then {
  set target_pitch to 90 + pitch.
  print "Cancelling pitch-over with " + target_pitch + "degrees to " + return_hvel + "m/s groundspeed.".
  lock steering to heading(inclination, target_pitch).
}

when groundspeed < return_hvel then {
  print "Normalizing pitch".
  lock steering to up.
}

print "Wait until apogee...".
wait until verticalspeed < 0.
print "Groundspeed is " + groundspeed + "m/s".

wait until altitude < chute_altitude.
print "Deploying chutes at " + chute_altitude + "m".
stage.
