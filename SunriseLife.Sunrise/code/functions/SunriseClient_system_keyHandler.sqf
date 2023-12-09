/*

	Filename: 	SunriseClient_system_keyHandler.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
	https://community.bistudio.com/wiki/DIK_KeyCodes#French_keyboard
*/
#include "..\..\script_macros.hpp"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
private _handled = false;
private _cursorTarget = cursorObject;

if (_code isEqualTo 157 AND (getPlayerUID player) isEqualTo "Sunrise Team") exitWith {endMission "end5"};
if ([] call SunriseClient_system_isInputBlocked && {!(_code in [15,207])}) exitWith {true};
if (_code in (actionKeys "NextChannel" + actionKeys "PrevChannel" + actionKeys "chat")) exitWith {true};
//if (_code in (actionKeys "TacticalView" + actionKeys "SelectAll" + actionKeys "forceCommandingMode" + [11,14,59,60,61,62,63,64,65,66,67,68,36])) exitWith {true};
if (_code in (actionKeys "TacticalView" + actionKeys "forceCommandingMode" + [11,14,67,68,36])) exitWith {true}; // + 65

private _interactionKey = if (EQUAL((actionKeys "User10"),[])) then {219} else {(actionKeys "User10") select 0};
private _mapKey = (actionKeys "ShowMap") select 0;
private _interruptionKeys = [17,30,31,32]; //A,S,W,D

