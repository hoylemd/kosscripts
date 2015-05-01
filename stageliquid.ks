
// stage when neccessary
WHEN STAGE:LIQUIDFUEL < 0.001 THEN {
    PRINT "No liquidfuel. Attempting to stage.".
    STAGE.
    PRESERVE.
}


