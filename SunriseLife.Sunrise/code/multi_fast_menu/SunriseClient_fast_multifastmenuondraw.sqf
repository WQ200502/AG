#include "..\..\script_macros.hpp"
/*

	Filename: 		fn_initMultiFastMenu.sqf
	Project: 	  	AmazingLife - RPG
	Author:		  	AmazingTeam
	E-mail:		  	dev@amazingrp.ru
	Web:		    http://amazingrp.ru/

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

private _array_map_delete_OLD = _display getVariable ["array_map_delete",[]];
private _left_menu_title_array = _display getVariable ["left_menu_title_array",[]];

private _lastButClick = _display getVariable ["lastButtonClick",[]];
private _buttonGrabbed = _display getVariable ["buttonGrabbed",[]];

private _isButtonGrabbed = if (count _buttonGrabbed == 0) then {false} else {true};
private _isButtonClicked = if (count _lastButClick == 0) then {false} else {true};

//size fake button
_width = _display getVariable ["widthButton",[]];
_height = _display getVariable ["heightButton",[]];

if (_isButtonGrabbed) then {
	private _realBut = ("left_area_group_items_" + str ((_buttonGrabbed select 0) select 2)) call _getControl;
	private _fakeBut = "buttonGrabbedFakeGrp" call _getControl;

		getMousePosition params ["_xm","_ym"];

	for "_i" from 3 to 16 do {
		_dropArea = ("main_area_button_group_" + str _i) call _getControl;
		(ctrlPosition _dropArea) params ["_xp","_y","_w","_h"];
		_bg_line_1 = ((format ["main_button_bg_line_1_%1",_i]) call _getControl);
		_bg_line_2 = ((format ["main_button_bg_line_2_%1",_i]) call _getControl);
		_bg_line_3 = ((format ["main_button_bg_line_3_%1",_i]) call _getControl);
		_bg_line_4 = ((format ["main_button_bg_line_4_%1",_i]) call _getControl);
		if (((_xm>_xp)AND(_xm<(_xp+_w)))AND((_ym>_y)AND(_ym<(_y+_h)))) then {
				if !((_display getVariable ["borderUnFade",-1]) isEqualTo _i) then {
					_display setVariable ["borderUnFade",_i];
					_bg_line_1 ctrlSetFade 0;
					_bg_line_2 ctrlSetFade 0;
					_bg_line_3 ctrlSetFade 0;
					_bg_line_4 ctrlSetFade 0;
					_bg_line_1 ctrlCommit 0.2;
					_bg_line_2 ctrlCommit 0.2;
					_bg_line_3 ctrlCommit 0.2;
					_bg_line_4 ctrlCommit 0.2;
				};
		} else {
			if ((ctrlFade _bg_line_1) isEqualTo 0) then {
				if ((_display getVariable ["borderUnFade",-1]) isEqualTo _i) then {_display setVariable ["borderUnFade",-1]};
				_bg_line_1 ctrlSetFade 1;
				_bg_line_2 ctrlSetFade 1;
				_bg_line_3 ctrlSetFade 1;
				_bg_line_4 ctrlSetFade 1;
				_bg_line_1 ctrlCommit 0;
				_bg_line_2 ctrlCommit 0;
				_bg_line_3 ctrlCommit 0;
				_bg_line_4 ctrlCommit 0;
			};
		};
	};
	(ctrlPosition _fakeBut) params ["_xpf","_yf","_wf","_hf"];
	_fakeBut ctrlSetPosition [_xm - (0.05 + 0.005 + 0.01 + ((_height - 0.03) / 2)),_ym - ((_height - 0.02) / 2)];
	_fakeBut ctrlCommit 0;
};

if (_isButtonClicked AND !_isButtonGrabbed) then {
	_lastButClick params ["_button_info","_time"];
	if ((time - _time) > 0.2) then {
    private _realBut = ("left_area_group_items_" + str (_button_info select 2)) call _getControl;
    if !(isNull _realBut) then {
      _display setVariable ["buttonGrabbed",[_button_info,ctrlPosition _realBut]];
      _realBut ctrlEnable false;
      _realBut ctrlCommit 0;

		_items = (_button_info select 1);
		_countItems = (_button_info select 3);
		_picture = "";
		_name = "";

		  switch (_button_info select 0) do {
		      case "inventory": {
		        _itemInfo = [_items] call SunriseClient_fast_fetchcfgdetails;
		        _picture = format ["%1",_itemInfo select 2];
		        _name = format ["%1",_itemInfo select 1];
		      };
		      case "gesture": {
		        _picture = _display getVariable ["pictureGesture",""];
		        _name = getText(missionConfigFile >> "CfgGesturePlayer" >> _items >> "name");
		      };
		      case "dance": {
		        _picture = _display getVariable ["pictureDance",""];
		        _name = getText(missionConfigFile >> "CfgDancePlayer" >> _items >> "name");
		      };
		      case "pose": {
		        _picture = _display getVariable ["picturePose",""];
		        _name = getText(missionConfigFile >> "CfgPosePlayer" >> _items >> "name");
		      };
		      default {
		        /* code */
		      };
		  };

			getMousePosition params ["_xm","_ym"];
			_buttonGrabbedFakeGrp = _display ctrlCreate ["RscControlsGroupNoScrollbars", ("buttonGrabbedFakeGrp" call _getNextIDC)];
			_buttonGrabbedFakeGrp ctrlSetPosition [_xm,_ym,_width,_height];
			_buttonGrabbedFakeGrp ctrlCommit 0;

			[[0,0,_width,_height],[0,0,0,0.3],_buttonGrabbedFakeGrp,("buttonGrabbedFakeBg" call _getNextIDC)] call _makeBackgroundControl;

			switch (_button_info select 0) do {
		      case "inventory": {			  
		        [("buttonGrabbedFakeTextCount" call _getNextIDC),_buttonGrabbedFakeGrp,[0.005,0,0.05,_height],format["[x%1]",_countItems],1.3,"RscExtremoGui_Text"] call _makeTextControl;
		      };
		      /*case "gesture": {
		        [("buttonGrabbedFakeTextCount" call _getNextIDC),_buttonGrabbedFakeGrp,[0.005,0,0.05,_height],format["[%1]",_countItems],1,"RscExtremoGui_TextF"] call _makeTextControl;
		      };*/
		      case "dance": {
		        [("buttonGrabbedFakeTextCount" call _getNextIDC),_buttonGrabbedFakeGrp,[0.005,0,0.05,_height],format["[%1]",_countItems],1,"RscExtremoGui_Text"] call _makeTextControl;
		      };
		     /* case "pose": {
		        [("buttonGrabbedFakeTextCount" call _getNextIDC),_buttonGrabbedFakeGrp,[0.005,0,0.05,_height],format["[%1]",_countItems],1,"RscExtremoGui_TextF"] call _makeTextControl;
		      };*/
		      default {
		        /* code */
		      };
		  };
			[[0.05 + 0.005 + 0.01,0.01,_height - 0.03,_height - 0.02],_picture,_buttonGrabbedFakeGrp,("buttonGrabbedFakePicture" call _getNextIDC)] call _makePictureControl;
			[("buttonGrabbedFakeTextTitle" call _getNextIDC),_buttonGrabbedFakeGrp,[0.05 + 0.005 + 0.01 + (_height - 0.03),0,(_width - (0.05 + 0.005 + 0.01 + (_height - 0.03))),_height],_name,1.3,"SLT_left"] call _makeTextControl;

			_main_group = "left_area_group" call _getControl;
			_main_group ctrlSetPosition [safezoneX,safezoneY,safezoneW,safezoneH];
			_main_group ctrlCommit 0;
		
			_sub_group = "left_area_group_items_list" call _getControl;
			_sub_group ctrlSetPosition [0,0,safezoneW,safezoneH];
			_sub_group ctrlCommit 0;

      //fade
      _main_bg = "left_bg" call _getControl;
      _main_bg ctrlSetFade 1;
      _main_bg ctrlCommit 0;
      for "_i" from 0 to (count _left_menu_title_array) - 1 do {
        _tmp = (format ["left_area_button_group_%1",_i]) call _getControl;
        _tmp ctrlSetFade 1;
        _tmp ctrlCommit 0;
      };

			{
			  	_ctrl = _x call _getControl;
					_ctrl ctrlSetFade 1;
	        _ctrl ctrlCommit 0;
			} forEach _array_map_delete_OLD;

		};
		_display setVariable ["lastButtonClick",[]];
	};
};

