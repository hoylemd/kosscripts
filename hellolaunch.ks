// count down from 10
SET countdown TO 5.
PRINT "Counting Down:".
UNTIL countdown = 0 {
    PRINT "..." + countdown.
    SET countdown TO countdown - 1.
    WAIT 1.
}

// throttle up
PRINT "Main throttle up.".
LOCK THROTTLE TO 1.0.

// set direction
PRINT "Locking attitude controls.".
LOCK STEERING TO UP.

PRINT "2 seconds to stabilize.".
WAIT 2.

// stage when neccessary
WHEN STAGE:LIQUIDFUEL < 0.001 THEN {
    PRINT "No liquidfuel. Attempting to stage.".
    STAGE.
    PRESERVE.
}

// gravity turns
WHEN SHIP:ALTITUDE > 500 THEN {
    PRINT "Starting gravity turn, 90 x 85.".
    LOCK STEERING TO HEADING(90,85).
}

WHEN SHIP:ALTITUDE > 1500 THEN {
    PRINT "Starting gravity turn, 90 x 70.".
    LOCK STEERING TO HEADING(90,75).
}

WHEN SHIP:ALTITUDE > 5000 THEN {
    PRINT "Starting gravity turn, 90 x 55.".
    LOCK STEERING TO HEADING(90,65).
}

WHEN SHIP:ALTITUDE > 10000 THEN {
    PRINT "Starting gravity turn, 90 x 45.".
    LOCK STEERING TO HEADING(90,45).
}

WHEN SHIP:ALTITUDE > 15000 THEN {
    PRINT "Starting gravity turn, 90 x 20.".
    LOCK STEERING TO HEADING(90,20).
}

WHEN SHIP:ALTITUDE > 20000 THEN {
    PRINT "Starting gravity turn, 90 x 0.".
    LOCK STEERING TO HEADING(90,0).
}

// keep thrusting until 70km
WAIT UNTIL SHIP:ALTITUDE > 70000.
