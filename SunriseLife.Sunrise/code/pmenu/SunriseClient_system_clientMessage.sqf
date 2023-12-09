/*

	Filename: 	SunriseClient_system_clientMessage.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_msg","",[""]],
	["_from",objNull,[objNull]],
	["_type",0,[0]],
	["_pos",[],[[]]]
];

if (EQUAL(_from,objNull)) exitWith {};
if (isNil "life_session_completed" OR isNil "life_isAdmin") exitWith {};
private _from_name = _from getVariable ["realname",""];

switch (_type) do {
	case 1 : {
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Новое сообщение<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from_name,_msg];
		//[format["Вы получили сообщение от %1",_from_name],"info"] call SunriseClient_gui_bottomNotification;

		//systemChat format[">>>Сообщение от %1: %2",_from_name,_msg];
		["info","",format [">>>Сообщение от %1: %2",_from_name,_msg],true] call SunriseClient_message;
		
		life_messages pushBack [getPlayerUID _from,_from_name,_msg];
	};

	case 2 : {
		if !(life_copDuty) exitWith {};
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Новый вызов<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем полицейским<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from_name,_msg];
		//[format["Запрос в полицию от: %1",_from_name],"info"] call SunriseClient_gui_bottomNotification;

		[_from_name,_msg,_pos] call SunriseClient_pmenu_addCallLog;

		//systemChat format["!!!ВЫЗОВ ПОЛИЦИИ ОТ %1: %2",_from_name,_msg];
		
		["info","",format ["!!!ВЫЗОВ ПОЛИЦИИ ОТ %1: %2",_from_name,_msg],true] call SunriseClient_message;
	};

	case 3 : {
		if !(call life_isAdmin) exitWith {};
		hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Запрос администрации<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Администрации<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from_name,_msg];
		//[format["Запрос администрации от: %1",_from_name],"info"] call SunriseClient_gui_bottomNotification;

		[_from_name,_msg,_pos] call SunriseClient_pmenu_addCallLog;

		//systemChat format["СООБЩЕНИЕ АДМИНУ ОТ %1: %2",_from_name,_msg];
		
		["info","",format ["SUNRISE TEAM СООБЩЕНИЕ АДМИНУ ОТ %1: %2",_from_name,_msg],true] call SunriseClient_message;
		life_messages pushBack [getPlayerUID _from,_from_name,_msg];
	};

	case 4: {
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>ВЫЗОВ EMS<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Вам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from_name,_msg];
		//[format["Вызов EMS от %1",_from_name],"info"] call SunriseClient_gui_bottomNotification;

		[_from_name,_msg,_pos] call SunriseClient_pmenu_addCallLog;

		//systemChat format["!!!ВЫЗОВ EMS: %1",_msg];
		["info","",format ["!!!ВЫЗОВ EMS: %1",_msg],true] call SunriseClient_message;
	};

	case 5 : {
		hint parseText format ["<t color='#8a00ff'><t size='2'><t align='center'>Сообщение от админа<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>Админ<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];
		//[format["<t color='#ffffff'>Сообщение от админа!<br />%1</t>",_msg],-1,0.8,10] spawn BIS_fnc_dynamicText;
		//["Вы получили сообщение от админа!","info"] call SunriseClient_gui_bottomNotification;

		if (call life_isAdmin) then {systemChat format["!!!СООБЩЕНИЕ ОТ АДМИНА %1: %2",_from_name,_msg]};
		life_messages pushBack [getPlayerUID _from,_from_name,_msg];
	};

	case 8 : {
		hint parseText format ["<t color='#0e83e6'><t size='2'><t align='center'>Полицейское сообщение<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>Полиция<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%1",_msg];
		//["Вы получили сообщение от полиции!","info"] call SunriseClient_gui_bottomNotification;

		//systemChat format["!!!СООБЩЕНИЕ ОТ ПОЛИЦИИ: %1",_msg];
		["info","",format ["!!!СООБЩЕНИЕ ОТ ПОЛИЦИИ: %1",_msg],true] call SunriseClient_message;
		
		if (life_coplevel > 0) then {["info","",format ["Отправлено полицейским: %1", _from_name],true] call SunriseClient_message};
	};

	case 9 : {
		hint parseText format ["<t color='#ff0000'><t size='2'><t align='center'>Сообщение от EMS<br/><br/><t color='#e2b721'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#e2b721'>От кого: <t color='#ffffff'>EMS<br/><br/><t color='#e2b721'>Сообщение:<br/><t color='#ffffff'>%1",_msg];
		//["Вы получили сообщение от EMS!","info"] call SunriseClient_gui_bottomNotification;

		//systemChat format["!!!СООБЩЕНИЕ ОТ EMS: %1",_msg];
		["info","",format ["!!!СООБЩЕНИЕ ОТ EMS: %1",_msg],true] call SunriseClient_message;
		if (life_medlevel > 0) then {systemChat format["Отправлено сотрудником EMS: %1", _from_name]};
	};

	case 10: {
		hint parseText format ["<t color='#ff0000'><t size='2'><t align='center'>Сообщение от 7NEWS<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Всем игрокам<br/><t color='#33CC33'>От кого: <t color='#ffffff'>7NEWS<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%1",_msg];

		//systemChat format[">>>Сообщение от 7NEWS: %1",_msg];
		["info","",format [">>>Сообщение от 7NEWS: %1",_msg],true] call SunriseClient_message;
		if (life_coplevel > 0) then {systemChat format["Отправлено сотрудником 7NEWS: %1", _from_name]};
	};
	
	case 11: {
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Новое сообщение<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Кому: <t color='#ffffff'>Группе<br/><t color='#33CC33'>От кого: <t color='#ffffff'>%1 (группа)<br/><br/><t color='#33CC33'>Сообщение:<br/><t color='#ffffff'>%2",_from_name,_msg];
		//[format["Вы получили сообщение от %1 (группа)",_from_name],"info"] call SunriseClient_gui_bottomNotification;

		//systemChat format[">>>Сообщение от %1 (группа): %2",_from_name,_msg];;
		["info","",format [">>>Сообщение от %1 (группа): %2",_from_name,_msg],true] call SunriseClient_message;
	};

};