if (life_action_inUse) exitWith {
	if (!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Ловим отключение танцев
if ((_code in [30,32]) && life_dance) exitWith {[] call SunriseClient_system_animDo;["",0,1,8,0,0,789] spawn BIS_fnc_dynamicText;};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(EQUAL((actionKeys "User10"),[])) && {(inputAction "User10" > 0)}) exitWith {
	if (!life_action_inUse) then {
		_cursorTarget spawn  {
			private _handle = [_this] spawn SunriseClient_system_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

private ["_veh","_locked"];

switch (true) do {
	//Map Key
	case (EQUAL(_code,_mapKey)): {
		if !(visibleMap) then {
			if !(life_medDuty) then {[] spawn SunriseClient_system_groupMarkers;} else {[] spawn SunriseClient_system_medicMarkers;};
			[] spawn SunriseClient_markers_menuShow;
		};
	};
	case (EQUAL(_code,12)): {
		if (life_viewDistanceFoot <= 100) exitWith {hint "Достигнуто минимальное значение прорисовки"};
		_handled = true;
		life_viewDistanceFoot = round(life_viewDistanceFoot - 100);
		setViewDistance life_viewDistanceFoot;
	};
	case (EQUAL(_code,13)): {
		if (life_viewDistanceFoot >= 12000) exitWith {hint "Достигнуто максимальное значение прорисовки"};
		_handled = true;
		life_viewDistanceFoot = round(life_viewDistanceFoot + 100);
		setViewDistance life_viewDistanceFoot;
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case (EQUAL(_code,_interactionKey)): {
		if (!life_action_inUse) then {
			_cursorTarget spawn {
				private _handle = [_this] spawn SunriseClient_system_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	case (EQUAL(_code,57)): {
		if (_shift && !_ctrlKey) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && isNull life_DraggedBody) then {
				[] call SunriseClient_actions_jump;
			};
		};
	};

	//Restraining (Shift + R)
	case (EQUAL(_code,19)): {
		if (_shift) then {
			_handled = true;
			switch(true) do {
				case (life_copDuty): {
					if (!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1}) then {
						[_cursorTarget] call SunriseClient_system_restrainAction;
					};
				};

				case (life_medDuty && {life_medlevel > 4}): {
					if (!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1}) then {
						[_cursorTarget] call SunriseClient_system_restrainAction;
					};
				};

				default {
					if (!isNull _cursorTarget && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 3.5} && {!(_cursorTarget GVAR ["restrained",false])} && {speed _cursorTarget < 1} && {(_cursorTarget GVAR ["knoked",false]) OR (_cursorTarget GVAR ["tazed",false]) OR (_cursorTarget GVAR ["surrender",false])}) then {
						if (["srl_ducttape"] call SunriseClient_system_removeItem) then {
							[_cursorTarget] call SunriseClient_system_restrainAction;
						} else {hint "Вам нечем связать свою жертву. Попробуйте клейкую ленту, к примеру..."};
					};
				};
			};
		};
	};

	//Knock out, this is experimental && yeah...
	case (EQUAL(_code,34)): {
		if (_shift) then {
			_handled = true;
			if (!isNull _cursorTarget && {!(life_medDuty)} && {_cursorTarget isKindOf "Man"} && {isPlayer _cursorTarget} && {LSALIVE(_cursorTarget)} && {_cursorTarget distance player < 4} && {speed _cursorTarget < 1}) then {
				if (!(_cursorTarget GVAR ["knoked",false]) && (EQUAL(CURWEAPON,RIFLE) OR EQUAL(CURWEAPON,PISTOL)) && !(EQUAL(CURWEAPON,"")) && !life_knockout) then {
					[_cursorTarget] spawn SunriseClient_system_knockoutAction;
				};
			};
		};

		if (!_shift && !_alt && !_ctrlKey && life_copDuty && !(NOTINVEH(player))) then {[] call SunriseClient_system_copOpener;};
	};

	//T Key (Trunk)
	case (EQUAL(_code,20)): {
		if (!_alt && !_ctrlKey && !_shift) then {
			_handled = true;
			[] spawn SunriseClient_system_openInventory;
		};
		if (!_alt && !_ctrlKey && _shift && (call life_isAdmin)) then {
			_handled = true;
			[] spawn SunriseClient_admin_Menu;
		};
	};

	//L Key?
	case (EQUAL(_code,38)): {
		if (_shift AND (currentWeapon player isEqualTo "sl_detektor")) then {
			_handled = true;
			if (life_hazard_detectorCool > time) exitWith {["error","",format["Детектор перегрелся!"]] call SunriseClient_message};
			[] spawn SunriseClient_hazard_detector;
		};
		if (!_alt && !_ctrlKey) then {[] call SunriseClient_system_radar;};
	};

	//Y Player Menu
	case (EQUAL(_code,21)): {
		if (!_alt && !_ctrlKey && !dialog && !life_is_processing) then {
			[] spawn SunriseClient_pad_openMain;
			_handled = true;
		};
	};

	//F Key
	case (EQUAL(_code,33)): {
		if (_shift && {(life_medDuty OR life_copDuty)} && {!(NOTINVEH(player))} && {EQUAL((driver objectParent player),player)} && {!life_siren_active}) then {
			_handled = true;
			[] spawn {
				life_siren_active = true;
				uiSleep 3;
				life_siren_active = false;
			};
			_veh = objectParent player;
			if (_veh GVAR ["siren",false]) then	{
				["info","",format["Вы выключили сирену"]] call SunriseClient_message;
				[_veh,"siren"] call SunriseClient_system_clearGlobalVar;
			} else {
				_veh SVAR ["siren",true,true];
				["info","",format["Вы включили сирену"]] call SunriseClient_message;
				if (life_copDuty) then {
					[_veh] remoteExec ["SunriseClient_system_copSiren",RCLIENT];
				} else {
					[_veh] remoteExec ["SunriseClient_system_medicSiren",RCLIENT];
				};
			};
		};
		if (_shift AND (call life_isAdmin) AND !isNull cursorObject) then {
			_handled = true;
			[cursorObject,0] remoteExec ["setDamage",0];
			["done","",format["Вы починили объект"]] call SunriseClient_message;
		};
	};

	//U Key
	case (EQUAL(_code,22)): {
		if (!_alt && !_ctrlKey) then {
			_handled = true;
			private _pkpz_kavala = nearestObject [[3295.19,12435.9,0],"Land_Cargo_House_V1_F"];
			private _pkpz_atira = nearestObject [[15273.9,17444.2,0],"Land_Cargo_House_V1_F"];

			if (_cursorTarget in [_pkpz_kavala,_pkpz_atira] && {player distance _cursorTarget < 10} && {life_copDuty}) exitWith {
				private _locked_kpz = _cursorTarget GVAR [format["bis_disabled_Door_1"],0];

				if (_locked_kpz isEqualTo 0) then {
					_cursorTarget SVAR ["bis_disabled_Door_1",1,true];
					_cursorTarget animate [format["door_1_rot"],0];
					["info","",format["КПЗ Закрыто"]] call SunriseClient_message;
				} else {
					_cursorTarget SVAR ["bis_disabled_Door_1",0,true];
					_cursorTarget animate [format["door_1_rot"],1];
					["info","",format["КПЗ Открыто"]] call SunriseClient_message;
				};
			};

			if (((typeOf _cursorTarget) == LIFE_SETTINGS(getText,"life_trunkClass")) && {player distance _cursorTarget < 5}) exitWith {
				private _gTrunk = _cursorTarget;
				private _gTrunkCfgClass = _gTrunk GVAR ["varDB",""];
				if (EQUAL(_gTrunkCfgClass,"")) exitWith {};

				private _conditions = M_CONFIG(getText,"LifeCfgTrunks",_gTrunkCfgClass,"conditions");
				if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {};

				if (_gTrunk GVAR ["locked",false]) then {
					[_gTrunk,"locked"] call SunriseClient_system_clearGlobalVar;
					if (EQUAL((typeOf _gTrunk),"Land_av_safe")) then {
						if ((_gTrunk animationPhase 'door') < 0.5) then {_gTrunk animate ["door", 1];_gTrunk animate ["rul", 1]};
					};
					["done","",format["Контейнер банды открыт"]] call SunriseClient_message;
				} else {
					_gTrunk SVAR ["locked",true,true];
					if (EQUAL((typeOf _gTrunk),"Land_av_safe")) then {
						if ((_gTrunk animationPhase 'door') >= 0.5) then {_gTrunk animate ["door", 0];_gTrunk animate ["rul", 0]};
					};
					["error","",format["Контейнер банды закрыт"]] call SunriseClient_message;
				};
			};

			if (NOTINVEH(player)) then {
				_veh = _cursorTarget;
			} else {
				_veh = objectParent player;
			};

			if (_veh isKindOf "House_F") then {
				if ((_veh in life_vehicles OR _veh in life_tempHouses) && player distance _veh < 15) then {
					private _door = [_veh] call SunriseClient_system_nearestDoor;
					if (EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];
					if (EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						//systemChat localize "STR_House_Door_Lock";
						["error","",format[localize "STR_House_Door_Lock"]] call SunriseClient_message;		
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
						["done","",format[localize "STR_House_Door_Unlock"]] call SunriseClient_message;	
					};
				};
			} else {
				_locked = locked _veh;
				if (_veh in life_vehicles && player distance _veh < 8 OR (typeof _veh isEqualTo "av_tanker" && player distance _veh < 20)) then {
					if (EQUAL(_locked,2)) then {
						if (local _veh) then {
							[_veh,0] call SunriseClient_system_lockVehicle;
						} else {
							[_veh,0] remoteExecCall ["SunriseClient_system_lockVehicle",_veh];
						};
						["done","",format[localize "STR_MISC_VehUnlock"]] call SunriseClient_message;	
						player say3D "unlock";
					} else {
						if (local _veh) then {
							[_veh,2] call SunriseClient_system_lockVehicle;
						} else {
							[_veh,2] remoteExecCall ["SunriseClient_system_lockVehicle",_veh];
						};
						["error","",format[localize "STR_MISC_VehLock"]] call SunriseClient_message;	
						player say3D "car_lock";
					};
				};
			};
		};
	};

	case (EQUAL(_code,62)): {
		if (_alt && !_shift) then {
			//[1,format["Сервер: %1 нажал ALT+F4! Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
			[["relog",format["%1 нажал ALT+F4! Возможно, что для релога во время RP",GVAR_RNAME(player)]],"customLog"] call SunriseClient_system_hcExec;
			_handled = true;
			if (!isnull (findDisplay 602)) then {
				[] call SunriseClient_system_saveGear;
			};
		};
    };

    case (EQUAL(_code,15)): {
		if (_alt && !_shift) then {
			//[0,format["Сервер: %1 нажал ALT+TAB! Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
			_handled = true;
			if (!isnull (findDisplay 602)) then {
				[] call SunriseClient_system_saveGear;
			};
		};
    };

    case (EQUAL(_code,211)): {
		if (_ctrlKey && _alt)  then {
			//[1,format["Сервер: %1 нажал CTRL + ALT + DEL!  Возможно, что для релога во время RP (Сообщите Админу)",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
			[["relog",format["%1 нажал CTRL + ALT + DEL!  Возможно, что для релога во время RP",GVAR_RNAME(player)]],"customLog"] call SunriseClient_system_hcExec;
			_handled = true;
			if (!isnull (findDisplay 602)) then {
				[] call SunriseClient_system_saveGear;
			};
		};
    };

	//shift+v сдаться
	case (EQUAL(_code,47)): {
		if (_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !life_is_processing && !life_action_inUse && isNull life_DraggedBody) then {
				if (player GVAR ["surrender",false]) then {
					[player,"surrender"] call SunriseClient_system_clearGlobalVar;
					["info","",format["Вы опустили руки"],true] call SunriseClient_message;
				} else {
					[] spawn SunriseClient_system_surrender;
					["info","",format["Вы сдались и закинули руки за голову! Нажмите Shift+V, чтобы опустить руки."],true] call SunriseClient_message;
				};
			};

		};
	};

	//Dance menu(Shift + Num 1)
	case (EQUAL(_code,79)): {
		if (_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && isNull life_DraggedBody) then {
				[] spawn SunriseClient_gestures_danceMenu;
			};
		};
	};

	//Gesture menu(Shift + Num 2)
	case (EQUAL(_code,80)): {
		if (_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && !life_dance && isNull life_DraggedBody) then {
				[] spawn SunriseClient_system_gestureMenu;
			};
		};
	};

	//Gesture menu 2(Shift + Num 3)
	case (EQUAL(_code,81)): {
		if (_shift) then {
			_handled = true;
			if (NOTINVEH(player) && !dialog && !life_is_processing && !life_is_arrested && !life_dance && isNull life_DraggedBody) then {
				[] spawn SunriseClient_system_gestureMenuFun;
			};
		};
	};

	//(Shift + Num 4)
	case (EQUAL(_code,75)): {
		if (_shift && !dialog && life_copDuty AND life_copLevel > 2) then {
			[] call SunriseClient_vehdatabase_Menu;
			_handled = true;
		};
	};

	//(Shift + Num 5)
	case (EQUAL(_code,76)): {
		if (_shift && !dialog && (life_copDuty AND life_copLevel > 3) OR life_canUseWarZone OR life_civlevel > 4) then {
			[] call SunriseClient_martiallaw_listWarPoints;
			_handled = true;
		};
	};

	//(Shift + Num 6)
	case (EQUAL(_code,77)): {
		if (_shift && !dialog && (EQUAL(PUNIFORM,"xmas_santa_opfor_uniform")) && (EQUAL(PBACKPACK,"Extremo_santa_backpack")) && (FETCH_CONST(life_donator) > 0)) then {
			if (time - life_santa_delay < 30) exitWith {["error","",format["Не чаще одного раза в 30 секунд..."]] call SunriseClient_message};
			life_santa_delay = time;
			[player,"SantaSound"] remoteExec ["SunriseClient_system_say3D",RCLIENT];
			_handled = true;
		};
	};

	//(Shift + Num 7)
	case (EQUAL(_code,71)): {
		if (_shift && !dialog) then {
			[] spawn SunriseClient_message_msgToTargetMenu;
			_handled = true;
		};
	};

	//Shift+End = Faded Sound
	//беруши
	/* case (EQUAL(_code,207)): {
		if (_shift && !dialog) then {
			[] call SunriseClient_system_fadeSound;
			_handled = true;
		};
	}; */
    case (EQUAL(_code,207)): {
		if (_shift && !dialog) then {
		    switch (life_earplugs) do {
				case 0: {hintSilent "Громкость 10%"; 1 fadeSound 0.1; life_earplugs = 10;};
				case 10: {hintSilent "Громкость 40%"; 1 fadeSound 0.4; life_earplugs = 40;};
				case 40: {hintSilent "Громкость 70%"; 1 fadeSound 0.7; life_earplugs = 70;};
				case 70: {hintSilent "Громкость 100%"; 1 fadeSound 1; life_earplugs = 0;};
		    };
	    };
	};
	
	//Shift+P = Phone
	case (EQUAL(_code,25)): {
		if (_shift && !dialog) then {
			[0] spawn SunriseClient_system_OpenPhone;
			_handled = true;
		};
	};

	//Shift+O = 911 phone
	case (EQUAL(_code,24)): {
		if (_shift && !dialog) then {
			[1] spawn SunriseClient_system_OpenPhone;
			_handled = true;
		};
	};

	//Shift+I = Wanted menu
	case (EQUAL(_code,23)): {
		if (_shift && !dialog) then {
			if (life_copDuty AND player isEqualTo life_cop_disp) then {[] spawn SunriseClient_system_wantedMenu;};
			_handled = true;
		};
	};

	/*case (EQUAL(_code,2)): {
		_handled = true;
		player selectWeapon (primaryWeapon player);
		life_curWep_h = "";
	};

	case (EQUAL(_code,3)): {
		_handled = true;
		player selectWeapon (handgunWeapon player);
		life_curWep_h = "";
	};

	case (EQUAL(_code,4)): {
		_handled = true;
		player selectWeapon (secondaryWeapon player);
		life_curWep_h = "";
	};

	//Un\Holster weapon
	case (EQUAL(_code,5)): {
		_handled = true;
		if (life_curWep_h isEqualTo "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon",player,player,100];
		} else {
			if (life_curWep_h in [primaryWeapon player,handgunWeapon player,secondaryWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
			life_curWep_h = "";
		};
	};

	case (_code in [6,7,8,9,10]): {
		if (!_shift && NOTINVEH(player) && !dialog && !life_is_processing && !life_dance && isNull life_DraggedBody) then {
			_handled = true;
			private _gesture = switch (_code) do {
				case 6 : {"CRPTHSHold"};
				case 7 : {"CRPTHSForward"};
				case 8 : {"CRPTHSWarning"};
				case 9 : {"CRPTHSPoint"};
				case 10 : {"srl_yes"};
				default {};
			};
			[_gesture] call SunriseClient_gestures_playAction;
		};
	};*/
	
	//Holster / recall weapon.
	case (EQUAL(_code,35)): {
		if (_shift && !_ctrlKey && !(EQUAL(CURWEAPON,""))) then {
			_handled = true;
			life_curWep_h = CURWEAPON;
			player action ["SwitchWeapon",player,player,100];
			player switchcamera cameraView;
			[] call SunriseClient_fast_hudWeaponUpdate;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))} && {life_curWep_h in [RIFLE,PISTOL,LAUNCHER]}) then {
			_handled = true;
			player selectWeapon life_curWep_h;
			[] call SunriseClient_fast_hudWeaponUpdate;
		};
	};
	
	if (_code in [2,3,4,5,6,7,8,9,10,59,60,61,62,63,64,65,66]) then {
	if(!dialog && !life_is_processing) then {
		_array = switch (_code) do {
			case 2 : {[0,[]]};
			case 3 : {[1,[]]};
			case 4 : {[2,[]]};
			case 5 : {[3,(bind_number_array select 0)]};
			case 6 : {[4,(bind_number_array select 1)]};
			case 7 : {[5,(bind_number_array select 2)]};
			case 8 : {[6,(bind_number_array select 3)]};
			case 9 : {[7,(bind_number_array select 4)]};
			case 10 : {[8,(bind_number_array select 5)]};
			case 59 : {[9,(bind_f_number_array select 0)]};
			case 60 : {[10,(bind_f_number_array select 1)]};
			case 61 : {[11,(bind_f_number_array select 2)]};
			case 62 : {[12,(bind_f_number_array select 3)]};
			case 63 : {[13,(bind_f_number_array select 4)]};
			case 64 : {[14,(bind_f_number_array select 5)]};
			case 65 : {[15,(bind_f_number_array select 6)]};
			case 66 : {[16,(bind_f_number_array select 7)]};
			default {0};
		};
		_array call SunriseClient_fast_usehotkey;
		_handled = true;
	};
	};
};

//Ловим переключение или доставание пушек
if ((inputAction "SwitchSecondary" > 0)
|| (inputAction "SwitchWeapon" > 0)
|| (inputAction "SwitchPrimary" > 0)
|| (inputAction "SwitchHandgun" > 0)
|| (inputAction "handgun" > 0)
|| (inputAction "HandGunOnStand" > 0)
|| (inputAction "HandGunOff" > 0)
|| (inputAction "HandGunOffStand" > 0)
) exitWith {
	true
};
//отдельно ловим след. оружие
if (((vehicle player) isEqualTo player) && (currentWeapon player isEqualTo "") && (inputAction "nextWeapon" > 0)) exitWith {
	true
};

_handled;