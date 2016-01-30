// Load ascent program
copy palisadeAscent from 0.
copy palisadeDescent from 0.

set begin_descent to false.

// Execute ascent program
print "Beginning ascent.".
run palisadeAscent(90).

wait until ascentComplete.

// Wait until engines cut off
when (ship:maxthrust<1) then {
  print "MECO. Jettisoning ascent stage".
  stage.
  set begin_descent to true.
}

wait until begin_descent.
print "Beginning descent.".
run palisadeDescent(700, 200).

wait until descentComplete.
print "Descent Complete.".
