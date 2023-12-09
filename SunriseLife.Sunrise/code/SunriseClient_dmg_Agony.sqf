/*

	Filename: 	SunriseClient_dmg_Agony.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_source",ObjNull,[ObjNull]],
	["_instigator",ObjNull,[ObjNull]],
	["_projectile","",[""]],
	["_selection","",[""]]
];

if (isNull _unit) exitWith {};
if (isNull _source && isNull _instigator && NOTINVEH(_unit)) exitWith {"DMG - Agony - Source and Instigator is NULL" call SunriseClient_system_log};
if (LSINCAP(_unit)) exitWith {"DMG - Agony - Already Incap" call SunriseClient_system_log};
if (LSDEAD(_unit)) exitWith {"DMG - Agony - Already Dead" call SunriseClient_system_log};

format["DMG - Agony - IN - Source:  %1 - Instigator: %2",_source,_instigator] call SunriseClient_system_log; //логируем кто отправил в агонию

life_agonyStartTime = time;
_unit setUnconscious true;
if (visibleMap) then {openMap false};
if (life_cop_disp isEqualTo _unit) then {[_unit] remoteExecCall ["SunriseServer_system_becomeDispatcher",2]};
if (!isNull life_DraggedBody) then {[] call SunriseClient_system_dropDeadBody};
	
if !(NOTINVEH(_unit)) then {
	private _vehicle = objectParent _unit;
	if (EQUAL((driver _vehicle),_unit)) then {_vehicle engineOn false};

	if (typeOf _vehicle in (LIFE_SETTINGS(getArray,"life_med_ejectFrom"))) then {
		_unit action ["Eject",_vehicle];
	};

	if (EQUAL((gunner _vehicle),_unit)) then {
		_unit action ["Eject",_vehicle];
	};

	[_unit] call SunriseClient_system_setDeadState;
};

["all"] call SunriseClient_removeBuff;
[] call SunriseClient_hud_hide;
[] call SunriseClient_effects_Terminate;

[_unit,"restrained"] call SunriseClient_system_clearGlobalVar;

_unit SVAR ["tf_unable_to_use_radio",true];
TF_speak_volume_meters = -1;
[_unit,"medicStatus",-1] call CBA_fnc_setVarNet;
[_unit,"lifeState","INCAPACITATED"] call CBA_fnc_setVarNet;

disableSerialization;
if (!isNull (findDisplay 49)) then {(findDisplay 49) closeDisplay 0} else {closeDialog 0};

[_unit] spawn SunriseClient_system_deathScreen;

if (EQUAL(_source,_unit) OR (isNull _source && isNull _instigator)) exitWith {[{_this call SunriseClient_system_deathScreenSetKiller}, [], 1] call CBA_fnc_waitAndExecute;};

private _killer = switch (true) do {
	case (_instigator isKindOf "CAManBase" && isPlayer _instigator) : {_instigator};
	case (_source isKindOf "CAManBase" && isPlayer _source) : {_source};
	default {objNull};
};

if (isNull _killer) exitWith {"DMG - Agony - Killer is Null" call SunriseClient_system_log}; //убит ботом

private _killerName = _killer GVAR ["realname","Без имени"];
private _killerPID = getPlayerUID _killer;

format["DMG - Agony - Killer: %1 - PID: %2",_killerName,_killerPID] call SunriseClient_system_log;

if (!(_killer getVariable ["copDuty",false] OR _killer getVariable ["medDuty",false]) && {alive _killer} && {!(EQUAL(steamid,_killerPID))}) then {
	if ([_unit] call SunriseClient_system_isSafeZone OR [_killer] call SunriseClient_system_isSafeZone) then {
		//[_killerPID,_killerName,1440,"Save Zone killing","SafeZoneFire"] remoteExecCall ["SunriseServer_system_rcon",RSERV];
		[_killer,1] remoteExecCall ["SunriseClient_system_punishment",_killer];
		//180 минут
	};
	if !(EQUAL(_killerPID,"")) then {
		private _type = switch(true) do {
			case (life_copDuty): {"187W"};
			case (life_medDuty): {"187E"};
			default {"187C"};
		};
		[[_killerPID,_killerName,_type],"wantedAdd"] call SunriseClient_system_hcExec;
	};
} else {
	if (_killer getVariable ["copDuty",false] && time - life_lastKnock > 300 && {alive _killer} && {!(EQUAL(steamid,_killerPID))}) then {
		[[_killer],"wantedKnockedByCop"] call SunriseClient_system_hcExec;
		life_lastKnock = time;
	};
};

if (!(EQUAL(_killerPID,"")) && !(EQUAL(steamid,_killerPID))) then {
	[["agony",format["%1 (%2) knocked %3 (%4) from distance %5 m. with (%6) selection %7",_killerName,_killerPID,GVAR_RNAME(_unit),steamid,round(_unit distance _killer),_projectile,_selection]],"customLog"] call SunriseClient_system_hcExec;
} else {
	[["agony",format["%1 (%2) knocked with (%3)",_killerName,_killerPID,_projectile]],"customLog"] call SunriseClient_system_hcExec;
};

//[0,format["<t color='#FF8C00'>%1</t> <t color='#800000'>тяжело ранен</t> игроком <t color='#FF8C00'>%2</t>",GVAR_RNAME(_unit),GVAR_RNAME(_killer)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];

[{_this call SunriseClient_system_deathScreenSetKiller}, [_killerPID], 1] call CBA_fnc_waitAndExecute;