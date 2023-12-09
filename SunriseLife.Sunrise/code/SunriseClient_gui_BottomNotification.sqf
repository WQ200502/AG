/*

	Filename: 	SunriseClient_gui_BottomNotification.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_text","",[""]],
	["_type","info",[""]]
];
if (EQUAL(_text,"")) exitWith {};
disableSerialization;
/*["SunriseBottomNotification","PLAIN",1,true] call SunriseClient_gui_CreateRscLayer;
private _ui = GVAR_UINS ["SunriseBottomNotification",displayNull];*/

private _msg_head = switch (_type) do { 
	case "info": {"Инфо: "};
	case "warning": {"Внимание: "};
	case "news": {"Новости: "};
	case "done": {"Готово: "};
	case "error": {"Ошибка: "};
	case "money": {"Деньги: "};
	case "police": {"Полиция: "};
};
private _msg_color = switch (_type) do { 
	case "info": {[0.925,0.486,0.149,1]};
	case "warning": {[0.98,0.604,0,1]};
	case "news": {[0.369,0.969,0.941,1]};
	case "done": {[0.051,1,0,1]};
	case "error": {[1,0,0,1]};
	case "money": {[0.969,0.949,0.369,1]};
	case "police": {[0,0.769,1,1]};
};
playSound "notification";
//systemChat (_msg_head + _text);
["info","",format["%1",_text],true] call SunriseClient_message;
/*private _ctrlText = _ui displayCtrl 24901;
private _ctrlTile = _ui displayCtrl 24902;
_ctrlTile ctrlSetBackgroundColor _msg_color;
_ctrlText ctrlSetStructuredText parseText format ["<t valign='middle' size='0.85' align='left'>%1</t>", _text];
_ctrlText ctrlSetPositionH (ctrlTextHeight _ctrlText);
_ctrlText ctrlCommit 0;
life_notifications pushBack [(server_timeText splitString " " select 3) select [1,5],_type,_text];*/