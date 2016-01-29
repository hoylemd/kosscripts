declare parameter heading.

// gravity turns
WHEN SHIP:ALTITUDE > 5000 THEN {
  print "steering to 75 declination".
  LOCK STEERING TO HEADING(heading,75).

  WHEN SHIP:ALTITUDE > 10000 THEN {
    print "steering to 65 declination".
    LOCK STEERING TO HEADING(heading,65).

    WHEN SHIP:ALTITUDE > 16000 THEN {
      print "steering to 45 declination".
      LOCK STEERING TO HEADING(heading,45).

      WHEN SHIP:ALTITUDE > 24000 THEN {
        print "steering to 30 declination".
        LOCK STEERING TO HEADING(heading,30).

        when ship:apoapsis > 50000 then {
          print "leveling off.".
          LOCK STEERING TO HEADING(heading,0).
        }
      }
    }
  }
}


