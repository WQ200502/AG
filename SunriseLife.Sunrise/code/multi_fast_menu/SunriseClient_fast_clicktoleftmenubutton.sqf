#include "..\..\script_macros.hpp"
/*

	Filename: 		fn_clickToLeftMenuButton.sqf
	Project: 	  	AmazingLife - RPG
	Author:		  	AmazingTeam
	E-mail:		  	dev@amazingrp.ru
	Web:		      http://amazingrp.ru/

*/
disableSerialization;
private _display = findDisplay 15700;
if (isNull _display) exitWith {diag_log "Error tablet: Init failed, display does not load."};

private _button_name = [_this,0,"",[""]] call BIS_fnc_param;

_open_left_button = _display getVariable ["open_left_button",""];

if (_open_left_button isEqualTo _button_name) exitWith {};
if (_display getVariable ["load_status",false]) exitWith {["info","","Вы делаете это слишком быстро",true] call SunriseClient_message};
_display setVariable ["load_status",true];

_makeButtonControl = _display getVariable "makeButtonControl";
_makePictureControl = _display getVariable "makePictureControl";
_makeTextControl = _display getVariable "makeTextControl";
_makeBackgroundControl = _display getVariable "makeBackgroundControl";
_getNextIDC = _display getVariable "getNextIDC";
_getControl = _display getVariable "getControl";
_changeKeyName = _display getVariable "changeKeyName";

_posXLM = _display getVariable ["posXLM",0];
_posYLM = _display getVariable ["posYLM",0];
_widthLM = _display getVariable ["widthLM",0];
_heightLM = _display getVariable ["heightLM",0];

_left_menu_title_array = _display getVariable ["left_menu_title_array",[]];
_array_map_delete_OLD = _display getVariable ["array_map_delete",[]];
_space_left_menu = _display getVariable ["space_left_menu",0];

//////////////////delete old ctrl//////////////////
private _map = (_display getVariable "map");
private _oldGroup = "left_area_group_items_list" call _getControl;
if !(isNull _oldGroup) then {
  _map = _map - ["left_area_group_items_list"];
  ctrlDelete _oldGroup;
};

{
  _ctrl = _x call _getControl;
    _map = _map - [_x];
  if !(isNull _ctrl) then {
    ctrlDelete _ctrl;
  };
} forEach _array_map_delete_OLD;
_display setVariable ["map",_map];
//////////////////////////////////////////////////

private _status = false;
private _lstGroup = controlNull;
for "_i" from (count _left_menu_title_array) - 1 to 0 step -1 do {
  if (_button_name isEqualTo ((_left_menu_title_array select _i) select 1)) then {

    _display setVariable ["open_left_button",((_left_menu_title_array select _i) select 1)];

    _widthLMB = _widthLM;
    _heightLMB = (_heightLM / 15);
    _posXLMB = 0;
    _posYLMB = (_heightLMB *  _i) + (_space_left_menu * _i);

    _grp = ("left_area_button_group_" + str _i) call _getControl;
    _grp ctrlSetPosition [_posXLMB,_posYLMB,_widthLMB, _heightLMB];
    _grp ctrlCommit (_display getVariable ["buttonSpeed",0]);
    _lstGroup = _grp;

    _picture = ("left_button_pic_" + str _i) call _getControl;
    _picture ctrlSetText (_display getVariable ["pictureMinus",""]);
    _status = true;
  } else {
    if (_status) then {
      _widthLMB = _widthLM;
      _heightLMB = (_heightLM / 15);
    	_posXLMB = 0;
      _posYLMB = (_heightLMB *  _i) + (_space_left_menu * _i);

    	_grp = ("left_area_button_group_" + str _i) call _getControl;
      _grp ctrlSetPosition [_posXLMB,_posYLMB,_widthLMB, _heightLMB];
      _grp ctrlCommit (_display getVariable ["buttonSpeed",0]);
      _lstGroup = _grp;

      _picture = ("left_button_pic_" + str _i) call _getControl;
      _picture ctrlSetText (_display getVariable ["picturePlus",""]);
    } else {
      _widthLMB = _widthLM;
      _heightLMB = (_heightLM / 15);
    	_posXLMB = 0;
      _posYLMB = _heightLM - ((_heightLMB * ((count _left_menu_title_array) - _i)) + (_space_left_menu * ((count _left_menu_title_array) - _i)));

      _grp = ("left_area_button_group_" + str _i) call _getControl;
      _grp ctrlSetPosition [_posXLMB,_posYLMB,_widthLMB, _heightLMB];
      _grp ctrlCommit (_display getVariable ["buttonSpeed",0]);
      _lstGroup = _grp;

      _picture = ("left_button_pic_" + str _i) call _getControl;
      _picture ctrlSetText (_display getVariable ["picturePlus",""]);
    };
  };
};

