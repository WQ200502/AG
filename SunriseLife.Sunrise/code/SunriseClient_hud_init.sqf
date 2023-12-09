/*

	Filename: 	SunriseClient_hud_init.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\script_macros.hpp"
disableSerialization;
private _ui = GVAR_UINS ["playerHUD",displayNull];
if (isNull _ui) then {
	["playerHUD","PLAIN",1,false] call SunriseClient_gui_CreateRscLayer;
	_ui = GVAR_UINS ["playerHUD",displayNull];
};

[] call SunriseClient_hud_theme;

[] call SunriseClient_hud_skinConfig;
[life_myThemeID] call SunriseClient_hud_skinSet;

private _makeTextControl = {
	params ["_idc","_parent","_pos","_text","_size","_type"];
	_ctrl = _ui ctrlCreate [_type, _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _text;
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)*_size;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _makeBackgroundControl = {
	params ["_pos","_color","_parent","_idc"];
	_ctrl = _ui ctrlCreate ["RscBackground", _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetBackgroundColor _color;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _makePictureControl = {
	params ["_pos","_pic","_parent","_idc"];
	_ctrl = _ui ctrlCreate ["RscPicture", _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _pic;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _getNextIDC = {
	params ["_key"];
	private _idc = ((_ui getVariable "map") pushBack _key) + 10000;
	_idc;
};

private _mfmIDCmap = ["null"];
_ui setVariable ["map",_mfmIDCmap];

ui_message_visible = true;

private _health = _ui displayCtrl 23500;
private _fatig = _ui displayCtrl 23501;

private _food_pb = _ui displayCtrl 23513;
private _water_pb = _ui displayCtrl 23514;
private _health_pb = _ui displayCtrl 23516;
private _fatig_pb = _ui displayCtrl 23519;

private _food_pb_value = _ui displayCtrl 23507;
private _water_pb_value = _ui displayCtrl 23508;
private _server = _ui displayCtrl 23505;
private _fps_info = _ui displayCtrl 23506;
private _nickname = _ui displayCtrl 23524;
private _speak_volume = 0;

private _icon_health = _ui displayCtrl 23509;
private _icon_drink = _ui displayCtrl 23511;
private _icon_food = _ui displayCtrl 23512;

_icon_health ctrlSetText format ["\sunrise_gui\data\white\gui_health.paa",life_gui_folder];
_icon_food ctrlSetText format ["\sunrise_gui\data\white\gui_eat.paa",life_gui_folder];
_icon_drink ctrlSetText format ["\sunrise_gui\data\white\gui_drink.paa",life_gui_folder];

_health ctrlSetTextColor life_gui_theme_color;
_fatig ctrlSetTextColor life_gui_theme_color;
_food_pb_value ctrlSetTextColor life_gui_theme_color;
_water_pb_value ctrlSetTextColor life_gui_theme_color;
_server ctrlSetTextColor life_gui_theme_color;
_fps_info ctrlSetTextColor life_gui_theme_color;
_nickname ctrlSetTextColor life_gui_theme_color;

////////////////////////////////////////////////////////
//load main buttons
for "_i" from 0 to 8 do {
	private _space = 0.01;
	private _button_border = 0.002;

	private _width = 0.026 * safezoneW;
	private _height = 0.044 * safezoneH;
	private _posX = (0.34 * safezoneW + safezoneX) + ((_space * _i) + (_width * _i));
	private _posY = 0.918 * safezoneH + safezoneY;

	private _button_text = format ["%1",(_i + 1)];

	private _grp = _ui ctrlCreate ["RscControlsGroupNoScrollbars", ([format ["main_area_button_group_%1",_i],_ui] call _getNextIDC)];
	_grp setVariable ["main_button_name",_i];
	_grp ctrlSetPosition [_posX,_posY,_width, _height];
	_grp ctrlCommit 0;

	private _color = [0,0,0,0.4];
	private _type_name = "";
	private _item = "";
	private _picture = "";

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

	switch (_type_name) do {
			case "inventory": {
				_itemInfo = [_item] call SunriseClient_fast_fetchcfgdetails;
				_picture = format ["%1",_itemInfo select 2];
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

	[[0,0,1,1],_color,_grp,([format ["main_button_bg_%1",_i],_ui] call _getNextIDC)] call _makeBackgroundControl;

	private _ctrlPicture = [[0,0,_width,_height],"",_grp,([format ["main_button_pic_%1",_i],_ui] call _getNextIDC)] call _makePictureControl;
	_ctrlPicture ctrlSetText _picture;

	[([format ["main_button_button_text_%1",_i],_ui] call _getNextIDC),_grp,[_button_border,_height - (_height / 2),_width - (_button_border * 2),(_height / 2) - (_button_border * 2)],_button_text,1,"SLT_left"] call _makeTextControl;
};
////////////////////////////////////////////////////////

if (life_showWeaponHud) then {[true] call SunriseClient_fast_hudWeaponHide} else {[false] call SunriseClient_fast_hudWeaponHide};

LIFE_HANDLE_HUD = [{
	(_this#0) params ["_ui","_food_pb","_water_pb","_health_pb","_fatig_pb","_nickname","_server","_health","_fatig","_fps_info","_food_pb_value","_water_pb_value"];
	if (isNull _ui) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler;LIFE_HANDLE_HUD = -1};
	
	_food_pb progressSetPosition (life_hunger/100);
	_water_pb progressSetPosition (life_thirst/100);
	_health_pb progressSetPosition (round((1 - (damage player)) * 100)/100);
	_fatig_pb progressSetPosition (round((1 - (getFatigue player)) * 100)/100);

	_nickname ctrlSetText format ["%1",GVAR_RNAME(player)];
	_server ctrlSetText format ["%1",server_timeText];
	_health ctrlSetText format ["%1%2",round((1 - (damage player)) * 100),"%"];
	_fatig ctrlSetText format ["%1%2",round((1 - (getFatigue player)) * 100),"%"];

	if (life_showFPS) then {
		_fps_info ctrlSetStructuredText parseText format ["<t align='center'>%1 FPS</t>", round diag_fps];
	} else {
		_fps_info ctrlSetStructuredText parseText "";
	};

	_food_pb_value ctrlSetText format["%1%2",life_hunger,"%"];
	_water_pb_value ctrlSetText format["%1%2",life_thirst,"%"];
	
	[] call SunriseClient_buff_thread;
	[] call SunriseClient_ui_message_thread; // UI System
	
},1,[_ui,_food_pb,_water_pb,_health_pb,_fatig_pb,_nickname,_server,_health,_fatig,_fps_info,_food_pb_value,_water_pb_value]] call CBA_fnc_addPerFrameHandler;