#include "..\..\script_macros.hpp"
/*

	Filename: 		fn_initMultiFastMenu.sqf
	Project: 	  	AmazingLife - RPG
	Author:		  	AmazingTeam
	E-mail:		  	dev@amazingrp.ru
	Web:		      http://amazingrp.ru/

*/
if (dialog) exitWith {};

[false] call SunriseClient_fast_hudWeaponHide;

//settings
private _pictureGesture = LIFE_SETTINGS(getText,"MFMpictureGesture");
private _pictureDance = LIFE_SETTINGS(getText,"MFMpictureDance");
private _picturePose = LIFE_SETTINGS(getText,"MFMpicturePose");
private _picturePlus = "\sunrise_gui\data\v3\button_back.paa";
private _pictureMinus = "\sunrise_gui\data\v3\button_close.paa";
private _buttonSpeed = 0; // 0 fast - 1 slow

/////////////////////////////////////////

private _makeButtonControl = {
	params ["_idc","_parent","_pos","_tooltip","_action"];
	_ctrl = _display ctrlCreate ["RscPictureButtonMenu", _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlEnable true;
	_ctrl ctrlSetEventHandler ["ButtonClick",_action];
	//_ctrl ctrlSetEventHandler ["ButtonClick",format ["systemChat ""%1"";",_action]];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _makePictureControl = {
	params ["_pos","_pic","_parent","_idc"];
	_ctrl = _display ctrlCreate ["RscPicture", _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _pic;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _makeTextControl = {
	params ["_idc","_parent","_pos","_text","_size","_type"];
	_ctrl = _display ctrlCreate [_type, _idc, _parent];
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
	_ctrl = _display ctrlCreate ["RscExtremoGui_DialogBG", _idc, _parent];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetBackgroundColor _color;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _getNextIDC = {
	params ["_key"];
	private _idc = ((_display getVariable "map") pushBack _key) + 10000;
	_idc;
};
private _getControl = {
	params ["_key"];
	private _ctrl = controlNull;
	private _index = ((_display getVariable "map") find _key) + 10000;
	if (_index != -1) then {
		_ctrl = _display displayCtrl _index;
	};
	_ctrl;
};
private _changeKeyName = {
	params ["_key","_newKey"];
	private _index = ((_display getVariable "map") find _key);
	(_display getVariable "map") set [_index, _newKey];
};
private _checkMouseOverCtrl = {
	params ["_ctrls","_idd",["_offset",true]];
	private _display = findDisplay _idd;
	if (isNull _display) exitWith {false};
	private _mouseOverMenu = false;
	{
		private _ctrl = controlNull;
		if (typeName _x == typeName controlNull) then {_ctrl = _x} else {_ctrl = _display displayCtrl _x};
		(_display getVariable ["offset",[0,0]]) params ["_xOffset","_yOffset"];
		if (!isNull _ctrl) then {
			(ctrlPosition _ctrl) params ["_xp","_y","_w","_h"];
			getMousePosition params ["_xm","_ym"];
			if (_offset) then {_xm = _xm - _xOffset; _ym = _ym - _yOffset};
			if (((_xm>_xp)AND(_xm<(_xp+_w)))AND((_ym>_y)AND(_ym<(_y+_h)))) exitWith {_mouseOverMenu = true};
		};
	} forEach _ctrls;
	_mouseOverMenu;
};
private _makeButtonNotParentControl = {
	params ["_idc","_pos","_action","_text","_fade"];
	_ctrl = _display ctrlCreate ["RscButton",_idc];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _text;
	_ctrl ctrlSetFontHeight 0.04;
	_ctrl ctrlSetEventHandler ["ButtonClick",_action];
	_ctrl ctrlSetFade _fade;
	_ctrl ctrlCommit 0;
	_ctrl;
};
private _makeSTextControl = {
	params ["_idc","_pos","_text","_fade","_color"];
	_ctrl = _display ctrlCreate ["RscStructuredText", _idc];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetStructuredText (parseText format ["%1", _text]);
	_ctrl ctrlEnable false;
	_ctrl ctrlSetFade _fade;
	_ctrl ctrlSetBackgroundColor _color;
	_ctrl ctrlCommit 0;
	_ctrl;
};

disableSerialization;

if (!createDialog "multi_fast_menu") exitWith {};

private _display = findDisplay 15700;
if (isNull _display) exitWith {diag_log "Error tablet: Init failed, display does not load."};

//Lets set some variables

_display setVariable ["pictureGesture",_pictureGesture];
_display setVariable ["pictureDance",_pictureDance];
_display setVariable ["picturePose",_picturePose];
_display setVariable ["picturePlus",_picturePlus];
_display setVariable ["pictureMinus",_pictureMinus];
_display setVariable ["buttonSpeed",_buttonSpeed];

_display setVariable ["makeButtonControl",_makeButtonControl];
_display setVariable ["makePictureControl",_makePictureControl];
_display setVariable ["makeTextControl",_makeTextControl];
_display setVariable ["makeBackgroundControl",_makeBackgroundControl];
_display setVariable ["getNextIDC",_getNextIDC];
_display setVariable ["getControl",_getControl];
_display setVariable ["changeKeyName",_changeKeyName];
_display setVariable ["checkMouseOverCtrl",_checkMouseOverCtrl];

private _mfmIDCmap = ["null"];
_display setVariable ["map",_mfmIDCmap];


//Setup eventhandlers
_display displayAddEventHandler ["unload","removeMissionEventHandler ['Draw3D',((_this select 0) getVariable ['drawEH',-1])]; if (life_showWeaponHud) then {[true] call SunriseClient_fast_hudWeaponHide} else {[false] call SunriseClient_fast_hudWeaponHide}; [] call SunriseClient_fast_hudWeaponUpdate; [] call SunriseClient_system_saveSettings;"];
_display setVariable ["drawEH", (addMissionEventHandler ["Draw3D",{_this call SunriseClient_fast_multifastmenuondraw}])];

//load main buttons
for "_i" from 0 to 16 do {

	_space = 0.01;
	_button_border = 0.002;

	_width = 0.026 * safezoneW;
	_height = 0.044 * safezoneH;
	_posX = (0.34 * safezoneW + safezoneX) + ((_space * _i) + (_width * _i));
	_posY = 0.918 * safezoneH + safezoneY;

	_button_text = "";
	if (_i >= 9) then {_button_text = format ["F%1",(_i - 8)]} else {_button_text = format ["%1",(_i + 1)]};

	if (_i >= 9) then {_posX = (0.34 * safezoneW + safezoneX) + ((_space * (_i - 9)) + (_width * (_i - 9)));};
	if (_i >= 9) then {_posY = 0.848 * safezoneH + safezoneY};

	_grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", ((format ["main_area_button_group_%1",_i]) call _getNextIDC)];
	_grp setVariable ["main_button_name",_i];
	_grp ctrlSetPosition [_posX,_posY,_width, _height];
	_grp ctrlCommit 0;

	if (_i >= 3) then {_grp ctrlSetEventHandler ["MouseButtonDblClick",format ['["one_number",[%1]] call SunriseClient_fast_deletebind',_i]]};


	_color = [0,0,0,0.7];
	if (_i <= 2) then {_color = [0.549,0.11,0.11,1]};

	[[0,0,1,1],_color,_grp,((format ["main_button_bg_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;

	_ctrlPicture = [[0,0,_width,_height],"",_grp,((format ["main_button_pic_%1",_i]) call _getNextIDC)] call _makePictureControl;

	_type_name = "";
	_item = "";
	_picture = "";

	switch (true) do {
		case (_i isEqualTo 0): {
			if !((primaryWeapon player) isEqualTo "") then {
				_type_name = "inventory";
				_item = (primaryWeapon player);
			};
		};
		case (_i isEqualTo 1): {
			if !((secondaryWeapon player) isEqualTo "") then {
				_type_name = "inventory";
				_item = (secondaryWeapon player);
			};
		};
		case (_i isEqualTo 2): {
			if !((handgunWeapon player) isEqualTo "") then {
				_type_name = "inventory";
				_item = (handgunWeapon player);
			};
		};
		case (_i <= 8): {
			_type_name = (bind_number_array select (_i - 3)) select 0;
			_item = (bind_number_array select (_i - 3)) select 1;
		};
		default {
			_type_name = (bind_f_number_array select (_i - 9)) select 0;
			_item = (bind_f_number_array select (_i - 9)) select 1;
		};
	};

	switch (_type_name) do {
			case "inventory": {
				_itemInfo = [_item] call SunriseClient_fast_fetchcfgdetails;
				_picture = format ["%1",_itemInfo select 2];
			};
			case "gesture": {
				_picture = _display getVariable ["pictureGesture",""];
			};
			case "dance": {
				_picture = _display getVariable ["pictureDance",""];
			};
			case "pose": {
				_picture = _display getVariable ["picturePose",""];
			};
			default {
				/* code */
			};
	};
	_ctrlPicture ctrlSetText _picture;

	_bg_line_1 = [[0,0,_width,_button_border],[1,1,1,0.8],_grp,((format ["main_button_bg_line_1_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;
	_bg_line_2 = [[0,_height - _button_border,_width,_button_border],[1,1,1,0.8],_grp,((format ["main_button_bg_line_2_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;
	_bg_line_3 = [[0,_button_border,_button_border,_height - (_button_border * 2)],[1,1,1,0.8],_grp,((format ["main_button_bg_line_3_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;
	_bg_line_4 = [[_width - _button_border,_button_border,_button_border,_height - (_button_border * 2)],[1,1,1,0.8],_grp,((format ["main_button_bg_line_4_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;
	_bg_line_1 ctrlSetFade 1;
	_bg_line_2 ctrlSetFade 1;
	_bg_line_3 ctrlSetFade 1;
	_bg_line_4 ctrlSetFade 1;
	_bg_line_1 ctrlCommit 0;
	_bg_line_2 ctrlCommit 0;
	_bg_line_3 ctrlCommit 0;
	_bg_line_4 ctrlCommit 0;

	[((format ["main_button_button_text_%1",_i]) call _getNextIDC),_grp,[_button_border,_height - (_height / 2),_width - (_button_border * 2),(_height / 2) - (_button_border * 2)],_button_text,1,"SLT_left"] call _makeTextControl;
};

_button_del_f_number = [("button_del_1" call _getNextIDC),[0.263 * safezoneW + safezoneX,0.848 * safezoneH + safezoneY,0.07 * safezoneW,0.044 * safezoneH],"[""f_nubmer"",[]] call SunriseClient_fast_deletebind;","Сбросить ->",0] call _makeButtonNotParentControl;
_button_del_number = [("button_del_2" call _getNextIDC),[0.263 * safezoneW + safezoneX,0.918 * safezoneH + safezoneY,0.07 * safezoneW,0.044 * safezoneH],"[""number"",[]] call SunriseClient_fast_deletebind;","Сбросить ->",0] call _makeButtonNotParentControl;

//make adv info area
[("adv_info" call _getNextIDC),[0.34 * safezoneW + safezoneX,(0.3 * safezoneH + safezoneY),0.267 * safezoneW,0.3 * safezoneH],"",1,[0,0,0,0.8]] call _makeSTextControl;

//load action menu
_posXLM = 0.013 * safezoneW + safezoneX;
_posYLM = 0.11 * safezoneH + safezoneY;
_widthLM = 0.25 * safezoneW;
_heightLM = 0.65 * safezoneH;

_display setVariable ["posXLM",_posXLM];
_display setVariable ["posYLM",_posYLM];
_display setVariable ["widthLM",_widthLM];
_display setVariable ["heightLM",_heightLM];

_grpLM = _display ctrlCreate ["RscControlsGroupNoScrollbars", ("left_area_group" call _getNextIDC)];
_grpLM ctrlSetPosition [_posXLM,_posYLM,_widthLM, _heightLM];
_grpLM ctrlCommit 0;

_display setVariable ["left_area_group_pos",[_posXLM,_posYLM,_widthLM, _heightLM]];

[[0,0,_widthLM,_heightLM],[0,0,0,0.8],_grpLM,("left_bg" call _getNextIDC)] call _makeBackgroundControl;

private _left_menu_title_array = [["Инвентарь","inventory"],/*["Анимации - жесты","gesture"],*/["Анимации - танцы","dance"]/*,["Анимации - позы","pose"]*/];
_display setVariable ["left_menu_title_array",_left_menu_title_array];
private _space_left_menu = 0.01;
_display setVariable ["space_left_menu",_space_left_menu];
//Инвентарь (Физ) + (Вирт)
//Анимации жесты
//Анимации танцы
//Анимации позы

for "_i" from 0 to (count _left_menu_title_array) - 1 do {

	_widthLMB = _widthLM;
	_heightLMB = (_heightLM / 15);
	_posXLMB = 0;
	_posYLMB = ((_space_left_menu * _i) + (_heightLMB * _i));

	_grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", ((format ["left_area_button_group_%1",_i]) call _getNextIDC),_grpLM];
	_grp ctrlSetPosition [_posXLMB,_posYLMB,_widthLMB, _heightLMB];
	_grp ctrlCommit 0;
	
	[[0,0,_widthLMB,_heightLMB],[0.129,0.129,0.129,0.5],_grp,((format ["left_button_bg_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;
	[[0.02,0.02,(_heightLMB - 0.05),_heightLMB - 0.04],(_display getVariable ["picturePlus",""]),_grp,((format ["left_button_pic_%1",_i]) call _getNextIDC)] call _makePictureControl;
	[((format ["left_button_text_%1",_i]) call _getNextIDC),_grp,[0.04 + (_heightLMB - 0.05),0.01,(_widthLMB - 0.05 - (_heightLMB - 0.05)),_heightLMB - 0.02],((_left_menu_title_array select _i) select 0),2,"RscExtremoGui_Text"] call _makeTextControl;

	[((format ["left_button_%1",_i]) call _getNextIDC),_grp,[0,0,_widthLMB, _heightLMB],"",format ["['%1'] spawn SunriseClient_fast_clicktoleftmenubutton",((_left_menu_title_array select _i) select 1)]] call _makeButtonControl;
	//[[0.04 + (_heightLMB - 0.05),0.01,(_widthLMB - 0.05 - (_heightLMB - 0.05)),_heightLMB - 0.02],[1,1,1,1],_grp,((format ["testlm_%1",_i]) call _getNextIDC)] call _makeBackgroundControl;
};

['inventory'] spawn SunriseClient_fast_clicktoleftmenubutton;
