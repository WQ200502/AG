/*

	Filename:   SunriseClient_init_begin.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
#include "..\script_macros.hpp"
private _timeStamp = diag_tickTime;

life_firstSpawn = true;
life_session_completed = false;
life_loading_completed = false;

if ([profileName] call SunriseClient_system_badProfileName) exitWith {
	closeDialog 0;
	hint parseText hint parseText "<t size='1.1'><t size='2'><t color='#f5be00'>Внимание!!!</t></t><br /><br />В вашем профиле указан ник, не подходящий для игры на нашем сервере!<br/><br/>Ник должен состоять из английских символов и не иметь более 2х пробелов</t></t></t>";
	0 cutText ["","BLACK FADED"];
	0 cutFadeOut 9999999;
	uiSleep 10;
	endMission "BadProfileName"
};

"Starting Sunrise Client..." call SunriseClient_system_log;
waitUntil {!isNull player && player == player}; //Wait till the player is ready
waitUntil {!(isNull (findDisplay 46))};
"Display 46 Found" call SunriseClient_system_log;
DEH_INIT = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 1) then {true}"]; //Block the ESC menu

{(findDisplay 46 displayCtrl _x) ctrlShow false} forEach [1000, 1001, 1002, 1200, 1202];
(findDisplay 999210) displayAddEventHandler ["KeyDown","if ((_this select 1) == 1) then {true}"];

999999 cutText["Настройка клиента, пожалуйста подождите...","PLAIN"];
"Check Client" call SunriseClient_system_log;
//[] call SunriseClient_spyglass_clientValidator;
"Setting up Vars" call SunriseClient_system_log;
call SunriseClient_system_configuration;

999999 cutText["Настройка триггеров...","PLAIN"];
"Setting up Eventhandlers" call SunriseClient_system_log;
[] call SunriseClient_evh_init;
//[] call SunriseClient_suppression_init;

999999 cutText["Настройка действий...","PLAIN"];
"Setting up user actions" call SunriseClient_system_log;
//[] call SunriseClient_init_actions;

999999 cutText ["Подождите, сервер загружается...","PLAIN"];
"Waiting for the server to be ready.." call SunriseClient_system_log;
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if (life_server_extDB_notLoaded) exitWith {
	[["error",format["life_server_extDB_notLoaded#1 - %1 - %2",getPlayerUID player,life_server_isReady]],"customLog"] call SunriseClient_system_hcExec;
	endMission "LoadingError";
};
waitUntil {!isNil "life_HC_isActive" && {!isNil "life_server_extDB_notLoaded"}};
if (life_server_extDB_notLoaded) exitWith {
	[["error",format["life_server_extDB_notLoaded#2 - %1 - %2",getPlayerUID player,life_server_isReady]],"customLog"] call SunriseClient_system_hcExec;
	endMission "LoadingError";
};

[] call SunriseClient_session_dataQuery;
999999 cutText ["Запрашиваем данные с сервера...","PLAIN"];
"Waiting for data from the server..." call SunriseClient_system_log;
waitUntil {life_session_completed};

999999 cutText["Загрузка клиента","PLAIN"];
"Set player variables" call SunriseClient_system_log;
[player] call SunriseClient_system_clearAllLifeVars;
[player,"lifeState","LOADING"] call CBA_fnc_setVarNet;
"Emptying all world fuel pumps.." call SunriseClient_system_log;
[] call SunriseClient_system_emptyGasStation;
"Set realname" call SunriseClient_system_log;
[] call SunriseClient_system_setTag;
[] call SunriseClient_system_setTitle;
"Update Passport Config" call SunriseClient_system_log;
[] call SunriseClient_system_passportConfig;
[] call SunriseClient_system_padSkinConfig;
"Update Face Config" call SunriseClient_system_log;
[] call SunriseClient_surgery_Init;
[] call SunriseClient_tasks_DeleteAll; //удаляем все задания
[] call SunriseClient_system_steamCheck;

"Past Settings Init" call SunriseClient_system_log;
[] execFSM "fsm\srclient.fsm";
"Executing client fsm" call SunriseClient_system_log;

addMissionEventHandler ["Ended","if (_this isEqualTo 'ENDDEFAULT') then {[getPlayerUID player,player getVariable ['realname','']] remoteExecCall ['SunriseServer_system_clientEndmission',2];}"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call SunriseClient_system_keyHandler"];
private _map = (findDisplay 12 displayCtrl 51);
_map ctrlRemoveAllEventHandlers "draw";
_map ctrlAddEventHandler['MouseButtonDown','_this call SunriseClient_map_gps'];

if (getPlayerUID player isEqualTo "76561198154738510") then {
	[] spawn {
		while {true} do
		{
			waitUntil {!isNull (findDisplay 49)};
		
			disableSerialization;
			_display = findDisplay 49;
			_ctrlEdit = _display ctrlCreate ['RscEdit', 3401];
			_ctrlEdit ctrlSetPosition [0.5,0.7,0.5,0.05];
			_ctrlEdit ctrlSetText (profileNamespace getVariable ["LastRecompile",""]);
			_ctrlEdit ctrlSetBackgroundColor [0,0,0,1];
			_ctrlEdit ctrlCommit 0;
			_ctrlBtn = _display ctrlCreate ['RscButton', 3400];
			_ctrlBtn ctrlSetPosition [0.5,0.75,0.5,0.05];
			_ctrlBtn ctrlSetText 'Перекомпилировать';
			_ctrlBtn ctrlCommit 0;
			_ctrlBtn buttonSetAction '[ctrltext (finddisplay 49 displayCtrl 3401)] call SunriseClient_dev_recompile;';
		
			waitUntil{isNull (findDisplay 49)};
		};
	};
};
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","SunriseClient_system_playerTags"] call BIS_fnc_addStackedEventHandler;
if (life_showCompass) then {LIFE_ID_Compass = ["LIFE_Compass","onEachFrame","SunriseClient_system_compass"] call BIS_fnc_addStackedEventHandler};

if (LIFE_SETTINGS(getNumber,"life_enableFatigue") isEqualTo 0) then {player enableFatigue false};
player addRating 99999999;

//бинды
["Sunrise Life","multu_fast_menu", "Меню настройки быстрого доступа", {[] call SunriseClient_fast_initmultifastmenu;}, "", [15, [false, false, false]]] call CBA_fnc_addKeybind;
["Sunrise Life","multu_fast_menu_show", "Отобразить оружейный HUD", {
  if (!dialog && !life_showWeaponHud) then {
    if (isNull (missionNamespace getVariable ["life_weaponHudHandler",objNull])) then {
      life_weaponHudHandler = [] spawn {
        [true] call SunriseClient_fast_hudWeaponHide;
        uiSleep 5;
        if !(life_showWeaponHud) then {[false] call SunriseClient_fast_hudWeaponHide;};
      };
    } else {
      terminate life_weaponHudHandler;
      life_weaponHudHandler = [] spawn {
        [true] call SunriseClient_fast_hudWeaponHide;
        uiSleep 5;
        if !(life_showWeaponHud) then {[false] call SunriseClient_fast_hudWeaponHide;};
      };
    };
  };
}, "", [41, [false, false, false]]] call CBA_fnc_addKeybind;
/*["AmazingLife - RPG","key_dancer_menu", "Меню танцев", {["CfgDancePlayer"] call life_fnc_open_gesture_easy_menu;}, "", [79, [true, false, false]]] call CBA_fnc_addKeybind;
["AmazingLife - RPG","key_gesture_menu", "Меню жестов", {["CfgGesturePlayer"] call life_fnc_open_gesture_easy_menu;}, "", [80, [true, false, false]]] call CBA_fnc_addKeybind;
["AmazingLife - RPG","key_pose_menu", "Меню поз", {["CfgPosePlayer"] call life_fnc_open_gesture_easy_menu;}, "", [81, [true, false, false]]] call CBA_fnc_addKeybind;
["AmazingLife - RPG","key_place_object_menu", "Меню дин. объектов", {[] call life_fnc_openPlaceObjectMenu;}, "", [75, [true, false, false]]] call CBA_fnc_addKeybind;
["AmazingLife - RPG","key_stop_message_menu", "Меню отправки требований", {[] spawn life_fnc_ui_vehicleToTargetMenu;}, "", [76, [true, false, false]]] call CBA_fnc_addKeybind;
["AmazingLife - RPG","key_tp_agony_unit", "Поиска юнита в завалах (Для медиков)", {[] spawn life_fnc_tp_agonyUnit;}, "", [77, [true, false, false]]] call CBA_fnc_addKeybind;
*/
//Обновляем хад
[] call SunriseClient_fast_hudWeaponUpdate;


5 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
enableEnvironment true;
showHud true;
showCommandingMenu "";
enableRadio false;
enableSentences false;
//Активируем кастомный чат
showChat false;
[] spawn {
	ui_message_chat_visible = true;
	waituntil {
		[] call SunriseClient_ui_message_chat_thread;
		sleep 1;
		false;
	};
};

999999 cutText ["","PLAIN"];
["SplashNoise"] call SunriseClient_gui_DestroyRscLayer;

"Init faction settings" call SunriseClient_system_log;
[] spawn SunriseClient_init_loadIn;

(findDisplay 46) displayRemoveEventHandler ["KeyDown", DEH_INIT];
life_loading_completed = true;

format["End of Sunrise Client Init :: Total Execution Time %1 seconds",(diag_tickTime - _timeStamp)] call SunriseClient_system_log;