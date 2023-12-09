/*
	
	Filename: 	SunriseClient_crafting_Action.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 669),-1)) exitWith {};

private _recipe = CONTROL_DATA(669);
private _craftButton = CONTROL(666,674);
private _craftEditBox = CONTROL(666,678);

private _editBox = parseNumber(ctrlText 678);
if !([str(_editBox)] call SunriseClient_system_isnumber) exitWith {["Укажите количество в цифровом формате, а не символьном","error"] call SunriseClient_gui_bottomNotification};
if (_editBox > 999999) exitWith {hint "Слишком много"};
if (_editBox <= 0) exitWith {["Укажите положительное значение","error"] call SunriseClient_gui_bottomNotification};

if (!isClass (missionConfigFile >> "LifeCfgRecipes" >> _recipe)) exitWith {hint "Нет инормации о рецепте"};

private _conditions = M_CONFIG(getText,"LifeCfgRecipes",_recipe,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgRecipes",_recipe,"conditionsMessage")];
};

private _vip = M_CONFIG(getNumber,"LifeCfgRecipes",_recipe,"vip");
if (FETCH_CONST(life_donator) < _vip) exitWith {hint format ["Данный рецепт доступен с %1 уровня донатора",_vip]};

private _itemFinal = M_CONFIG(getText,"LifeCfgRecipes",_recipe,"finalItem");
private _recipeMaterialsY = M_CONFIG(getArray,"LifeCfgRecipes",_recipe,"virtualMats");
private _recipeMaterialsI = M_CONFIG(getArray,"LifeCfgRecipes",_recipe,"inventoryMats");
private _yItem = if (isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemFinal)) then {true} else {false};

private _error = false;
private _errorText = "";

//[["royalcp",3],["allucan",1],["arwater",1]]
//проверим еще раз все ли компоненты на месте
{
	if (ITEM_VALUE(_x select 0) < ((_x select 1) * _editBox)) exitWith { 
		_error = true; _errorText = "Недостаточное кол-во ресурсов";
	};
} forEach _recipeMaterialsY;
{
	if (([_x select 0] call SunriseClient_system_itemCount) < ((_x select 1)*_editBox)) exitWith {
		_error = true; _errorText = "Недостаточное кол-во ресурсов";
	};
} forEach _recipeMaterialsI;
if (_error) exitWith {hint _errorText};

//делаем проверку на место. вычитаем из текущего веса материалы и плюсуем итоговый продукт. если больше максимума - ошибка
if (_yItem) then {
	private _weightMinus = 0;
	{
		_weightMinus = _weightMinus + ((ITEM_WEIGHT(_x select 0)) * (_x select 1));
	} forEach _recipeMaterialsY;

	_weightMinus = _weightMinus * _editBox;
	
	if ((life_carryWeight - _weightMinus + ((ITEM_WEIGHT(_itemFinal)) * _editBox)) > life_maxWeight) exitWith {
		_error = true; _errorText = "Недостаточно места в инвентаре";
	};	
};
if (_error) exitWith {hint _errorText};

private _time = switch (FETCH_CONST(life_donator)) do {
	case 0: {0.35};
	case 1: {0.3};
	case 2: {0.25};
	case 3: {0.2};
	case 4: {0.1};
};

_craftButton ctrlEnable false;
_craftEditBox ctrlEnable false;
life_is_processing = true;

private _cP = 0;
while{true} do {	
	_cP = _cP + 0.01;	
	_craftButton ctrlSetText format["Крафт... (%1%2)",round(_cP * 100),"%"];	
	if (call SunriseClient_system_isInterrupted OR (isNull (findDisplay 666))) exitWith {};
	if (_cP >= 1) exitWith {};
	player playActionNow "FT_Act_Craft_Thing";
	uiSleep _time;
};

_craftButton ctrlSetText (localize "STR_CRAFT_Button");
_craftButton ctrlEnable true;
_craftEditBox ctrlEnable true;
life_is_processing = false;

if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};

player PlayActionNow "FT_Act_Gesture_Reset";

if (isNull (findDisplay 666)) exitWith {[localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

//убираем из рюкзака старые Y предметы
{
	if !([false,_x select 0,(_x select 1)*_editBox] call SunriseClient_system_handleInv) exitWith {
		_error = true; _errorText = "Недостаточно исходных ингридиентов";
	}
} forEach _recipeMaterialsY;
//убираем из рюкзака старые I предметы
{	
	for "_i" from 1 to ((_x select 1)*_editBox) do {
		if !([_x select 0] call SunriseClient_system_removeItem) exitWith {
			_error = true; _errorText = "Недостаточно исходных ингредиентов";
		};
	};	
} forEach _recipeMaterialsI;
if (_error) exitWith {hint _errorText};

//добавляем новые
if (_yItem) then {
	private _newItemName = ITEM_NAME(_itemFinal);
	if ([true,_itemFinal,_editBox] call SunriseClient_system_handleInv) then {		
		hint format [localize "STR_CRAFT_Process",_newItemName];
	} else {
		hint format ["Не удалось добавить %1",_newItemName];
	};
} else {	
	private _newItemName = ([_itemFinal] call SunriseClient_system_itemDetails) select 1;
	for "_x" from 1 to _editBox do {
		if !([_itemFinal] call SunriseClient_system_addItem) then {
			hint format ["Не удалось добавить %1",_newItemName];
		} else {
			hint format [localize "STR_CRAFT_Process",_newItemName];
		};
	};
};

[] call SunriseClient_system_saveGear;

[nil,(GVAR_UINS["Crafting_Menu_Filter",0])] call SunriseClient_crafting_UpdateFilter;