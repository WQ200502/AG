/*

	Filename: 	SunriseClient_dmg_KilledInAgony.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_source",ObjNull,[ObjNull]],
	["_instigator",ObjNull,[ObjNull]],
	["_damage",0,[0]],
	["_projectile","",[""]],
	["_selection","",[""]]
];

if (isNull _source && isNull _instigator) exitWith {"DMG - Kill In Agony - Source and Instigator is NULL" call SunriseClient_system_log};

private _killer = switch (true) do {
	case (_instigator isKindOf "CAManBase" && isPlayer _instigator) : {_instigator};
	case (_source isKindOf "CAManBase" && isPlayer _source) : {_source};
	default {objNull};
};

if (isNull _killer) exitWith {"DMG - Kill in Agony - Killer is NULL" call SunriseClient_system_log};
if (LSDEAD(_unit)) exitWith {"DMG - Kill in Agony - Already Dead" call SunriseClient_system_log};
if !(EQUAL(_selection,"head")) exitWith {"DMG - Kill in Agony - Not in head" call SunriseClient_system_log};
if (_damage < 0.89) exitWith {"DMG - Kill in Agony - Need more damage in head" call SunriseClient_system_log};
if ((time - life_agonyStartTime) < 5) exitWith {"DMG - Kill in Agony - Too soon" call SunriseClient_system_log};
if (EQUAL(_projectile,"")) exitWith {"DMG - Kill in Agony - Bullet is empty" call SunriseClient_system_log};
if (_projectile in ["DDOPP_B_Taser","Caseless_blau"]) exitWith {"DMG - Kill in Agony - Taser" call SunriseClient_system_log};
if !(NOTINVEH(_killer)) exitWith {"DMG - Kill in Agony - Shooter in Veh" call SunriseClient_system_log};
if !(LSINCAP(_unit)) exitWith {"DMG - Kill in Agony - Not in agony" call SunriseClient_system_log};
if ([_unit,_killer] call CBA_fnc_getDistance > 5) exitWith {"DMG - Kill in Agony - Distance Must be < 5m" call SunriseClient_system_log};

if !(EQUAL(_unit,_killer)) then {
	if !(_killer getVariable ["copDuty",false]) then {
		private _type = switch(true) do {
			case (player getVariable ["copDuty",false]): {"188W"};
			case (player getVariable ["medDuty",false]): {"188E"};
			default {"188C"};
		};
		[[getPlayerUID _killer,GVAR_RNAME(_killer),_type],"wantedAdd"] call SunriseClient_system_hcExec;
	} else {
		[[_unit,_killer],"wantedKilledbyCop"] call SunriseClient_system_hcExec;	
	};

	titleText [format["Вас добил человек с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _killer],"PLAIN"];
	hint format["Вас добил человек с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _killer];
	[["agony",format["%1 (%2) was killed by %3 (%4)",GVAR_RNAME(player),steamid,getPlayerUID _killer,GVAR_RNAME(_killer)]],"customLog"] call SunriseClient_system_hcExec;
};

["all"] call SunriseClient_removeBuff;
_unit setDamage 1;