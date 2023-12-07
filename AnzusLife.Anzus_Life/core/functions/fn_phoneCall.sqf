/*
	File: fn_phoneCall.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initiate or receive a phone call.
*/

private ["_init","_unit","_callStart"];
_init = [_this,0,true,[true]] call BIS_fnc_param;
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;

if (isNull _unit) exitWith
{
	_to = objNull;
	_toString = format["%1",(lbData[5004,(lbCurSel 5004)])];
	if (_toString == "911" && isNull life_dispatcher) exitWith { hint "目前无法派遣警察.请稍后重试或发送紧急短信." };
	if (_toString == "911") then { _to = life_dispatcher }
	else { _to = call compile _toString; };
	if (isNull _to) exitWith {};
	[true,_to] spawn ANZUS_fnc_phoneCall;
};

if (life_phone_status != 0) exitWith {};

_callStart = time;

if (_init) then {
    if (life_phone_channel > -1) exitWith {};
    life_phone_status = 2;
    [
        [0, 2], format["正在呼叫 %1...", [name _unit] call ANZUS_fnc_cleanName]
    ] call ANZUS_fnc_broadcast;

    [[false,player],"ANZUS_fnc_phoneCall",_unit,false] call ANZUS_fnc_MP;
    while {
        life_phone_status == 2
    }
    do {
        if (life_phone_channel > -1) exitWith {
            life_phone_status = 3
        };
        if (time - _callStart > 60) exitWith {
            life_phone_status = 0
        };
        //playSound "phonedial";
        //sleep 4;
    };
    if (life_phone_status == 0) then {
        [
            [0, 2], format["%1 没有接听电话.", [name _unit] call ANZUS_fnc_cleanName]
        ] call ANZUS_fnc_broadcast;
    };
    if (life_phone_status == 3 || life_phone_channel > -1) then {
        [
            [0, 2], format["%1 已添加到会话.", [name _unit] call ANZUS_fnc_cleanName]
        ] call ANZUS_fnc_broadcast;
    };

    /*if (life_phone_status == 3) then {

        deleteVehicle _PhoneDial;
    };*/
}
else {
    life_phone_status = 1;
    [
        [0, 2], format["来自 %1 电话. 请按 9 接听或按 8 忽略.", [name _unit] call ANZUS_fnc_cleanName]
    ] call ANZUS_fnc_broadcast;
    while {
        life_phone_status == 1
    }
    do {
        if (time - _callStart > 55) exitWith {
            life_phone_status = 0
        };
        playSound "phonering";
        sleep 3;
    };

    if (life_phone_status == 3) then {
        [_unit, player] remoteExec["TON_fnc_managePhone", 2];
    };
};