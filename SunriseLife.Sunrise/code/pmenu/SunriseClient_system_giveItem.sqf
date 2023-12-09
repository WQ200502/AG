/*
	
	Filename: 	SunriseClient_system_giveItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 7214),-1)) exitWith {hint "Вы никого не выбрали";ctrlShow[7216,true];};
private _unit = call compile format["%1",CONTROL_DATA(7214)];
if (isNil "_unit") exitWith {ctrlShow[7216,true];};
if (isNull _unit) exitWith {ctrlShow[7216,true];};
if (EQUAL(_unit,player)) exitWith {ctrlShow[7216,true];};

if (EQUAL((lbCurSel 7212),-1)) exitWith {hint "您没有选择要发送的项目";ctrlShow[7216,true];};
private _item = CONTROL_DATA(7212);

private _val = ctrlText 7213;
ctrlShow[7216,false];

if !([_val] call SunriseClient_system_isnumber) exitWith {["以数字格式而不是符号格式指定数量","error"] call SunriseClient_gui_bottomNotification;ctrlShow[7216,true];};
if (parseNumber(_val) <= 0) exitWith {hint "Серьезно?!";ctrlShow[7216,true];};
if !([false,_item,(parseNumber _val)] call SunriseClient_system_handleInv) exitWith {hint "У тебя вещей столько нет!";ctrlShow[7216,true];};
if (_item in ["uraniumu","uraniump","uraniumc"] && vehicle _unit != _unit) exitWith {hint "Вы не можете передать уран человеку, который находится в транспорте"};
[_unit,_val,_item,player] remoteExecCall ["SunriseClient_system_receiveItem",_unit];
hint format["Вы передали %1 %2 %3",GVAR_RNAME(_unit),_val,ITEM_NAME(_item)];
[] call SunriseClient_inventory_update;

ctrlShow[7216,true];