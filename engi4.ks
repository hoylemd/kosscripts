set target_altitude to 2000.
set max_altitude to 9000.
set target_speed to 170.
set max_speed to 280.
set chute_altitude to 700.
// prepare to launch
lock steering to heading (90, 80).
wait 2.

// launch
print "Launching!".
stage.

print "Waiting for parachute conditions.".
wait until (altitude > target_altitude and
  altitude < max_altitude and
  airspeed > target_speed and
  airspeed < max_speed).
print "Executing parachute test.".
stage.

print "Waiting for apex.".
wait until verticalspeed > 10.
wait until verticalspeed < 0.
unlock steering.
stage.

print "Waiting for chute altitude".
wait until altitude < chute_altitude.
print "Deploying main chute".
stage.
