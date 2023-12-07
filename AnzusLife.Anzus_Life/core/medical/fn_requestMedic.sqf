#include "..\..\script_macros.hpp"
/*
    File: fn_requestMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    N/A
*/
private "_medicsOnline";
_medicsOnline = {!(_x isEqualTo player) && {side _x isEqualTo independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.
if ((time - life_request_delay) < 120) exitWith {};

if (_medicsOnline) then {
    //There is medics let's send them the request.
    [life_corpse] remoteExecCall ["ANZUS_fnc_medicRequest",independent];
} else {
    //No medics were online, send it to the police.
    [life_corpse] remoteExecCall ["ANZUS_fnc_medicRequest",west];
};

life_request_delay = time;

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn  {
    ((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
    sleep (2 * 60);
    ((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};
