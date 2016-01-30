// COMPLETION VARIABLE: descentComplete
declare parameter drogue_alt.
declare parameter chute_alt.

set descentComplete to false.

// deploy drogue
when altitude < drogue_alt then {
  print "Deploying drogue chute at " + drogue_alt + "m.".
  stage.
}
// deploy chutes
when altitude < chute_alt then {
  print "Deploying main chute at " + chute_alt + "m.".
  stage.
  set descentComplete to true.
}

wait until descentComplete.
