/*

	Filename: 	SunriseClient_system_catchFish.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _boat = objectParent player;
if (EQUAL((driver _boat),player)) exitWith {hint localize "STR_NOTF_PassengerSeat"};
private _zone = "";
{
	if (player distance (getMarkerPos _x) < 75) exitWith {_zone = _x;};
} foreach ["fish_1","fish_2"];

if (EQUAL(_zone,"")) exitWith {hint localize "STR_NOTF_ProfFishing"};

private _val = 1;
private _gather = switch(true) do {
	case (_zone in ["fish_1"]): {_val = 2;"shrimp"};
	case (_zone in ["fish_2"]): {"shark"};
	default {""};
};

if (EQUAL(_gather,"")) exitWith {};

private _total = 0;
private _time = switch (FETCH_CONST(life_donator)) do {
	case 0: {0.35};
	case 1: {0.3};
	case 2: {0.25};
	case 3: {0.2};
	case 4: {0.1};
};

if (FETCH_CONST(life_donator) > 0) then {ADD(_val,1)}; //new

["info","",format[localize "STR_NOTF_GatherBoatStop"]] call SunriseClient_message;

private "_diff";
while {life_carryWeight < life_maxWeight} do {
	if (life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
	life_action_gathering = true;

	_diff = [_gather,_val,life_carryWeight,life_maxWeight] call SunriseClient_system_calWeightDiff;
	if (EQUAL(_diff,0)) exitWith {["error","",format[localize "STR_NOTF_InvFull"]] call SunriseClient_message};

	[localize "STR_NOTF_Gathering",_time,"","",false,{((isNull objectParent player) OR (isEngineOn _boat) OR !(driver _boat isEqualTo player))}] call SunriseClient_system_progressBar;
	if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
	if ((isNull objectParent player) OR (isEngineOn _boat) OR !(driver _boat isEqualTo player)) exitWith {titleText[localize "STR_NOTF_GatheringCancel","PLAIN"];};
	if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};	
		
	if ([true,_gather,_diff] call SunriseClient_system_handleInv) then {
		_total  = _total + _val;		
		["done","",format[localize "STR_NOTF_Gather_Success",ITEM_NAME(_gather),_total]] call SunriseClient_message;
		["FishCought"] spawn SunriseClient_experience_addExp;
	};

	life_action_gathering = false;
};

life_action_inUse = false;
life_action_gathering = false;