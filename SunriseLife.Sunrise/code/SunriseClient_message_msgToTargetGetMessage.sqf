/*

	Filename: 	SunriseClient_message_msgToTargetGetMessage.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_unit",objNull,[objNull]],
	["_messageID",0,[0]]
];
if (isNull _unit) exitWith {"msgToTargetGetMessage - unit isNull" call SunriseClient_system_log};
if (EQUAL(_messageID,0)) exitWith {"msgToTargetGetMessage - messageID zero" call SunriseClient_system_log};

private _text = switch (_messageID) do {
	case 1 : {"Немедленно остановитесь, выйдите из техники и поднимите руки вверх! В случае невыполнения требований будет открыт огонь на поражение!"}; 
	case 2 : {"Немедленно остановитесь! Заглушите двигатель и оставайтесь в транспортном средстве! Ожидайте дальнейших указаний! В случае невыполнения требований будет применено оружие!"}; 
	default {""};
};

if (EQUAL(_text,"")) exitWith {"msgToTargetGetMessage - no text for messageID" call SunriseClient_system_log};

switch (true) do { 
	case (_unit getVariable ["copDuty",false]) : {
		hint parseText format ["<t color='#0e83e6'><t size='2'><t align='center'>Полицейское сообщение<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%2",GVAR_RNAME(_unit),_text];
		["PoliceDispatch",["Вы получили сообщение от полиции!"]] call bis_fnc_showNotification;
	}; 
	case (_unit getVariable ["medDuty",false]) : {
		hint parseText format ["<t color='#ff0000'><t size='2'><t align='center'>Сообщение от EMS<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%2",GVAR_RNAME(_unit),_text];
		["MedicMessage",["Вы получили сообщение от EMS!"]] call bis_fnc_showNotification;
	}; 
	default {
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Новое сообщение<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",GVAR_RNAME(_unit),_text];
		["TextMessage",[format["Вы получили сообщение от %1",GVAR_RNAME(_unit)]]] call bis_fnc_showNotification;
	}; 
};

player say3D "sms";

[["agony",format["%1 (%2) warned %3 (%4)",GVAR_RNAME(_unit),getPlayerUID _unit,GVAR_RNAME(player),getPlayerUID player]],"customLog"] call SunriseClient_system_hcExec;