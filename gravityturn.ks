declare parameter heading.
// gravity turns
WHEN SHIP:ALTITUDE > 500 THEN {
    LOCK STEERING TO HEADING(heading,85).

    WHEN SHIP:ALTITUDE > 1500 THEN {
        LOCK STEERING TO HEADING(heading,75).

        WHEN SHIP:ALTITUDE > 5000 THEN {
            LOCK STEERING TO HEADING(heading,65).

            WHEN SHIP:ALTITUDE > 10000 THEN {
                LOCK STEERING TO HEADING(heading,45).

                WHEN SHIP:ALTITUDE > 15000 THEN {
                    LOCK STEERING TO HEADING(heading,0).

                }
            }
        }
    }
}


