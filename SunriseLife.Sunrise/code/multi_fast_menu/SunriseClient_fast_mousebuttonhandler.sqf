#include "..\..\script_macros.hpp"
/*

	Filename: 		fn_mouseButtonHandler.sqf
	Project: 	  	AmazingLife - RPG
	Author:		  	AmazingTeam
	E-mail:		  	dev@amazingrp.ru
	Web:		      http://amazingrp.ru/

*/
disableSerialization;
private _display = findDisplay 15700;
if (isNull _display) exitWith {diag_log "Error tablet: Init failed, display does not load."};

private _makeButtonControl = _display getVariable "makeButtonControl";
private _makePictureControl = _display getVariable "makePictureControl";
private _makeTextControl = _display getVariable "makeTextControl";
private _makeBackgroundControl = _display getVariable "makeBackgroundControl";
private _getNextIDC = _display getVariable "getNextIDC";
private _getControl = _display getVariable "getControl";
private _changeKeyName = _display getVariable "changeKeyName";
private _checkMouseOverCtrl = _display getVariable "checkMouseOverCtrl";

private _button_info = [_this,0,[],[[]]] call BIS_fnc_param;
private _cmd = [_this,1,"",[""]] call BIS_fnc_param;
private _clickedCtrl = [_this,2,controlNull,[controlNull]] call BIS_fnc_param;

private _array_map_delete_OLD = _display getVariable ["array_map_delete",[]];
private _map = (_display getVariable "map");

private _buttonGrabbed = _display getVariable ["buttonGrabbed",[]];
private _lastButClick = _display getVariable ["lastButtonClick",[]];
private _isButtonGrabbed = if (count _buttonGrabbed == 0) then {false} else {true};
private _isButtonClicked = if (count _lastButClick == 0) then {false} else {true};

_left_menu_title_array = _display getVariable ["left_menu_title_array",[]];

if (_cmd == "down") then {
	if (_isButtonGrabbed) then {
	} else {
		_display setVariable ["lastButtonClick",[_button_info,time]];
	};
};

