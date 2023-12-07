/*
  ===================================================================
  	File: fn_init_helpGui.sqf
  	Author: Asaayu
  	Description: Adds topics to the listbox and displays their info when selected.
  ===================================================================
*/

{
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
  _x ctrlSetFade 0;
  _x ctrlCommit 0.25;
}forEach (allControls (findDisplay 5000));

_listBox = ((findDisplay 5000) displayCtrl 104);
_infoBox = ((findDisplay 5000) displayCtrl 103);
_topText = ((findDisplay 5000) displayCtrl 101);
lbClear _listBox;

_class = missionconfigFile >> "HelpGui";

(findDisplay 5000) displayAddEventHandler ["KeyDown", "if ((_this select 1) isEqualTo 1) then {[] spawn { uisleep 0.01; {  _x ctrlSetFade 1;  _x ctrlCommit 0.25; }forEach (allControls (findDisplay 5000)); uisleep 0.5;(findDisplay 5000) closeDisplay 0};true};"];
helpGui_topText = [getText (_class select 0),getText (_class select 1),getText (_class select 2)];

helpGui_topics = ("true" configClasses (missionConfigFile >> "HelpGui"));

if !(isNil "helpGui_topText") then {
  if (helpGui_topText isEqualType []) then {
    _topText ctrlSetStructuredText parseText format["<t font='RobotoCondensed' align='left'>%1</t><t font='RobotoCondensed' align='center'>%2</t><t font='RobotoCondensed' align='right'>%3</t>",helpGui_topText # 0,helpGui_topText # 1,helpGui_topText # 2];
    _topText ctrlSetTooltip (helpGui_topText # 3);
  }else{
    "'helpGui_topText' is not type ARRAY" call BIS_fnc_error;
  };
}else{
  "'helpGui_topText' does not exist" call BIS_fnc_error;
};

if !(isNil "helpGui_topics") then {
  if (helpGui_topics isEqualType []) then {
    {
      _listBox lbAdd (getText(_x select 0));
      _listBox lbSetPicture [((lbSize _listBox) - 1),(getText(_x select 1))];
      _listBox lbSetData [((lbSize _listBox) - 1), (getText(_x select 2))];
    } forEach helpGui_topics;
    _listBox lbSetCurSel 0;
    _listBox ctrlSetEventHandler ["LBSelChanged", "[] spawn {_listBox = ((findDisplay 5000) displayCtrl 104); _infoBox = ((findDisplay 5000) displayCtrl 103); _infoBox ctrlSetFade 1; _infoBox ctrlCommit 0.5; uisleep 0.5; _infoBox ctrlSetStructuredText parseText format[""<t align='left'>%1</t>"",_listBox lbData (lbCurSel _listBox)]; _height = ctrlTextHeight _infoBox; if (_height > (0.44 * safezoneH)) then { [_infoBox] call BIS_fnc_ctrlTextHeight; }else{ _infoBox ctrlSetPosition [0,0,0.299062 * safezoneW,0.44 * safezoneH]; }; _infoBox ctrlSetFade 0; _infoBox ctrlCommit 0.5};"];
    _infoBox ctrlSetStructuredText parseText format["<t align='left'>%1</t>",_listBox lbData (lbCurSel _listBox)];
    _height = ctrlTextHeight _infoBox;
    if (_height > (0.44 * safezoneH)) then {
      [_infoBox] call BIS_fnc_ctrlTextHeight;
    }else{
      _infoBox ctrlSetPosition [0,0,0.299062 * safezoneW,0.44 * safezoneH];
    };

  }else{
    "'helpGui_topics' is not type ARRAY" call BIS_fnc_error;
  };
}else{
    "'helpGui_topics' does not exist" call BIS_fnc_error;
};
