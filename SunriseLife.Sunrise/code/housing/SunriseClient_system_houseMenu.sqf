/*

	Filename: 	SunriseClient_system_houseMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_curTarget",ObjNull,[ObjNull]],
	["_message","",[""]]
];
if (isNull _curTarget) exitWith {}; //Bad target
if (life_medDuty) exitWith {};
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_pInact_curTarget = _curTarget;


switch (true) do { 
	case (life_copDuty) : {
		INIT_BUTTON(1,37402,localize "STR_House_Raid_Owner","[life_pInact_curTarget] call SunriseClient_system_copHouseOwner;");
		INIT_BUTTON(2,37403,localize "STR_pInAct_BreakDown","[life_pInact_curTarget] spawn SunriseClient_system_copBreakDoor; closeDialog 0;");
	
		private _door = [_curTarget] call SunriseClient_system_nearestDoor;
		if (EQUAL(_door,0)) then {_b2 ctrlEnable false};
	
		INIT_BUTTON(5,37406,"Обыск ресурсов","[life_pInact_curTarget] spawn SunriseClient_system_raidHouse; closeDialog 0;");	
		
		INIT_BUTTON(6,37409,"Обыск снаряги","[life_pInact_curTarget] spawn SunriseClient_system_raidHouseWeapon; closeDialog 0;");
		
		if (_curTarget GVAR ["locked",false]) then {
			INIT_BUTTON(4,37405,localize "STR_pInAct_UnlockStorage","[life_pInact_curTarget] call SunriseClient_system_lockHouse; closeDialog 0;");
			_b5 ctrlEnable false;
			_b6 ctrlEnable false;
		} else {
			INIT_BUTTON(4,37405,localize "STR_pInAct_LockStorage","[life_pInact_curTarget] call SunriseClient_system_lockHouse; closeDialog 0;");
		};

		if !(_curTarget in life_vehicles) then {_b4 ctrlEnable false; _b5 ctrlEnable false; _b6 ctrlEnable false;}
	}; 	
	default { 
		if (!(_curTarget in (life_vehicles + life_tempHouses)) OR isNil {_curTarget GVAR "house_owner"}) then {
			if (_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget]};
			if (_curTarget in life_tempHouses) then {life_tempHouses = life_tempHouses - [_curTarget]};
			
			INIT_BUTTON(1,37402,localize "STR_pInAct_BuyHouse","[life_pInact_curTarget] spawn SunriseClient_system_buyHouse;");
			
			if (!isNil {_curTarget GVAR "house_owner"}) then {
				_b1 ctrlEnable false;
			};
		} else {
			private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _curTarget,"numberCrates");
			if (EQUAL(_numberCrates,0)) then {
				INIT_BUTTON(1,37402,localize "STR_pInAct_SellGarage","closeDialog 0; [life_pInact_curTarget] spawn SunriseClient_system_sellHouse;");
				
				if (((_curTarget GVAR "house_owner") select 0) != (steamid)) then {
					_b1 ctrlEnable false;
				};
				private _garageAction = "closeDialog 0; [life_pInact_curTarget,""Car""] spawn SunriseClient_garage_HouseMenu;";
				INIT_BUTTON(2,37403,localize "STR_pInAct_AccessGarage",_garageAction);
				INIT_BUTTON(3,37404,localize "STR_pInAct_StoreVeh","closeDialog 0; [true] spawn SunriseClient_system_storeVehicleMenu;");
			} else {
				INIT_BUTTON(1,37402,localize "STR_pInAct_SellHouse","closeDialog 0; [life_pInact_curTarget] spawn SunriseClient_system_sellHouse;");
	
				if (isNull (_curTarget GVAR ["lightSource",ObjNull])) then {
					INIT_BUTTON(2,37403,localize "STR_pInAct_LightsOn","[life_pInact_curTarget] call SunriseClient_system_lightHouseAction; closeDialog 0;");
				} else {
					INIT_BUTTON(2,37403,localize "STR_pInAct_LightsOff","[life_pInact_curTarget] call SunriseClient_system_lightHouseAction; closeDialog 0;");
				};
	
				INIT_BUTTON(4,37405,"Добавить слот","closeDialog 0; [life_pInact_curTarget] spawn SunriseClient_system_houseModAddSlot");	
				
				_house_box = _curTarget GVAR["house_box",objNull];
				if (!isNull _house_box) then {
					_house_box_slots = _house_box GVAR ["house_box_slots",0];		
					if (_house_box_slots < _numberCrates) then {
						_b4 ctrlEnable true;
					} else {
						_b4 ctrlEnable false;
					};
				} else {_b4 ctrlEnable false;};
	
				if (((_curTarget GVAR "house_owner") select 0) != (steamid)) then {
					_b1 ctrlEnable false; _b4 ctrlEnable false;
				};
	
				if (_curTarget GVAR ["locked",false]) then {
					INIT_BUTTON(5,37406,localize "STR_pInAct_UnlockStorage","[life_pInact_curTarget] call SunriseClient_system_lockHouse; closeDialog 0;");
				} else {
					INIT_BUTTON(5,37406,localize "STR_pInAct_LockStorage","[life_pInact_curTarget] call SunriseClient_system_lockHouse; closeDialog 0;");
				};
	
				private _canGarage = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _curTarget,"canGarage");
				if (EQUAL(_canGarage,1)) then {
					private _garageAction = "closeDialog 0; [life_pInact_curTarget,""Car""] spawn SunriseClient_garage_HouseMenu;";
					INIT_BUTTON(6,37409,localize "STR_pInAct_AccessGarage",_garageAction);
					INIT_BUTTON(7,37410,localize "STR_pInAct_StoreVeh","closeDialog 0; [true] spawn SunriseClient_system_storeVehicleMenu;");
				};
	
				if !(_curTarget in (life_vehicles + life_tempHouses)) then {
					_b2 ctrlEnable false;
					_b5 ctrlEnable false;
					_b6 ctrlEnable false;
					_b7 ctrlEnable false;
				};
			};
		};
	}; 
};

if !(EQUAL(_message,"")) then {
	//systemChat format ["%1",_message];
	["info","",format ["%1",_message],true] call SunriseClient_message;
};