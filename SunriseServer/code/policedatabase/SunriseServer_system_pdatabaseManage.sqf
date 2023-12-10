/*

    Filename:   SunriseServer_system_pdatabaseManage.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
    ["_gang","",[""]],
    ["_rating","",[""]],
    ["_portrait","",[""]],
	["_crimes","",[""]],
    ["_comments","",[""]],
	["_player",objNull,[objNull]],
    ["_unit","",[objNull,""]]
];
if (_unit isEqualTo "") exitWith {}; //Bad data passed.
_gang = [_gang] call SunriseServer_database_strip;
_portrait = [_portrait] call SunriseServer_database_strip;
_crimes = [_crimes] call SunriseServer_database_strip;
_comments = [_comments] call SunriseServer_database_strip;
if (_unit isEqualType objNull) then
{	
	_uid = getPlayerUID _unit;
	if (_uid isEqualTo "") exitWith {};
	_isAlreadyIn = format ["pdatabaseIsIn:%1",_uid] call SunriseServer_database_selectSingleField;
	if (_isAlreadyIn) exitWith {["Этот человек уже есть в базе данных. Проверьте еще раз!","error"] remoteExecCall ["SunriseClient_system_hint",_player]};
	private _unitN = if (alive _unit) then {name _unit} else {GVAR_RNAME(_unit)};
	private _authorN = GVAR_RNAME(_player);
    format ["pdatabaseInsert:%1:%2:%3:%4:%5:%6:%7:%8:%9",_gang,_rating,_portrait,_crimes,_comments,_uid,_unitN,getPlayerUID _player,_authorN] call SunriseServer_database_fireAndForget;
} else {
    format ["pdatabaseUpdate:%1:%2:%3:%4:%5:%6:%7",_gang,_rating,_portrait,_crimes,_comments,_unit,_unit] call SunriseServer_database_fireAndForget;
};
