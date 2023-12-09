#include "..\..\script_macros.hpp"
/*

    Filename: 	fn_loadSettings.sqf
	Project: 	AmazingLife - RPG
	Author:		AmazingTeam
	E-mail:		dev@amazingrp.ru
	Web:		http://amazingrp.ru/

*/
private _settings = profileNamespace getVariable['sunrise_settings',[]];

private _error = "";
private _return = [];

/*
//Variables
0: life_settings_tagson <BOOLEAN>
1: life_settings_viewDistanceFoot <NUMBER> 100 - 12000
2: life_settings_viewDistanceCar <NUMBER> 100 - 12000
3: life_settings_viewDistanceAir <NUMBER> 100 - 12000
4: life_settings_Beryshi <NUMBER> 0 - 100
5: life_grassIndex <NUMBER> 25 or 50
6: life_showFPS <BOOLEAN>
7: life_phone_bgImg <NUMBER>
8: life_phone_appImg <NUMBER>
9: life_appTextColor <NUMBER>
10: life_lowFps <BOOLEAN>
11: life_uiColor <ARRAY>
12: life_uiHide <NUMBER>
13: bind_number_array = [["",""],["",""],["",""],["",""],["",""],["",""]]; <ARRAY>
14: bind_f_number_array = [["gesture","am_hello"],["gesture","am_dunno"],["gesture","am_think"],["gesture","am_pointOn"],["gesture","am_yes"],["gesture","am_no"],["gesture","am_thumbUp"],["gesture","am_thumbDown"]];	<ARRAY>
15: life_showWeaponHud = true; <BOOL>
16: life_saveBind = false; <BOOL>

Default array:
[true,800,800,800,70,50,false,2,3,1,false,[0,0,0],0.4,[["",""],["",""],["",""],["",""],["",""],["",""]],[["gesture","am_hello"],["gesture","am_dunno"],["gesture","am_think"],["gesture","am_pointOn"],["gesture","am_yes"],["gesture","am_no"],["gesture","am_thumbUp"],["gesture","am_thumbDown"]],true,false]
*/

if(_settings isEqualTo []) then {
	profileNamespace setVariable['sunrise_settings',[[["",""],["",""],["",""],["",""],["",""],["",""]],[["gesture","srl_bouncer"],["gesture","srl_bow_pray"],["gesture","srl_clapping"],["gesture","srl_hand_stand"],["gesture","srl_muscle"],["gesture","srl_pushups"],["gesture","srl_thumbs_up"],["gesture","srl_thumbs_down"]]]];
	saveprofileNamespace;
	_error = "0";
} else {
	//1 check count array
	if !((count _settings) isEqualTo 2) exitWith {_error = "1"};

	//2 check type array
	if !((_settings select 0) isEqualType []) exitWith {_error = "2"};
	if !((_settings select 1) isEqualType []) exitWith {_error = "3"};

	_return = _settings;
};

if !(_error isEqualTo "") then {
	_return = [[["",""],["",""],["",""],["",""],["",""],["",""]],[["gesture","srl_bouncer"],["gesture","srl_bow_pray"],["gesture","srl_clapping"],["gesture","srl_hand_stand"],["gesture","srl_muscle"],["gesture","srl_pushups"],["gesture","srl_thumbs_up"],["gesture","srl_thumbs_down"]]];
		if (_error isEqualTo "0") then {
			//systemChat "Ошибка при загрузке настроек персонажа: [Нет сохраненных данных в профиле персонажа]. Загружены стандартные настройки.";
			["error","","Ошибка при загрузке настроек персонажа: [Нет сохраненных данных в профиле персонажа]. Загружены стандартные настройки.",true] call SunriseClient_message;
			diag_log "Ошибка при загрузке настроек персонажа: [Нет сохраненных данных в профиле персонажа]. Загружены стандартные настройки.";
		} else {
			//systemChat format ["Ошибка при загрузке настроек персонажа: [#%1]. Загружены стандартные настройки.",_error];
			["error","",format ["Ошибка при загрузке настроек персонажа: [#%1]. Загружены стандартные настройки.",_error],true] call SunriseClient_message;
			diag_log format ["Ошибка при загрузке настроек персонажа: [#%1]. Загружены стандартные настройки.",_error];
		};
	};

_return;
