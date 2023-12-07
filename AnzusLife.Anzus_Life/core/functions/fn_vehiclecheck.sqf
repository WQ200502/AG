#include "..\..\script_macros.hpp"
sleep 1;

if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"]; closeDialog 0;};
