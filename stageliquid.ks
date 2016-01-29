
// stage when neccessary
WHEN STAGE:LIQUIDFUEL < 0.001 AND STAGE:SOLIDFUEL < 0.001 THEN {
    PRINT "No fuel. Attempting to stage.".
    STAGE.
    PRESERVE.
}
