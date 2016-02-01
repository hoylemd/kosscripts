// Parameters
set pitch_over_start_speed to 5.
set pitch to 7.
set max_hvel to 15.
set chute_altitude to 600.

// prepare to launch
lock steering to up.
stage.

// POM
when ship:airspeed > pitch_over_start_speed then {
    set target_pitch to 90 + pitch.
    print "Exec POM of " + target_pitch + "deg to " + max_hvel + "m/s GS.".
    lock steering to heading(90, target_pitch).

    when groundspeed > max_hvel then {
        print "Normalizing pitch".
        lock steering to up.
    }
}

when altitude > chute_altitude then {
    when altitude < chute_altitude then {
        print "Dep chutes at " + chute_altitude + "m".
        unlock steering.
        stage. // deploy chutes, hopefully
    }
}

wait until airspeed = 0.
