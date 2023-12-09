#include "..\..\script_macros.hpp"
/*

	Filename: 	fn_hudWeaponUpdate.sqf
	Project: 	AmazingLife - RPG
	Author:		AmazingTeam
	E-mail:		dev@amazingrp.ru
	Web:		http://amazingrp.ru/

*/
disableSerialization;
private _ui = GVAR_UINS ["playerHUD",displayNull];
if (isNull _ui) exitWith {};

private _getControl = {
	params ["_key"];
	private _ctrl = controlNull;
	private _index = ((_ui getVariable "map") find _key) + 10000;
	if (_index != -1) then {
		_ctrl = _ui displayCtrl _index;
	};
	_ctrl;
};

for "_i" from 0 to 8 do {
	_color = [0,0,0,0.4];
	_type_name = "";
	_item = "";
	_picture = "";

	switch (true) do {
		case (_i isEqualTo 0): {
			if !((primaryWeapon player) isEqualTo "") then {
				_type_name = "inventory";
				_item = (primaryWeapon player);
				if ((currentWeapon player) isEqualTo (primaryWeapon player)) then {_color = [0.165,0.42,0.18,0.4]};
			};
		};
		case (_i isEqualTo 1): {
			if !((secondaryWeapon player) isEqualTo "") then {
				_type_name = "inventory";
				_item = (secondaryWeapon player);
				if ((currentWeapon player) isEqualTo (secondaryWeapon player)) then {_color = [0.165,0.42,0.18,0.4]};
			};
		};
		case (_i isEqualTo 2): {
			if !((handgunWeapon player) isEqualTo "") then {
				_type_name = "inventory";
				_item = (handgunWeapon player);
				if ((currentWeapon player) isEqualTo (handgunWeapon player)) then {_color = [0.165,0.42,0.18,0.4]};
			};
		};
		default {
			_type_name = (bind_number_array select (_i - 3)) select 0;
			_item = (bind_number_array select (_i - 3)) select 1;
		};
	};
	
	if !(_type_name isEqualTo "") then {
		switch (_type_name) do {
			case "inventory": {
				_itemInfo = [_item] call SunriseClient_fast_fetchcfgdetails;
				_picture = format ["%1",_itemInfo select 2];
	
				if (_i >= 3) then {
					if !(life_saveBind) then {
						switch (true) do {
							case (_item in ["srl_TacticalBacon_100","srl_TacticalBacon_75","srl_TacticalBacon_50","srl_TacticalBacon_25"]): {
								{
									if (_x in (magazines player)) then {
										_item = _x;
									};
								} forEach ["srl_TacticalBacon_100","srl_TacticalBacon_75","srl_TacticalBacon_50","srl_TacticalBacon_25"];
							};
							case (_item in ["srl_BakedBeans_100","srl_BakedBeans_75","srl_BakedBeans_50","srl_BakedBeans_25"]): {
								{
									if (_x in (magazines player)) then {
										_item = _x;
									};
								} forEach ["srl_BakedBeans_100","srl_BakedBeans_75","srl_BakedBeans_50","srl_BakedBeans_25"];
							};
							case (_item in ["srl_cereal","srl_cereal_50"]): {
								{
									if (_x in (magazines player)) then {
										_item = _x;
									};
								} forEach ["srl_cereal","srl_cereal_50"];
							};
							case (_item in ["srl_canteen_clean_3","srl_canteen_clean_2","srl_canteen_clean_1"]): {
								{
									if (_x in (magazines player)) then {
										_item = _x;
									};
								} forEach ["srl_canteen_clean_3","srl_canteen_clean_2","srl_canteen_clean_1"];
							};
							case (_item in ["srl_bottleclean_100","srl_bottleclean_50"]): {
								{
									if (_x in (magazines player)) then {
										_item = _x;
									};
								} forEach ["srl_bottleclean_100","srl_bottleclean_50"];
							};
							default { };
						};
						
						if !(_item in (magazines player)) then {
							bind_number_array set [(_i - 3),["",""]];
							_picture = "";
						};
						
					};
				};
			};
			case "gesture": {
				_picture = LIFE_SETTINGS(getText,"MFMpictureGesture");
			};
			case "dance": {
				_picture = LIFE_SETTINGS(getText,"MFMpictureDance");
			};
			case "pose": {
				_picture = LIFE_SETTINGS(getText,"MFMpicturePose");
			};
			default {
				/* code */
			};
		};
	};

	_ctrlBg = ("main_button_bg_" + str _i) call _getControl;
	_ctrlPicture = ("main_button_pic_" + str _i) call _getControl;

	_ctrlBg ctrlSetBackgroundColor _color;
	_ctrlPicture ctrlSetText _picture;
};