//ПРИДУМАТЬ ЧТО ДЕЛАТЬ С ЗАДЕРЖКОЙ (ИЗ-ЗА НЕЕ, НЕ ПРАВИЛЬНО РАБОТАЕТ)
waitUntil {ctrlCommitted _lstGroup};

_finaly_array = +[];
switch (_button_name) do {
    case "inventory": {
      _array_magazine = magazines player;
	    _whiteListMagazine = LIFE_SETTINGS(getArray,"array_magazine_hotKey");

      {
        if (_x in _whiteListMagazine) then {
          if (_finaly_array isEqualTo []) then {
            _finaly_array pushBack [_x,1];
          } else {
            _tmparray = +[];
            _tmpArray = _finaly_array apply {_x select 0};
            _index = _tmparray find _x;
            if (_index isEqualTo -1) then {
              _finaly_array pushBack [_x,1];
            } else {
              _count = ((_finaly_array select _index) select 1);
              _count = _count + 1;
              _finaly_array set [_index,[_x,_count]];
            };
          };
        };
      } forEach _array_magazine;
    };
    case "gesture": {
      _cfg = missionConfigFile >> "CfgGesturePlayer";
      for "_i" from 0 to count(_cfg)-1 do {
          _curConfig = _cfg select _i;

          _actionName = configName _curConfig;

        _name = getText(_curConfig >> "name");
        _action = getText(_curConfig >> "action");
        _conditionView = getText(_curConfig >> "conditionView");
        _needVip = getNumber(_curConfig >> "needVip");

        _conditionCompileView = compile _conditionView;
        if (call _conditionCompileView) then {
          _finaly_array pushBack [_action,_needVip];
        };
      };
    };
    case "dance": {
      _cfg = missionConfigFile >> "CfgDancePlayer";
      for "_i" from 0 to count(_cfg)-1 do {
          _curConfig = _cfg select _i;

          _actionName = configName _curConfig;

        _name = getText(_curConfig >> "name");
        _action = getText(_curConfig >> "action");
        _conditionView = getText(_curConfig >> "conditionView");
        _needVip = getNumber(_curConfig >> "needVip");

        _conditionCompileView = compile _conditionView;
        if (call _conditionCompileView) then {
          _finaly_array pushBack [_action,_needVip];
        };
      };
    };
    case "pose": {
      _cfg = missionConfigFile >> "CfgPosePlayer";
      for "_i" from 0 to count(_cfg)-1 do {
          _curConfig = _cfg select _i;

          _actionName = configName _curConfig;

        _name = getText(_curConfig >> "name");
        _action = getText(_curConfig >> "action");
        _conditionView = getText(_curConfig >> "conditionView");
        _needVip = getNumber(_curConfig >> "needVip");

        _conditionCompileView = compile _conditionView;
        if (call _conditionCompileView) then {
          _finaly_array pushBack [_action,_needVip];
        };
      };
    };
    default {
      /* code */
    };
};

_tmp_array = _left_menu_title_array apply {_x select 1};
_find_number_button = _tmp_array find _button_name;

_posXLMP = 0;
_posYLMP = (_heightLM / 15) + _space_left_menu + ((_heightLM / 15) * _find_number_button) + (_space_left_menu * _find_number_button);
_widthLMP = _widthLM;
_heightLMP = _heightLM - (_posYLMP + _space_left_menu + (((_heightLM / 15) + _space_left_menu) * (((count _left_menu_title_array) - 1) - _find_number_button)));

_grpLM = "left_area_group" call _getControl;

_grpLMP = _display ctrlCreate ["RscControlsGroupNoScrollbars", ("left_area_group_items_list" call _getNextIDC),_grpLM];
_grpLMP ctrlSetPosition [_posXLMP,_posYLMP,_widthLMP, _heightLMP];
_grpLMP ctrlCommit 0;

_display setVariable ["left_area_group_items_list_pos",[_posXLMP,_posYLMP,_widthLMP, _heightLMP]];


