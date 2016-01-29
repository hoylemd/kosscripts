// DEPENDANCIES: loadStandardManeuvers
// COMPLETION VARIABLE: ascentComplete
declare parameter inclination.

set alt to 100000.

// prepare to launch
set stages to stage:number.
set ascentComplete to False.
run lockup.

// set up staging
run staging.
stage.

// roll program
print "executing roll program".
when ship:altitude > 500 then {
  lock steering to heading(inclination, 85).
}

run gravityturn(inclination).

// MECO
wait until ship: apoapsis - alt > 0.
print "MECO".
LOCK throttle to 0.
set circularizeComplete to False.
rcs on.

// drop second stage if not done already
if stage:number > stages - 1 {
  print "Dropping ascent stage".
  stage.
}

// warp to edge of atmosphere
print "warping".
set warp to 2.

// make sure we didn't lose too much altitude after MECO
when ship:altitude > 68000 then {
  set warp to 0.
  if ship:apoapsis < alt {
    print "fixing apoapsis".
    lock throttle to 0.1.
  }

  when ship:apoapsis >= alt then {
    lock throttle to 0.
    set circularizeComplete to true.
  }
}

wait until circularizeComplete.
set ascentComplete to true.
