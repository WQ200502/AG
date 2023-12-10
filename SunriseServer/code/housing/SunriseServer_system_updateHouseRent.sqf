/*

	Filename: 	SunriseServer_system_updateHouseRent.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
    ["_house",Objnull,[Objnull]],
    ["_unit",objNull,[objNull]],
	["_valToPay",0,[0]]
]) exitWith {["error",format ["|SunriseServer_system_updateHouseRent| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _house_id = _house getVariable ["house_id",-1];
private _cantPayHouseRent = format["cantPayHouseRent:%1",_house_id] call SunriseServer_database_selectSingleField;
if (_cantPayHouseRent) exitWith {
	["Вы не можете проплатить услуги ЖКХ сейчас. Проплачивать услуги ЖКХ можно только за 7 дней до конца оплаченного периода.","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];
	["atm","add",_valToPay] remoteExecCall ["SunriseClient_system_myCash",_unit];
};

format ["updateHouseRent:%1",_house_id] call SunriseServer_database_fireAndForget;
["Вы успешно продлили услуги ЖКХ на 1 месяц.","done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];
["RentPaid"] remoteExecCall ["SunriseClient_experience_addExp",_unit];

[{
	_date = format["getHouseRent:%1",_this#1] call SunriseServer_database_selectSingleField;
	(_this#0) setVariable ["house_expires",_date,true];
},[_house,_house_id],5] call CBA_fnc_waitAndExecute;