//[[0,0,_widthLMP,_heightLMP],[1,1,1,0.8],_grpLMP,("test" call _getNextIDC)] call _makeBackgroundControl;

_posXButton = 0;
_posYButton = 0;
_height = 0.044 * safezoneH;

_display setVariable ["widthButton",_widthLMP];
_display setVariable ["heightButton",_height];

_array_map_delete = +[];
{
  _items = _x select 0;
  _countItems = _x select 1;
  _picture = "";
  _name = "";

  switch (_button_name) do {
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

  _button_border = 0.005;

  _grpLMP_button = _display ctrlCreate ["RscControlsGroupNoScrollbars", (format ["left_area_group_items_%1",_forEachIndex] call _getNextIDC),_grpLMP];
  _grpLMP_button ctrlSetPosition [_posXButton,_posYButton,_widthLMP,_height];
  _grpLMP_button ctrlSetEventHandler ["MouseButtonDown",format ['[%1,"down",(_this select 0)] call SunriseClient_fast_mousebuttonhandler',[_button_name,_items,_forEachIndex,_countItems]]];
  _grpLMP_button ctrlSetEventHandler ["MouseButtonUp",format ['[%1,"up",(_this select 0)] call SunriseClient_fast_mousebuttonhandler',[_button_name,_items,_forEachIndex,_countItems]]];
  _grpLMP_button ctrlSetFade 1;
  _grpLMP_button ctrlCommit 0;
  _grpLMP_button ctrlSetFade 0;
  _grpLMP_button ctrlCommit 0.4;

  _posYButton = _posYButton + (_height + _button_border);

  [[0,0,_widthLMP,_height],[0,0,0,0.3],_grpLMP_button,((format ["left_group_items_bg_%1",_forEachIndex]) call _getNextIDC)] call _makeBackgroundControl;
  switch (_button_name) do {
      case "inventory": {
		_itemInfo = [_items] call SunriseClient_fast_fetchcfgdetails;
		_picture = format ["%1",_itemInfo select 2];
		_name = format ["%1",_itemInfo select 1];
		
        [((format ["left_group_items_text_count_%1",_forEachIndex]) call _getNextIDC),_grpLMP_button,[0.005,0,0.05,_height],format["[x%1]",_countItems],1.3,"RscExtremoGui_Text"] call _makeTextControl;
      };
      /*case "gesture": {
        [((format ["left_group_items_text_count_%1",_forEachIndex]) call _getNextIDC),_grpLMP_button,[0.005,0,0.05,_height],format["[%1]",_countItems],1,"RscExtremoGui_Text"] call _makeTextControl;
      };*/
      case "dance": {
        [((format ["left_group_items_text_count_%1",_forEachIndex]) call _getNextIDC),_grpLMP_button,[0.005,0,0.05,_height],format["[%1]",_countItems],1,"RscExtremoGui_Text"] call _makeTextControl;
      };
      /*case "pose": {
        [((format ["left_group_items_text_count_%1",_forEachIndex]) call _getNextIDC),_grpLMP_button,[0.005,0,0.05,_height],format["[%1]",_countItems],1,"RscExtremoGui_Text"] call _makeTextControl;
      };*/
      default {
        /* code */
      };
  };
  [[0.05 + 0.005 + 0.01,0.01,_height - 0.03,_height - 0.02],_picture,_grpLMP_button,((format ["left_group_items_pic_%1",_forEachIndex]) call _getNextIDC)] call _makePictureControl;
  [((format ["left_group_items_text_name_%1",_forEachIndex]) call _getNextIDC),_grpLMP_button,[0.05 + 0.005 + 0.01 + (_height - 0.03),0,(_widthLMP - (0.05 + 0.005 + 0.01 + (_height - 0.03))),_height],_name,1.3,"SLT_left"] call _makeTextControl;

  _array_map_delete pushBack format ["left_area_group_items_%1",_forEachIndex];
  _array_map_delete pushBack format ["left_group_items_bg_%1",_forEachIndex];
  _array_map_delete pushBack format ["left_group_items_text_count_%1",_forEachIndex];
  _array_map_delete pushBack format ["left_group_items_pic_%1",_forEachIndex];
  _array_map_delete pushBack format ["left_group_items_text_name_%1",_forEachIndex];
} forEach _finaly_array;

_display setVariable ["array_map_delete",_array_map_delete];
_display setVariable ["load_status",false];
