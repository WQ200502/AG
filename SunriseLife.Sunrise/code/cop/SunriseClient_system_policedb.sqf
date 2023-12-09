/*

	Filename: 	SunriseClient_system_policedb
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
params[
	["_type",0,[0]],
	["_data",0,[[]]]
];
disableSerialization;
waitUntil {!isNull findDisplay 6396};

_display = findDisplay 6396;
_cPlayerList = _display displayCtrl 63962;
_ratingList = _display displayCtrl 63951;
_cMessageHeader = _display displayCtrl 63963;
_groupEdit = _display displayCtrl 63950;
_portraitEdit = _display displayCtrl 63952;
_crimesEdit = _display displayCtrl 63953;
_commentsEdit = _display displayCtrl 63954;
_addOrChangeButton = _display displayCtrl 963698;
_addOrChangeHeader = _display displayCtrl 963699;
_deleteButton = _display displayCtrl 63968;
if (_type in [3,4]) then {
	if ([ctrlText 63950] call SunriseClient_system_badString) exitWith {hint "Вы ввели группу неправильно. Она должен содержать только буквы или цифры!";};
	if ([ctrlText 63952] call SunriseClient_system_badString) exitWith {hint "Вы ввели псих. портрет неправильно. Он должен содержать только буквы или цифры!";};
	if ([ctrlText 63953] call SunriseClient_system_badString) exitWith {hint "Вы ввели нарушения неправильно. Он должен содержать только буквы или цифры!";};
	if ([ctrlText 63954] call SunriseClient_system_badString) exitWith {hint "Вы ввели комментарий неправильно. Он должен содержать только буквы или цифры!";};
};
_addOrChangeButton buttonSetAction "[3] spawn SunriseClient_system_policedb";
switch (_type) do {
	case 0: {
		lbClear _cPlayerList;
		{
			if (_x != player && {GVAR_RNAME(_x) != ""} && {group _x in [life_copGroup,life_medGroup]}) then {
				_cPlayerList lbAdd format["%1",GVAR_RNAME(_x)];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
		
		for "_i" from 0 to 10 do {
			_ratingList lbAdd format["%1",str(_i)];
			_ratingList lbSetData [(lbSize _ratingList)-1,str(_i)];
		};
		_ratingList lbSetCurSel 0;
	};
	case 1: {
		if ([ctrlText 93695] call SunriseClient_system_badString) exitWith {hint "Вы ввели имя или номер паспорта неправильно. Он должен содержать только буквы или цифры!";};
		[[ctrlText 93695,player],"pdatabaseFetch"] call SunriseClient_system_hcExec;
		life_searched = ctrlText 93695;
		ctrlEnable[63967,false];
	};

	case 2: {
		ctrlEnable[63967,true];
		if (_data isEqualTo []) then {
			(_display displayCtrl 96396) ctrlSetStructuredText parseText "<t size='2.2' underline='true' align='center'>Информация отсутствует</t>";
			hint "Информация отсутствует";
			if (/*life_coplevel in [11,19]*/life_coplevel > 13) then {_deleteButton ctrlShow true};
		} else {
			_date = _data select 7;
			_date = format ["%1-%2-%3 %4:%5",_date select 2,_date select 1,_date select 0,_date select 3,_date select 4];
			_addOrChangeButton buttonSetAction "[4] spawn SunriseClient_system_policedb";
			_cMessageHeader ctrlSetText format["Досье на %1",_data select 1];
			_addOrChangeButton ctrlSetText "Изменить";
			_addOrChangeHeader ctrlSetText "Изменить";
			_cPlayerList ctrlShow false;
			_groupEdit ctrlSetText (_data select 2);
			_ratingList lbSetCurSel (_data select 3);
			_portraitEdit ctrlSetText (_data select 4);
			_crimesEdit ctrlSetText (_data select 5);
			_commentsEdit ctrlSetText (_data select 6);
			(_display displayCtrl 96396) ctrlSetStructuredText parseText format["<t size='0.85'>
			<t underline='true'>Имя:</t> %2			<t underline='true'>Номер паспорта:</t> %9<br/>
			<t underline='true'>Группа:</t> %3			<t underline='true'>Адекватность:</t> %4<br/>
			<t underline='true'>Псих. портрет:</t> %5<br/>
			<t underline='true'>Нарушения:</t> %6<br/>
			<t underline='true'>Доп. комментарии:</t> %7<br/>
			<t underline='true'>Кто добавил:</t> %1			<t underline='true'>Добавлено:</t> %8<br/></t>",
			_data select 0,_data select 1,_data select 2,_data select 3,_data select 4,_data select 5,_data select 6,_date,_data select 8];
			if (life_coplevel > 13) then {_deleteButton ctrlShow true};
		};
	};

	case 3: {
		if (EQUAL((lbCurSel 63962),-1)) exitWith {hint "Вы должны выбрать человека, чтобы добавить его в базу данных!"};
		private _unit = call compile format["%1",CONTROL_DATA(63962)];
		if (isNull _unit) exitWith {};
		_cPlayerList lbSetCurSel -1;
		[[ctrlText 63950,CONTROL_DATA(63951),ctrlText 63952,ctrlText 63953,ctrlText 63954,player,_unit],"pdatabaseManage"] call SunriseClient_system_hcExec;
	};

	case 4: {
		_addOrChangeButton buttonSetAction "[4] spawn SunriseClient_system_policedb";
		[[ctrlText 63950,CONTROL_DATA(63951),ctrlText 63952,ctrlText 63953,ctrlText 63954,player,life_searched],"pdatabaseManage"] call SunriseClient_system_hcExec;
	};
	
	case 5: {
		[[player,life_searched],"pdatabaseDelete"] call SunriseClient_system_hcExec;
	};
};