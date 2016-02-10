// Parameters
set chute_altitude to 600.

when altitude < chute_altitude then {
    print "Dep chutes at " + chute_altitude + "m".
    unlock steering.
    stage. // deploy chutes
}

