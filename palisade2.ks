lock steering to up.

set inclination to 90.
set pitch_over_start_speed to 5.
set pitch to 0.5.
set max_hvel to 1.
set return_hvel to 0.1.
set chute_altitude to 1000.

// prepare to launch
lock steering to up.
wait 2.

// launch
print "Launching!".
stage.

// pitch-over
wait until ship:airspeed > pitch_over_start_speed.
print "GS: " + groundspeed + "m/s".
print "AS: " + airspeed + "m/s".
set target_pitch to 90 + pitch.
print "Exec POM of " + target_pitch + "deg to " + max_hvel + "m/s GS.".
lock steering to heading(inclination, target_pitch).

wait until groundspeed > max_hvel.
set target_pitch to 90 + pitch.
print "Cancel POM with " + target_pitch + "deg to " + return_hvel + "m/s GS.".
lock steering to heading(inclination, target_pitch).

wait until groundspeed < return_hvel.
print "Normalizing pitch".
lock steering to up.

wait until verticalspeed < 0.
print "GS: " + groundspeed + "m/s".

wait until altitude < chute_altitude.
print "Dep chutes at " + chute_altitude + "m".
unlock steering.
stage.
