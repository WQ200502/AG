/*

	Filename: 	SunriseClient_system_addBuff.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

	Web:		http://sunriserp.ru
 
 	***description status***
	0: Баф/Дебаф со временем
	1: Идет на удаление
	2: Обычное сообщение
	3: Перманентное сообщение
*/
private ["_color","_image"];

disableSerialization;
private _rawText = param [0,"",[""]];
private _variable = param [1,"",[""]];
private _time = param [2,0,[0]];
private _status = param [3,0,[0]];

if (_variable isEqualTo "") exitWith {};
if (missionNamespace getVariable _variable) exitWith {};

private _display = uiNamespace getVariable ["RscBuffUiArea",displayNull];
if (isNull _display) then {	
	["RscBuffUiArea","PLAIN",1,false] call SunriseClient_gui_CreateRscLayer;
	_display = uiNamespace getVariable ["RscBuffUiArea",displayNull];
};

if (_status isEqualTo 3) then {_time = 0};

switch (_variable) do {
	//buff
	case "life_speed_buff": {	
		_color = [0.212,0.749,0.247,1];		
		_image = "sunrise_gui\data\white\gui_speed.paa"
	};
	case "life_turbo_used": {	
		_color = [0.212,0.749,0.247,1]; 	
		_image = "sunrise_gui\data\white\gui_turbo.paa"
	};
	case "life_jet_used": {		
		_color = [0.212,0.749,0.247,1]; 	
		_image = "sunrise_gui\data\white\gui_turbo.paa"
	};
	case "life_morphine_used": {
		_color = [0.212,0.749,0.247,1]; 	
		_image = "sunrise_gui\data\white\gui_run.paa"
	};
	case "life_stepHeal_buff": {
		_color = [0.212,0.749,0.247,1]; 	
		_image = "sunrise_gui\data\white\gui_radiation.paa"
	};
	case "life_radx_used": {
		_color = [0.212,0.749,0.247,1]; 	
		_image = "sunrise_gui\data\white\gui_radiation.paa"
	};
	case "life_adrenalin_used": {
		_color = [0.212,0.749,0.247,1];		
		_image = "sunrise_gui\data\white\gui_speed.paa"
	};
	case "life_psyho_used": {
		_color = [0.212,0.749,0.247,1];		
		_image = "sunrise_gui\data\white\gui_speed.paa"
	};
	
	//debuff
	case "life_pain_shock": {	
		_color = [1,0,0,1];		
		_image = "sunrise_gui\data\white\gui_pain.paa"
	};
	case "life_bleeding": {		
		_color = [1,0,0,1];		
		_image = "sunrise_gui\data\white\gui_blood.paa"
	};
	case "life_blood_legs": {	
		_color = [1,0,0,1];		
		_image = "sunrise_gui\data\white\gui_crit.paa"
	};
	case "life_drink_buff": {	
		_color = [1,0,0,1];		
		_image = "sunrise_gui\data\white\gui_run.paa"
	};
	case "life_depsyho_used": {
		_color = [1,0,0,1];		
		_image = "sunrise_gui\data\white\gui_speed.paa"
	};
	

	case "gas": {				
		_color = [1,0,0,1];		
		_image = "sunrise_gui\data\white\gui_radiation.paa"
	};
	case "rad": {				
		_color = [1,0,0,1];		
		_image = "sunrise_gui\data\white\gui_radiation.paa"
	};
};

if !(_variable in (getArray(missionConfigFile >> "Life_Settings" >> "dont_use_buffs"))) then {
	missionNamespace setVariable [_variable,true];
	[_variable] call SunriseClient_buffEffects;
};

_toastControl = _display ctrlCreate ["RscNewUiBuff", -1]; 
_toastPosition = ctrlPosition _toastControl;

//BG position
_backgroundControl = _toastControl controlsGroupCtrl 100;  
_backgroundPosition = ctrlPosition _backgroundControl;
_backgroundPosition set [3, _toastPosition select 3];
_backgroundControl ctrlSetPosition _backgroundPosition;
//_backgroundControl ctrlSetBackgroundColor [0,0,0,0.6];
_backgroundControl ctrlCommit 0;

//image
_imageControl = _toastControl controlsGroupCtrl 102;  
_imagePosition = ctrlPosition _imageControl;
_imagePosition set [3, _toastPosition select 3];
_imageControl ctrlSetPosition _imagePosition;
_imageControl ctrlSetText _image;
_imageControl ctrlCommit 0;

//stripe
_imageBgControl = _toastControl controlsGroupCtrl 101;  
_imageBgControl ctrlSetBackGroundColor _color;
_imageBgPosition = ctrlPosition _imageBgControl;
_imageBgPosition set [0, (_imagePosition select 0) + (_imagePosition select 2)];
_imageBgPosition set [3, _toastPosition select 3];
_imageBgControl ctrlSetPosition _imageBgPosition;
_imageBgControl ctrlCommit 0;

//text
_textControl = _toastControl controlsGroupCtrl 104;  
_textControl ctrlSetText _rawText; 
_textPosition = ctrlPosition _textControl;  
_textPosition set [0, (_imageBgPosition select 0) + (_imageBgPosition select 2)];
_textControl ctrlSetPosition _textPosition;
_textControl ctrlCommit 0;

//pb position
_pbControl = _toastControl controlsGroupCtrl 103; 
_pbPosition = ctrlPosition _pbControl;  
_pbPosition set [0, (_imageBgPosition select 0) + (_imageBgPosition select 2)];
_pbPosition set [1, (_textPosition select 3)];
if (_status in [2,3]) then {
	_pbControl progressSetPosition 1;
	} else {
	_pbControl progressSetPosition 0;
};
_pbControl ctrlSetPosition _pbPosition;
_pbControl ctrlCommit 0;

//toast position
_toastPosition set [0, 0.824844 * safezoneW + safezoneX];
_toastPosition set [1, 0.80 * safezoneH + safezoneY - ((_toastPosition select 3) / 4)];
_toastControl ctrlSetPosition _toastPosition;
_toastControl ctrlSetFade 1;
_toastControl ctrlCommit 0;

reverse ui_buff_array;
ui_buff_array pushBack [_toastControl, _status, diag_tickTime + _time, 0, _variable];
reverse ui_buff_array;

playsound "HintExpand";
call SunriseClient_buff_ui_push_to_top;

if ((_status isEqualTo 0) && (_time > 0)) then {
	[_toastControl,_time] spawn SunriseClient_buff_ui_time_control;
};
