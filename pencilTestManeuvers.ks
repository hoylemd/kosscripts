// load dependancies
copy loadStandardManeuvers from 0.
run loadStandardManeuvers.
copy pencilAscent from 0.
run pencilAscent(90).

wait until ascentComplete.
// test raise apoapsis
run changeApoapsis(300000).
run executeNode.
run changePeriapsis(30000).
run executeNode.
