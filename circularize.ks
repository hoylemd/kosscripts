// DEPENDANCIES: changePeriapsis
// COMPLETION VARIABLE: circularizeComplete
set circularizeComplete to False.
set alt to ship:apoapsis.
run changePeriapsis(alt).

run executeNode.
set circularizeComplete to True.