if (!_isButtonClicked AND !_isButtonGrabbed) then {
	for "_i" from 0 to 16 do {
		_dropArea = ("main_area_button_group_" + str _i) call _getControl;
		(ctrlPosition _dropArea) params ["_xp","_y","_w","_h"];
		getMousePosition params ["_xm","_ym"];
		if (((_xm>_xp)AND(_xm<(_xp+_w)))AND((_ym>_y)AND(_ym<(_y+_h)))) then {
			if !((_display getVariable ["advInfo",-1]) isEqualTo _i) then {
					_display setVariable ["advInfo",_i];
				_arrayInfo = ["",""];
				switch (_i) do {
					case 0: {
							if !(primaryWeapon player isEqualTo "") then {
								_arrayInfo = ["inventory",primaryWeapon player];
							};
					};
					case 1: {

							if !(secondaryWeapon player isEqualTo "") then {
								_arrayInfo = ["inventory",secondaryWeapon player];
							};
					};
					case 2: {
							if !(handgunWeapon player isEqualTo "") then {
								_arrayInfo = ["inventory",handgunWeapon player];
							};
					};
					default {
								if (_i <= 8) then {
									_arrayInfo = (bind_number_array select (_i - 3));
								} else {
									_arrayInfo = (bind_f_number_array select (_i - 9));
								};
						};
				};

				_type_name = _arrayInfo select 0;
				_item = _arrayInfo select 1;

				if (!(_type_name isEqualTo "") && !(_item isEqualTo "")) then {
					_picture = "";
					_name = "";
					_desc = "";
					switch (_type_name) do {
							case "inventory": {
								_itemInfo = [_item] call SunriseClient_fast_fetchcfgdetails;
								_picture = format ["%1",_itemInfo select 2];
								_name = _itemInfo select 1;
								_desc = _itemInfo select 9;
							};
							case "gesture": {
								_picture = _display getVariable ["pictureGesture",""];
								_name = getText(missionConfigFile >> "CfgGesturePlayer">> _item >> "name");
								_desc = getText(missionConfigFile >> "CfgGesturePlayer">> _item >> "description");
							};
							case "dance": {
								_picture = _display getVariable ["pictureDance",""];
								_name = getText(missionConfigFile >> "CfgDancePlayer">> _item >> "name");
								_desc = getText(missionConfigFile >> "CfgDancePlayer">> _item >> "description");
							};
							case "pose": {
								_picture = _display getVariable ["picturePose",""];
								_name = getText(missionConfigFile >> "CfgPosePlayer">> _item >> "name");
								_desc = getText(missionConfigFile >> "CfgPosePlayer">> _item >> "description");
							};
							default {
								/* code */
							};
					};

					_adv_info = "adv_info" call _getControl;

					if (isNull (missionNamespace getVariable ["MFM_adv_info_handler",objNull])) then {
						MFM_adv_info_handler = [_adv_info,_picture,_name,_desc,_display] spawn {
							disableSerialization;

							_adv_info = _this select 0;
							_picture = _this select 1;
							_name = _this select 2;
							_desc = _this select 3;
							_display= _this select 4;

							_adv_info ctrlSetStructuredText parseText format ["<t align='center'><img size='6' shadow='0' image='%1'/></t><br/><t size='1.5' align='center'>%2</t><br/><br/><t size='1' align='center'>%3</t>",_picture,_name,_desc];

							//Изменяем размеры окна под текст
							_positionText = ctrlPosition _adv_info;
							_yText = _positionText select 1;
							_hText = ctrlTextHeight _adv_info;
							_adv_info ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];

							_adv_info ctrlSetFade 0;
							_adv_info ctrlCommit 0;

							uiSleep 1;

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
							_picture = _this select 1;
							_name = _this select 2;
							_desc = _this select 3;
							_display= _this select 4;

							_adv_info ctrlSetStructuredText parseText format ["<t align='center'><img size='6' shadow='0' image='%1'/></t><br/><t size='1.5' align='center'>%2</t><br/><br/><t size='1' align='center'>%3</t>",_picture,_name,_desc];

							//Изменяем размеры окна под текст
							_positionText = ctrlPosition _adv_info;
							_yText = _positionText select 1;
							_hText = ctrlTextHeight _adv_info;
							_adv_info ctrlSetPosition [_positionText select 0, _yText, _positionText select 2, _hText];

							_adv_info ctrlSetFade 0;
							_adv_info ctrlCommit 0;

							uiSleep 1;

							if (isNull _display) exitWith {};
							_adv_info ctrlSetFade 1;
							_adv_info ctrlCommit 0.1;

							_display setVariable ["advInfo",-1];
						};
					};
				};
			};
		};
	};
};
