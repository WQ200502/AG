/*

	Filename: 	SunriseClient_message.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

	Web:		http://sunriserp.ru
	
*/
#include "..\..\script_macros.hpp"
private _type = [_this,0,"info",[""]] call BIS_fnc_param;
private _title = [_this,1,"------",[""]] call BIS_fnc_param;
private _message = [_this,2,"",[""]] call BIS_fnc_param;
private _mode = [_this,3,false,[false]] call BIS_fnc_param;

if (_message isEqualTo "") exitWith {};
private _color = [1,0.682,0,1];

switch (_type) do {
	case "info": {_color = [0.925,0.486,0.149,1]};
	case "error": {_color = [1,0,0,1]};
	case "done": {_color = [0.051,1,0,1]};
	case "errordonat": {_color = [1,0,0,1]};
	case "sunrise": {_color = [0.925,0.486,0.149,1]};
	case "police": {_color = [0,0.769,1,1]};
};

if (_mode) then {
	if (_type isEqualTo "errordonat") then {
		[format ["<t size='20' font='PuristaSemiBold'>%1</t><br/><t color='#ff979ba1' size='20' font='PuristaSemiBold'>%2</t><br/><t size='18' color='#ff979ba1' font='PuristaSemiBold'>Больше информации на</t> <t size='18' font='PuristaLight'>lk.platinumrp.club</t>",_title,_message],_color] call SunriseClient_ui_messagechat;
		} else {
		[format ["<t size='20' font='PuristaSemiBold'>%1</t>",_message],_color] call SunriseClient_ui_messagechat;
	};
} else {
	if (_type isEqualTo "errordonat") then {
		[format ["<t size='20' font='PuristaSemiBold'>%1</t><br/><t color='#ff979ba1' size='20' font='PuristaSemiBold'>%2</t><br/><t size='18' color='#ff979ba1' font='PuristaSemiBold'>Больше информации на</t> <t size='18' font='PuristaLight'>lk.platinumrp.club</t>",_title,_message],_color] call SunriseClient_ui_message;
	} else {
		[format ["<t size='20' font='PuristaSemiBold'>%1</t><br/><t color='#ff979ba1' size='20' font='PuristaSemiBold'>%2</t>",_title,_message],_color] call SunriseClient_ui_message;
	};
};