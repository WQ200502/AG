params ["_mapIsOpened", "_mapIsForced"];

if (_mapIsOpened) then {
    if ( playerSide isEqualTo independent ) then {[] spawn ANZUS_fnc_medicMarkers;};
    if ( playerSide isEqualTo west && ((independent countSide playableUnits) isEqualTo 0)) then {[] spawn ANZUS_fnc_medicMarkers;};
};
