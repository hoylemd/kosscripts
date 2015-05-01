declare parameter alt, arg_peri.

copy stageliquid from 0.
copy gravityturn from 0.
copy lockup from 0.

print "acending to " + alt + "m.".

run lockup.
run stageliquid.

run gravityturn(0).

// keep thrusting until 70km
WAIT UNTIL SHIP:APOAPSIS > alt.

LOCK throttle to 0.

wait until eta:apoapsis < 30.
lock throttle to 1.
wait until ship:periapsis > alt.

