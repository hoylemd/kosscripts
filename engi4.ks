set target_altitude to 2000.
set target_speed to 170.
set chute_velocity to -75.
// prepare to launch
lock steering to up.
wait 2.

// launch
print "Launching!".
stage.

// Wait until engines cut off
wait until ship:maxthrust < 1.
print "MECO. Jettisoning ascent stage".
stage.

wait until (altitude > target_altitude and airspeed > target_speed).
print "Executing parachute test.".
stage.

wait until verticalspeed < chute_velocity.
Print "Deploying main chute".
stage.