if (_cmd == "up") then {
	if (_isButtonGrabbed) then {
    _display setVariable ["buttonGrabbed",[]];
		private _realBut = ("left_area_group_items_" + str ((_buttonGrabbed select 0) select 2)) call _getControl;
		private _fakeBut = "buttonGrabbedFakeGrp" call _getControl;
		getMousePosition params ["_xm","_ym"];

		for "_i" from 3 to 16 do {
			private _dropArea = ("main_area_button_group_" + str _i) call _getControl;
			(ctrlPosition _dropArea) params ["_xp","_y","_w","_h"];
			if (((_xm>_xp)AND(_xm<(_xp+_w)))AND((_ym>_y)AND(_ym<(_y+_h)))) then {
				_type_name = ((_buttonGrabbed select 0) select 0);
				_item = ((_buttonGrabbed select 0) select 1);
				_count_or_vip = ((_buttonGrabbed select 0) select 3);

				_notAllowed = false;

				_ctrlPicture = ("main_button_pic_" + str _i) call _getControl;
				_picture = "";

				switch (_type_name) do {
			      case "inventory": {
			        _itemInfo = [_item] call SunriseClient_fast_fetchcfgdetails;
							_picture = format ["%1",_itemInfo select 2];
			      };
			      case "gesture": {
			        _picture = _display getVariable ["pictureGesture",""];
							if (_count_or_vip > (call life_donorlevel)) then {_notAllowed = true};
			      };
			      case "dance": {
			        _picture = _display getVariable ["pictureDance",""];
							if (_count_or_vip > (call life_donorlevel)) then {_notAllowed = true};
			      };
			      case "pose": {
			        _picture = _display getVariable ["picturePose",""];
							if (_count_or_vip > (call life_donorlevel)) then {_notAllowed = true};
			      };
			      default {
			        /* code */
			      };
			  };

				_bg_line_1 = ((format ["main_button_bg_line_1_%1",_i]) call _getControl);
				_bg_line_2 = ((format ["main_button_bg_line_2_%1",_i]) call _getControl);
				_bg_line_3 = ((format ["main_button_bg_line_3_%1",_i]) call _getControl);
				_bg_line_4 = ((format ["main_button_bg_line_4_%1",_i]) call _getControl);

				_bg_line_1 ctrlSetFade 1;
				_bg_line_2 ctrlSetFade 1;
				_bg_line_3 ctrlSetFade 1;
				_bg_line_4 ctrlSetFade 1;
				_bg_line_1 ctrlCommit 0.2;
				_bg_line_2 ctrlCommit 0.2;
				_bg_line_3 ctrlCommit 0.2;
				_bg_line_4 ctrlCommit 0.2;

				if (_notAllowed) exitWith {
					_adv_info = "adv_info" call _getControl;
					if (isNull (missionNamespace getVariable ["MFM_adv_info_handler",objNull])) then {
						MFM_adv_info_handler = [_adv_info,_display] spawn {
							disableSerialization;

							_adv_info = _this select 0;
							_display= _this select 1;

							_adv_info ctrlSetStructuredText parseText "<t size='1' align='center'><br/>Ошибка, бинд недоступен. Больше информации на lk.amazingrp.ru<br/><br/></t>";

							//Изменяем размеры окна под текст
							_positionText = ctrlPosition _adv_info;
							_yText = _positionText select 1;
							_hText = ctrlTextHeight _adv_info;
							_adv_info ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];

							_adv_info ctrlSetFade 0;
							_adv_info ctrlCommit 0;

							uiSleep 5;

							if (isNull _display) exitWith {};
							_adv_info ctrlSetFade 1;
							_adv_info ctrlCommit 0.1;

							_display setVariable ["advInfo",-1];
						};
					} else {
						terminate MFM_adv_info_handler;
						MFM_adv_info_handler = [_adv_info,_picture,_name,_desc,_display] spawn {
							disableSerialization;

							_adv_info = _this select 0;
							_display= _this select 1;

							_adv_info ctrlSetStructuredText parseText "<t size='1' align='center'><br/>Ошибка, бинд недоступен. Больше информации на lk.amazingrp.ru<br/><br/></t>";

							//Изменяем размеры окна под текст
							_positionText = ctrlPosition _adv_info;
							_yText = _positionText select 1;
							_hText = ctrlTextHeight _adv_info;
							_adv_info ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];

							_adv_info ctrlSetFade 0;
							_adv_info ctrlCommit 0;

							uiSleep 5;

							if (isNull _display) exitWith {};
							_adv_info ctrlSetFade 1;
							_adv_info ctrlCommit 0.1;

							_display setVariable ["advInfo",-1];
						};
					};
				};

				_ctrlPicture ctrlSetText _picture;

				//save data
				switch (true) do {
					case (_i <= 8): {
						bind_number_array set [(_i - 3),[_type_name,_item]];
					};
					default {
						bind_f_number_array set [(_i - 9),[_type_name,_item]];
					};
				};
			};
		};

    _prePos = (_buttonGrabbed select 1);
    _realBut ctrlEnable true;
  	_realBut ctrlCommit 0;

		_map = _map - ["buttonGrabbedFakeGrp","buttonGrabbedFakeTextCount","buttonGrabbedFakePicture","buttonGrabbedFakeTextTitle","buttonGrabbedFakeBg"];
		_display setVariable ["map",_map];
		ctrlDelete _fakeBut;


    _pos_main = _display getVariable ["left_area_group_pos",[]];
    _pos_sub = _display getVariable ["left_area_group_items_list_pos",[]];

    _main_group = "left_area_group" call _getControl;
    _main_group ctrlSetPosition _pos_main;
    _main_group ctrlCommit 0;

    _sub_group = "left_area_group_items_list" call _getControl;
    _sub_group ctrlSetPosition _pos_sub;
    _sub_group ctrlCommit 0;

    //unfade
    _main_bg = "left_bg" call _getControl;
    _main_bg ctrlSetFade 0;
    _main_bg ctrlCommit 0.3;
    for "_i" from 0 to (count _left_menu_title_array) - 1 do {
      _tmp = (format ["left_area_button_group_%1",_i]) call _getControl;
      _tmp ctrlSetFade 0;
      _tmp ctrlCommit 0.3;
    };

		{
				_ctrl = _x call _getControl;
				_ctrl ctrlSetFade 0;
				_ctrl ctrlCommit 0.2;
		} forEach _array_map_delete_OLD;
  } else {
			switch (_button_info select 0) do {
			    case "gesture": {
			      [(_button_info select 1)] call SunriseClient_system_gestureMenu;
			    };
			    case "dance": {
			      [(_button_info select 1)] spawn SunriseClient_system_gestureMenuFun;
			    };
			    case "pose": {
			      [(_button_info select 1)] spawn life_fnc_pose;
			    };
			    default {
			      /* code */
			    };
			};
	};
  _display setVariable ["lastButtonClick",[]];
};
