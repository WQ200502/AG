/*

	Filename: 	SunriseClient_jobs_jobSelection.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (dialog) exitWith {};
if (life_copDuty OR life_medDuty) exitWith {["Вы на службе, какая работа!?", "error"] call SunriseClient_gui_BottomNotification};

createDialog "SunriseDialogJobSelection";
waitUntil {!isNull (findDisplay 7000)};

(CONTROL(7000,7001)) ctrlSetStructuredText parseText format ["<t align='center' size='0.8' color='%2'>Количество вакансий будет расти с увеличением вашего уровня<br/><br/><t size='1.2'>Доступные вакансии:<br/></t></t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

private _Btn1 = CONTROL(7000,7002);
private _Btn2 = CONTROL(7000,7003);
private _Btn3 = CONTROL(7000,7004);
private _Btn4 = CONTROL(7000,7005);
private _Btn5 = CONTROL(7000,7006);
private _Btn6 = CONTROL(7000,7007);
private _Btn7 = CONTROL(7000,7008);
private _Btn8 = CONTROL(7000,7009);
private _Btn9 = CONTROL(7000,7010);

private _btnArray = [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
{_x ctrlEnable false} foreach _btnArray;
{
	_btn = _btnArray select _forEachIndex;

	_btn ctrlSetText _x#0;
	_btn buttonSetAction _x#1;
	_btn ctrlEnable ([_x#2] call SunriseClient_system_conditionsCheck);
} forEach getArray(missionConfigFile >> "LifeCfgSettings" >> "life_jobs_array");