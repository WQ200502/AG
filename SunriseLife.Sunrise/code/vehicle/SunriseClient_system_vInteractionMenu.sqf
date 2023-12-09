/*
	
	Filename: 	SunriseClient_system_vInteractionMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if !([_curTarget] call SunriseClient_system_isVehicleKind) exitWith {};
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_vInact_curTarget = _curTarget;

//Set Repair Action
INIT_BUTTON(1,37402,localize "STR_vInAct_Repair","[life_vInact_curTarget] spawn SunriseClient_system_repairTruck; closeDialog 0;");
if ("srl_ItemRepairKit" in (items player) && (damage _curTarget < 1)) then {_b1 ctrlEnable true} else {_b1 ctrlEnable false};

INIT_BUTTON(2,37403,localize "STR_vInAct_Registration","[life_vInact_curTarget] spawn SunriseClient_system_searchVehAction; closeDialog 0;");
if (_curTarget isKindOf "Ship") then {
	INIT_BUTTON(3,37404,localize "STR_vInAct_PushBoat","[] spawn SunriseClient_system_pushObject; closeDialog 0;");
	if (_curTarget isKindOf "Ship" && {local _curTarget} && {EQUAL(crew _curTarget,[])}) then {_b3 ctrlEnable true} else {_b3 ctrlEnable false};
} else {
	if (typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
		INIT_BUTTON(3,37404,localize "STR_vInAct_GetInKart","player moveInDriver life_vInact_curTarget; closeDialog 0;");
		if (EQUAL(crew _curTarget,[]) && {canMove _curTarget} && {EQUAL(locked _curTarget,0)}) then {_b3 ctrlEnable true} else {_b3 ctrlEnable false};
	} else {
		private _flipAction = "if (isNull driver life_vInact_curTarget) then {life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5];} else {['Машина должна быть без водителя','error'] call SunriseClient_gui_bottomNotification};closeDialog 0;";
	};
};
INIT_BUTTON(4,37405,localize "STR_vInAct_PullOut","[life_vInact_curTarget] spawn SunriseClient_system_pulloutAction; closeDialog 0;");
INIT_BUTTON(5,37406,localize "STR_vInAct_Unflip","life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;");
if (EQUAL(crew _curTarget,[])) then {_b3 ctrlEnable true} else {_b3 ctrlEnable false};
switch (true) do { 
	case (life_copDuty) : {
		if (EQUAL(crew _curTarget,[])) then {_b4 ctrlEnable false};

		INIT_BUTTON(5,37406,localize "STR_vInAct_SearchVehicle","[life_vInact_curTarget] spawn SunriseClient_system_vehInvSearch;");
		INIT_BUTTON(6,37409,localize "STR_vInAct_Impound","[life_vInact_curTarget] spawn SunriseClient_system_impoundAction; closeDialog 0;");
		INIT_BUTTON(7,37410,localize "STR_vInAct_ImpoundParking","[life_vInact_curTarget] spawn SunriseClient_parking_CopMenu;");
		INIT_BUTTON(8,37411,"Уничтожить", "[life_vInact_curTarget] spawn SunriseClient_vehicles_destroyAction; closeDialog 0;");
		INIT_BUTTON(9,37412,"Взломать", "[life_vInact_curTarget] spawn SunriseClient_system_lockpickCop; closeDialog 0;");
		if (life_coplevel < 6 OR {!([player] call SunriseClient_system_checkForSearch)}) then {_b8 ctrlEnable false};
	}; 
	case (life_medDuty) : {
		if (EQUAL(crew _curTarget,[])) then {_b4 ctrlEnable false};
		
		INIT_BUTTON(5,37406,localize "STR_vInAct_Impound","[life_vInact_curTarget] spawn SunriseClient_system_impoundAction; closeDialog 0;");			
		INIT_BUTTON(6,37409,"Модификации","closeDialog 0; [life_vInact_curTarget] spawn SunriseClient_adac_Menu;");
		INIT_BUTTON(7,37410,"Вытащить трупы","closeDialog 0; [life_vInact_curTarget] spawn SunriseClient_system_deadMoveOut;");
		INIT_BUTTON(8,37411,"Взломать", "[life_vInact_curTarget] spawn SunriseClient_system_lockpickCop; closeDialog 0;");
	}; 
	default {
		if ((_curTarget in life_vehicles) OR (!(canMove _curTarget)) OR !(EQUAL(crew _curTarget,[])) && (_curTarget getHitPointDamage "HitLFWheel" > 0.65) && (_curTarget getHitPointDamage "HitRFWheel" > 0.65)) then {_b4 ctrlEnable true} else {_b4 ctrlEnable false};
		if (("srl_lockpick" in (magazines player)) && !(_curTarget in life_vehicles)) then {INIT_BUTTON(5,37406,"Взломать технику","[life_vInact_curTarget] spawn SunriseClient_system_lockpick; closeDialog 0;");};		
	};
	
	if (typeOf (_curTarget) in ["Freeman_UralNext"]) then {
		INIT_BUTTON(3,37404,localize "STR_vInAct_DeviceMine","[life_vInact_curTarget] spawn SunriseClient_system_deviceMineUral; closeDialog 0;");
		if (!isNil {(_curTarget GVAR "mining")} && !(_curTarget in life_vehicles)) then {_b4 ctrlEnable false} else {_b4 ctrlEnable true};
	} else {
		INIT_BUTTON(3,37404,localize "STR_vInAct_PullOut","[life_vInact_curTarget] spawn SunriseClient_actions_pulloutAction; closeDialog 0;");
		if ((_curTarget in life_vehicles) OR (!(canMove _curTarget)) OR !(EQUAL(crew _curTarget,[])) && (_curTarget getHitPointDamage "HitLFWheel" > 0.65) && (_curTarget getHitPointDamage "HitRFWheel" > 0.65)) then {_b4 ctrlEnable true} else {_b4 ctrlEnable false}
	};
};