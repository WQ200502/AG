/*
	
	Filename: 	SunriseClient_system_escortAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};
if (!isPlayer _unit OR (player distance _unit > 3)) exitWith {};
if !(NOTATTACHED(_unit)) exitWith {["error","",format[localize "STR_NOTF_EscortError"]] call SunriseClient_message};
if !(EQUAL((attachedObjects player),[])) exitWith {["error","",format[localize "STR_NOTF_EscortError"]] call SunriseClient_message};

life_escortingPlayer = _unit;
AID_SEA = player addAction["<img image='\sunrise_pack\icons\ui\s_icon_stop.paa' /> Отменить эскорт",SunriseClient_system_stopEscortingAction,"",0,false,false,"",'if (isNull life_escortingPlayer) then {player removeAction AID_SEA} else {true}'];
_unit attachTo [player,[0.1,1.1,0]];
player reveal _unit;