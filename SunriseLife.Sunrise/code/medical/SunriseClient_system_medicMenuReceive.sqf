/*
	
	Filename: 	SunriseClient_system_medicMenuReceive.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_medic_wantedList = param [0,[],[[]]];

private _cPlayerList = CONTROL(39001,39002);

private "_statustext";
{	
	if ((GVAR_RNAME(_x) != "") && (alive _x) && (LSINCAP(_x)) && (_x GVAR ["medicStatus",-1] >= 0)) then {
		_statustext = switch (_x GVAR ["medicStatus",-1]) do {
			case 0: {"Ожидает"};
			case 1: {"Отказано"};
			case 2: {"Вызов принят"};			
			case 3: {"Ожидает. Идет бой"};
			case 4: {"Ожидает. Военное положение"};
			case 5: {"Отказано. Красная зона"};
			case 6: {"Отказано. Черный список"};
			case 7: {"Отказано. В розыске"};
			default {""};
		};

		_cPlayerList lbAdd format["[%1] %2",(group _x) getVariable ["gang_name","Нет"],GVAR_RNAME(_x)];
		_cPlayerList lbSetTextRight [(lbSize _cPlayerList)-1, format["[ %1 ]", _statustext]];	
		_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
	};
} forEach playableUnits;

if (EQUAL((lbSize _cPlayerList),0)) then {
	_cPlayerList lbAdd "Список пуст";
};

_cPlayerList lbSetCurSel 0;