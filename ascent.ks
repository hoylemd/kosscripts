declare parameter alt, inclination, long_ascending.

copy stageliquid from 0.
copy gravityturn from 0.
copy lockup from 0.
copy executeNode from 0.
copy circularize from 0.

print "acending to " + alt + "m.".

run lockup.
run stageliquid.

run gravityturn(inclination).

// keep thrusting until 70km
WAIT UNTIL SHIP:APOAPSIS - alt > 0.

LOCK throttle to 0.

run circularize.
