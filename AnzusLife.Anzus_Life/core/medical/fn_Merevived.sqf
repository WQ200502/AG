#include "..\..\script_macros.hpp"
/*
    File: fn_revived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    THANK YOU JESUS I WAS SAVED!
*/
private ["_medic","_dir","_reviveCost","_obj"];
_medic = param [0,"Unknown Medic",[""]];
_reviveCost = MAIN_SETTINGS_TYPE(getNumber,"Medical","revivalFee");
player setVariable ["life_is_alive", true, true];
[life_save_gear] spawn ANZUS_fnc_loadDeadGear;

_obj = life_corpse;
if(isNull life_corpse) then {
	_obj = _medic;
};

_dir = getDir _obj;
[format[localize "STR_Medic_RevivePay",_medic,[_reviveCost] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;

1 cutFadeOut 1;
["AnzusLife_Bleedout_efHandle", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
AnzusLife_BleedoutStart = nil;
AnzusLife_BleedoutDuration = nil;
AnzusLife_Bleedout_efHandle = nil;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if (BANK > _reviveCost) then {
    [_reviveCost,true] call xiyECYLNxrKhXypAac;
} else {
    [BANK,true] call xiyECYLNxrKhXypAac;
};

EM_climbing = false;
EM_enable = [true, true];
EM_heightsOn = [0.25,1,2,2.25,3];
//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL _obj);
_obj setVariable ["Revive",nil,true];
deleteVehicle _obj;

life_action_inUse = false;
player setVariable ["Revive",nil,true];
player setVariable ["Reviving",nil,true];
player setVariable ["tf_unable_to_use_radio", false];
player setVariable ["AnzusLife_Stabilized",0,true];

if (call life_donorlevel > 0) then {
	player enableFatigue false;
} else {
	player enableFatigue true;
};

[] call ANZUS_fnc_hudUpdate;
[] call ANZUS_fnc_updateRequest;
if(playerSide isEqualTo west) then {
	call ANZUS_fnc_setFreq;
};
[[format["%1/%2 got revived by %3",(name player),(getPlayerUID player),_medic]],"revive"] remoteExecCall ["TON_fnc_anzusinsertlog",RSERV];
[format["%1/%2 got revived by %3",(name player),(getPlayerUID player),_medic], "medical.log"] remoteExec ["AH_LogInterface",2];


[] spawn {
	sleep 5;
	[] call ANZUS_fnc_updateRequest;
};
