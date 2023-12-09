/*

	Filename: 	SunriseClient_system_newMsg.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_type",-1,[0]],
	["_playerData",-1,[0]],
	["_msg","",[""]]
];

if (EQUAL(_type,-1)) exitWith {};

private _cPlayerList = CONTROL(88888,88881);
private _cMessageEdit = CONTROL(88888,88884);

private _isPhone = [] call SunriseClient_system_canUsePhone;
private _cantUse = (player GVAR ["tf_unable_to_use_radio",false]);
switch(_type) do {
	case 0: {
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Сообщение для: %1",GVAR_RNAME(life_smartphoneTarget)]];
	};
	//normal message
	case 1: {
		if !(_isPhone) exitWith {["error","",format[localize "STR_SMARTPHONE_NoPhone"]] call SunriseClient_message;};
		if (_cantUse) exitWith {["error","",format["Вы не можете пользоваться телефоном со связанными руками"],true] call SunriseClient_message};
		if !(life_smartphoneTarget isEqualType objNull) exitWith {["error","",format["Абонент недоступен"],true] call SunriseClient_message};
		if (isNull life_smartphoneTarget) exitWith {["error","",format["Абонент недоступен"],true] call SunriseClient_message};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message};

		[_msg,player,1] remoteExecCall ["SunriseClient_system_clientMessage",life_smartphoneTarget];		
		["done","",format["Вы отправили сообщение для %1: %2",GVAR_RNAME(life_smartphoneTarget),_msg],true] call SunriseClient_message;

		closeDialog 88883;
	};
	//copmessage
	case 2: {
		if !(_isPhone) exitWith {["error","",format[localize "STR_NOTF_Gather_Success"]] call SunriseClient_message};
		if (_cantUse) exitWith {["error","",format["Вы не можете пользоваться телефоном со связанными руками"],true] call SunriseClient_message};
		if (units life_copGroup isEqualTo []) exitWith {["error","",format["Полиция в данный момент недоступна. Пожалуйста, повторите ваш запрос позже"],true] call SunriseClient_message};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message};

		if (isNull life_cop_disp) then {
			[_msg,player,2,getpos player] remoteExecCall ["SunriseClient_system_clientMessage",life_copGroup];
		} else {
			[_msg,player,2,getpos player] remoteExecCall ["SunriseClient_system_clientMessage",life_cop_disp];
		};

		["done","",format["Вы отправили сообщение для полиции: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
	//msgadmin
	case 3: {
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};
		[_msg,player,3,getpos player] remoteExecCall ["SunriseClient_system_clientMessage",-2];

		["done","",format["Вы отправили сообщение для администрации: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
	//emsrequest
	case 4: {
		if !(_isPhone) exitWith {["error","",format[localize "STR_SMARTPHONE_NoPhone"]] call SunriseClient_message;};
		if (_cantUse) exitWith {["error","",format["Вы не можете пользоваться телефоном со связанными руками"],true] call SunriseClient_message};
		if (units life_medGroup isEqualTo []) exitWith {["error","",format["EMS в данный момент недоступно. Пожалуйста, повторите ваш запрос позже"],true] call SunriseClient_message;};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};

		[_msg,player,4,getpos player] remoteExecCall ["SunriseClient_system_clientMessage",life_medGroup];

		["done","",format["Вы отправили сообщение для EMS: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
	//adminToPerson
	case 5: {
		if !(call life_isAdmin) exitWith {};
		if !(life_smartphoneTarget isEqualType objNull) exitWith {["error","",format["Абонент недоступен"],true] call SunriseClient_message};
		if (isNull life_smartphoneTarget) exitWith {["error","",format["Абонент недоступен"],true] call SunriseClient_message};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};

		[_msg,player,5] remoteExecCall ["SunriseClient_system_clientMessage",life_smartphoneTarget];

		["done","",format["Вы отправили сообщение для администрации для %1: %2",GVAR_RNAME(life_smartphoneTarget),_msg],true] call SunriseClient_message;
		closeDialog 88883;
	};

	//emergencyloading
	case 6: {
		for "_i" from 888904 to 888913 do {ctrlEnable[_i,false]};
		private _actions = [
			["EMS всем","[9,-1,(ctrlText 888894)] call SunriseClient_system_newMsg",life_medDuty],
			["Полиция всем","[8,-1,(ctrlText 888894)] call SunriseClient_system_newMsg",life_copDuty],
			["Админ всем","[7,-1,(ctrlText 888894)] call SunriseClient_system_newMsg",(call life_isAdmin)],
			["Сдавайтесь","[8,-1,(ctrlText 888894) + ""! Сдавайтесь! Вы окружены, сопротивление бесполезно! В случае невыполнения требований полиции будет открыт огонь на поражение!""] call SunriseClient_system_newMsg",life_copDuty],
			["Стой и выйди","[8,-1,(ctrlText 888894) + ""! Немедленно остановитесь, выйдите из техники и поднимите руки вверх! В случае невыполнения требований полиции будет открыт огонь на поражение!""] call SunriseClient_system_newMsg",life_copDuty],
			["Стой и сиди","[8,-1,(ctrlText 888894) + ""! Немедленно остановитесь! Заглушите двигатель и оставайтесь в транспортном средстве! Ожидайте дальнейших указаний! В случае невыполнения требований будет применено оружие!""] call SunriseClient_system_newMsg",life_copDuty],
			["КПП Кавала","[8,-1,""Внимание! Военное положение на КПП Кавала в радиусе 2км! Всем покинуть территорию, ведется огонь на поражение!""] call SunriseClient_system_newMsg",life_copDuty],
			["Федрезерв","[8,-1,""Внимание! Военное положение на Федеральном резерве в радиусе 2км! Всем покинуть территорию, ведется огонь на поражение!""] call SunriseClient_system_newMsg",life_copDuty],
			["Ожидайте!","[9,-1,""Ожидайте, медик в пути!""] call SunriseClient_system_newMsg",life_medDuty],
			["Оставь раненого","[9,-1,""Не перевозите раненого!""] call SunriseClient_system_newMsg",life_medDuty],
			["Отказ принят","[9,-1,""Отказ принят""] call SunriseClient_system_newMsg",life_medDuty],
			["Отказ отклонён","[9,-1,""Отказ отклонён""] call SunriseClient_system_newMsg",life_medDuty],
			["Уточните координаты","[9,-1,""Уточните координаты""] call SunriseClient_system_newMsg",life_medDuty],
			["Выйти из ВП","[9,-1,""Дайте медику выйти из ВП!""] call SunriseClient_system_newMsg",life_medDuty]
		];
		private _iterator = 888904;
		{
			
			if (_x select 2) then {
				buttonSetAction [_iterator,_x select 1];
				ctrlSetText [_iterator,_x select 0];
				ctrlEnable [_iterator,true];
				_iterator = _iterator + 1;
			};
		} forEach _actions;
	};

	//adminMsgAll
	case 7: {
		if !(call life_isAdmin) exitWith {};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};

		[_msg,player,5] remoteExecCall ["SunriseClient_system_clientMessage",-2];

		["done","",format["Вы отправили сообщение от администрации для всех: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
	//PoliceMsgAll
	case 8: {
		if (life_coplevel < 1) exitWith {["error","",format["Вы не полицейский!"],true] call SunriseClient_message;};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};

		[_msg,player,8] remoteExecCall ["SunriseClient_system_clientMessage",-2];

		["done","",format["Вы отправили сообщение от полиции для всех: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
	//MedicMsgAll
	case 9: {
		if (life_medlevel < 1) exitWith {["error","",format["Вы не сотрудник EMS!"],true] call SunriseClient_message;};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};

		[_msg,player,9] remoteExecCall ["SunriseClient_system_clientMessage",-2];

		["done","",format["Вы отправили сообщение от EMS для всех: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
	//7newsMsgAll
	case 10: {
		if !("press" in life_licenses) exitWith {["error","",format["Вы не сотрудник 7NEWS!"],true] call SunriseClient_message;};
		if (life_civlevel < 3) exitWith {["У вас не 3-ий уровень","error"] call SunriseClient_gui_bottomNotification};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};

		[_msg,player,10] remoteExecCall ["SunriseClient_system_clientMessage",-2];

		["done","",format["Вы отправили сообщение от 7NEWS для всех: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
	//Group
	case 11: {
		if (isNil {grpPlayer GVAR "gang_name"}) exitWith {["error","",format["У вас должна быть группа, чтобы писать ей сообщения"],true] call SunriseClient_message;};
		if (EQUAL(_msg,"")) exitWith {["error","",format["Сообщение не может быть пустым!"],true] call SunriseClient_message;};

		[_msg,player,11] remoteExecCall ["SunriseClient_system_clientMessage",group player];

		["done","",format["Вы отправили сообщение для группы: %1",_msg],true] call SunriseClient_message;
		closeDialog 887890;
	};
};