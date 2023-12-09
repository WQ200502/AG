/*

	Filename: 	SunriseClient_admin_mode.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

private _mode = param [0,false,[false]];
life_admin_mode = _mode;

switch (life_admin_mode) do {
	case true: {
		if (count life_admin_actions > 0) exitWith {};
		// сесть в машину на водителя
		life_admin_actions pushBack (player addAction [
			"<t color='#ff0000'>Сесть за водителя</t>",
			SunriseClient_system_copEnter,"driver",-6,false,false,"",
			'!isNull cursorTarget && {((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship"))} && {(locked cursorTarget) != 0}'
		]);

		// сесть в машину на пассажира
		life_admin_actions pushBack (player addAction [
			"<t color='#ff0000'>Сесть за пассажира</t>",
			SunriseClient_system_copEnter,"passenger",-6,false,false,"",
			'!isNull cursorTarget && {((cursorTarget isKindOf "LandVehicle")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship"))} && {(locked cursorTarget) != 0}'
		]);

		// Выйти их техники
		life_admin_actions pushBack (player addAction [
			"<t color='#ff0000'>Выйти</t>",
			SunriseClient_system_copEnter,"exit",-6,false,false,"",
			'!(isNull objectParent player) && (locked(vehicle player)==2)'
		]);

		// god mode action
		life_admin_actions pushBack (player addAction [
			format["<t color='#ff0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_%1_ca.paa'/>Режим бессмертия</t>", ["on","off"] select (isDamageAllowed player)], { 
			if (isDamageAllowed player) then { 
				player setUserActionText [_this#2, "<t color='#00FF00'><img image='\A3\ui_f\data\igui\cfg\actions\ico_on_ca.paa'/>Режим бессмертия</t>"];
				player allowDamage false;
				player enableFatigue false;
			} else {
				player setUserActionText [_this#2, "<t color='#FF0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_off_ca.paa'/>Режим бессмертия</t>"];
				player allowDamage true;
				player enableFatigue true;
			};
		}, "", -6, false, false, "", "life_admin_mode"]);
		
		// еда\вода
		life_admin_actions pushBack (player addAction [
			format["<t color='#ff0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_%1_ca.paa'/>Сытость</t>", ["on","off"] select (isNil "admin_hunger_handler")], { 
			if (isNil "admin_hunger_handler") then { 
				player setUserActionText [_this#2, "<t color='#00FF00'><img image='\A3\ui_f\data\igui\cfg\actions\ico_on_ca.paa'/>Сытость</t>"];
				admin_hunger_handler = [] spawn {life_hunger = 100; life_thirst = 100; uiSleep 100};
			} else {
				player setUserActionText [_this#2, "<t color='#FF0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_off_ca.paa'/>Сытость</t>"];
				terminate admin_hunger_handler;
				admin_hunger_handler = nil;
			};
		}, "", -6, false, false, "", "life_admin_mode"]);

		// add vehicle to life_vehicles
		life_admin_actions pushBack (player addAction [
			"<t color='#ff0000'>Взять ключи от машины</t>",
			{
				if !(isNull objectParent player) then {life_vehicles pushBack objectParent player} else {
					if !(isNull cursorTarget) then {
						life_vehicles pushBack cursorTarget;
					};
				};
			},
			"", -6, false, false, "",
			"life_admin_mode"
		]);

		// restore object action
		life_admin_actions pushBack (player addAction [
			"<t color='#ff0000'>Починить объект</t>",
			{
				if (vehicle player != player) then {
					(vehicle player) setDamage 0;
				} else {
					if !(isNull cursorTarget) then {
						cursorTarget setDamage 0;
					};
				};
			},
			"", -6, false, false, "",
			"life_admin_mode"
		]);

		// delete object action
		life_admin_actions pushBack (player addAction [
			"<t color='#ff0000'>Удалить объект</t>",
			{ if (!(isNull cursorTarget) && !(isPlayer cursorTarget)) then { deleteVehicle cursorTarget; } },
			"", -6, false, false, "",
			"life_admin_mode"
		]);

		//invisibility 
		life_admin_actions pushBack (player addAction [format["<t color='#ff0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_%1_ca.paa'/>Невидимость</t>", ["off","on"] select ((uniform player) isEqualTo "U_VirtualMan_F")], {
			if ((uniform player) isEqualTo "U_VirtualMan_F") then {
				if !((count life_admin_uniform) isEqualTo 3) exitWith { life_admin_uniform = []; };
				if ((life_admin_uniform select 0) isEqualTo "") exitWith { life_admin_uniform = []; };
				player setUserActionText [_this#2, "<t color='#FF0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_off_ca.paa'/>Невидимость</t>"];
				player hideObject false;
				removeUniform player;
				player forceAddUniform (life_admin_uniform select 0);
				{
					player addItemToUniform _x;
				} forEach (life_admin_uniform select 1);
				removeHeadgear player;
				player addHeadgear (life_admin_uniform select 2);
				life_admin_uniform = [];
			} else {
				player hideObject true;
				player setUserActionText [_this#2, "<t color='#00FF00'><img image='\A3\ui_f\data\igui\cfg\actions\ico_on_ca.paa'/>Невидимость</t>"];
				life_admin_uniform = [uniform player,uniformItems player,headgear player];
				removeUniform player;
				removeHeadgear player;
				player forceAddUniform "U_VirtualMan_F";
				player addHeadgear "H_HelmetO_ViperSP_ghex_F";
			};
		}, "", -6, false, false, "", "life_admin_mode"]);

		// players nicknames
		life_admin_actions pushBack (player addAction [
			format["<t color='#ff0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_%1_ca.paa'/>WallHack</t>", ["off","on"] select life_admin_wh], { 
			if (life_admin_wh) then { 
				life_admin_wh = false;
				player setUserActionText [_this#2, "<t color='#FF0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_off_ca.paa'/>WallHack</t>"];
				["playersNames", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;				
			} else {
				player setUserActionText [_this#2, "<t color='#00FF00'><img image='\A3\ui_f\data\igui\cfg\actions\ico_on_ca.paa'/>WallHack</t>"];
				life_admin_wh = true;
				["playersNames", "onEachFrame", {
					if (!isNull cameraOn) then {
						{
							if (isPlayer _x) then {
								_shown = [];
								if ((crew(vehicle cameraOn)) isEqualTo(crew cameraOn)) then {
									_shown = [vehicle cameraOn];
								};
				
								_veh = vehicle _x;
								_id = _shown pushBackUnique _veh;
								if !(_id isEqualTo - 1) then {
									_distance = round(cameraOn distance _x);
									_fontSize = 0.03;
									_IconSize = 0.5;
									_alpha = 1;
									if (_veh isKindOf 'Man') then {
										_curwep = currentWeapon _x;
										_hp = round((damage _x - 1) * -100);
										_txt = format['%1 - %2м - %3HP ', _x getVariable ["realname","Имени нет"], _distance,_hp];
				
										_pos = _x modelToWorldVisual(_x selectionPosition 'head');
				
										if (_curwep != '') then {
											_txt = _txt + format[
												'%1 - [%2/%3]',
												gettext(configFile >> 'CfgWeapons' >> _curwep >> 'displayName'),
												_x ammo _curwep,
												getNumber(configFile >> 'CfgMagazines' >> currentMagazine _x >> 'count')
											];
										};
				
										_color = switch(true) do { 
											case (_x getVariable ["copDuty",false]): {[0,0.588,1,1]}; 
											case (_x getVariable ["medDuty",false]): {[1,0,0,1]}; 
											default {[0.902,0.553,1,1]}; 
										};
										_dir = [_x, cameraOn] call BIS_fnc_relativeDirTo;
				
										drawIcon3D['iconManMedic', _color, _pos, _IconSize, _IconSize,_dir + 180, _txt, 1, _fontSize, 'PuristaBold'];
									} else {
										_class = typeOf _veh;
										_pos = _x modelToWorldVisual[0, 0, 0];
										_crew = crew _veh;
										_cnt = count _crew;
										_color = switch(_x getVariable ["tf_side",sideUnknown]) do { 
											case (west): {[0,0.588,1,1]}; 
											case (east): {[1,0,0,1]}; 
											default {[0.902,0.553,1,1]}; 
										};   
										drawIcon3D['\A3\ui_f\data\map\Markers\Military\dot_ca.paa', _color, _pos, _IconSize, _IconSize, 0, '', 1];
										_pos = _x modelToWorldVisual[0, 0, 3];
				
										if (_cnt > 0) then {
											_num = _cnt * -1;
											{
												_height = _num + _forEachIndex;
												_role = assignedVehicleRole _x;
												if (_role isEqualTo []) then {
													_role = 'Пассажир';
												} else {
													_role = _role select 0;
												};
												_txt = format['%1 - %2 %3HP', _role, _x getVariable ["realname","Имени нет"], round((1 - (damage _x)) * 100)];
												_color = switch(true) do { 
													case (_x getVariable ["copDuty",false]): {[0,0.588,1,1]}; 
													case (_x getVariable ["medDuty",false]): {[1,0,0,1]}; 
													default {[0.902,0.553,1,1]}; 
												};
												drawIcon3D['', _color, _pos, .5, _height * 0.8, 0, _txt, 1, _fontSize, 'PuristaBold'];
											} forEach _crew;
										};
				
										_fuel = fuel _veh;
										_fuelCapacity = getNumber(configFile >> 'CfgVehicles' >> _class >> 'fuelCapacity');
										_realFuel = _fuelCapacity * _fuel;
				
										_txt = format['%1 - %2л. - %3/%4км/ч - %5м', gettext(configFile >> 'CfgVehicles' >> _class >> 'displayName'), round(_realFuel * 100) / 100, round(speed _veh), getNumber(configFile >> 'CfgVehicles' >> _class >> 'maxSpeed'), _distance];
										drawIcon3D['', _color, _pos, .5, 0, 0, _txt, 1, _fontSize, 'PuristaBold'];
									};
								};
							};
						} forEach((cameraOn nearEntities[['Man', 'LandVehicle', 'Ship', 'Air'], 1800]) - [cameraOn, vehicle cameraOn]);
					};
				}] call BIS_fnc_addStackedEventHandler;
			};
		}, "", -6, false, false, "", "life_admin_mode"]);
		

		// players nicknames
		life_admin_actions pushBack (player addAction [
			format["<t color='#ff0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_%1_ca.paa'/>Маркеры на карте</t>", ["on","off"] select isNil "am_admin_drawMapMarkersEVHID"], { 
			if (isNil "am_admin_drawMapMarkersEVHID") then { 
				player setUserActionText [_this#2, "<t color='#00FF00'><img image='\A3\ui_f\data\igui\cfg\actions\ico_on_ca.paa'/>Маркеры на карте</t>"];
				am_admin_drawMapMarkersEVHID = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", {
					if (!life_admin_mode || !visibleMap) exitWith {(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", am_admin_drawMapMarkersEVHID]};
					_iscale = ((1 - ctrlMapScale (findDisplay 12 displayCtrl 51)) max .2) * 28;
					_shown = [];
					{
						_veh = vehicle _x;
						if !(_veh in _shown) then {
							_shown pushBack _veh;
		
							_color = [0,0,0,0];
							_txt = "";
							if (_x isEqualTo _veh) then {
								_lifeState = _x getVariable["lifeState", ""];
								_state = switch (true) do { 
									case (_lifeState isEqualTo "INCAPACITATED"): {"[АГОНИЯ]"};
									case (_lifeState isEqualTo "DEAD"): {"[МЕРТВ]"};
									case (_lifeState isEqualTo "RESPAWN"): {"[РЕСПАВН]"};
									case (_x getVariable["restrained", false]): {"[НАРУЧНИКИ]"};
									default {""}; 
								};
								_txt = format['%1%2 (%3m) %4HP',_state,_x getVariable ["realname",name _x],round(_veh distance player),round((1 - (damage _x)) * 100)];
								_color = switch(true) do { 
									case (_x getVariable ["copDuty",false]): {[0,0.588,1,1]}; 
									case (_x getVariable ["medDuty",false]): {[1,0,0,1]}; 
									default {[0.902,0.553,1,1]}; 
								};
		
							} else {
								_names = '';
								{
									if(_forEachIndex == 0) then {_names = _names + format['%1',_x getVariable['realName',name _x]]} else {_names = _names + format[', %1',_x getVariable['realName',name _x]]};
								} forEach (crew _veh);
								_txt = format['%1 - %2 (%3m)',_names,gettext (configFile >> 'CfgVehicles' >> typeOf _veh >> 'displayName'),round(_veh distance player)];
								_color = switch(_x getVariable ["tf_side",sideUnknown]) do { 
									case (west): {[0,0.588,1,1]}; 
									case (east): {[1,0,0,1]}; 
									default {[0.902,0.553,1,1]}; 
								};
							};
							(findDisplay 12 displayCtrl 51) drawIcon [getText(configFile >> 'CfgVehicles' >> typeof _veh >> 'icon'), _color, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
						};
					} forEach (allPlayers - [player]);
				}];		
			} else {
				player setUserActionText [_this#2, "<t color='#FF0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_off_ca.paa'/>Маркеры на карте</t>"];
				(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", am_admin_drawMapMarkersEVHID];
				am_admin_drawMapMarkersEVHID = nil;
			};
		}, "", -6, false, false, "", "life_admin_mode"]);
		
		//mapclick teleport
		life_admin_actions pushBack (player addAction [
			format["<t color='#ff0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_%1_ca.paa'/>Телепорт на карте</t>", ["on","off"] select isNil "admin_mapClickTeleport"], { 
			if (isNil "admin_mapClickTeleport") then { 
				player setUserActionText [_this#2, "<t color='#00FF00'><img image='\A3\ui_f\data\igui\cfg\actions\ico_on_ca.paa'/>Телепорт на карте</t>"];
				admin_mapClickTeleport = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", {
					params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
					if (_alt) then {
						_pos = (_control posScreenToWorld [_xPos, _yPos]);
						_veh = vehicle player;
						if(_veh == player)then {
							_veh setPosATL _pos;
						} else {
							if (_veh isKindOf 'AIR') then {
								_posObj = getPosATL _veh;
								_pos = [_pos select 0,_pos select 1,_posObj select 2];
							};
							(_veh) allowDamage false;
							(_veh) SetVelocity [0,0,1];
							(_veh) setPosATL _pos;
							(_veh) allowDamage true;				
						};
					};
				}];
			} else {
				player setUserActionText [_this#2, "<t color='#FF0000'><img image='\A3\ui_f\data\igui\cfg\actions\ico_off_ca.paa'/>Телепорт на карте</t>"];
				(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["MouseButtonDown", admin_mapClickTeleport];
				admin_mapClickTeleport = nil;
			};
		}, "", -6, false, false, "", "life_admin_mode"]);

		
		["Режим администратора включен","done"] call SunriseClient_gui_bottomNotification;
	};
	case false: {
		{player removeAction _x} forEach life_admin_actions;
		life_admin_actions = [];
		["Режим администратора отключен","done"] call SunriseClient_gui_bottomNotification;
	};
};
