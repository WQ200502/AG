/*
	Author: Travis Butassss
	Description: Touch this and Ill kill your mom on gang 
*/

if ((missionNamespace getVariable["mav_ttm_var_relicReward2",0]) isEqualTo 0 && !(player getVariable["killFeed",false])) exitWith {};
_name = param [0];
_message = format ["<t size='0.9px'>你杀了: %1</t>",_name];

AnzusLife_KillfeedControl = AnzusLife_KillfeedControl + 1;
disableSerialization;
{
	_ctrl = (findDisplay 46) displayCtrl _x;

	_pos = ctrlPosition _ctrl;
	_pos set [1,(_pos select 1) + 0.040];

	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlCommit 0.20;
} forEach AnzusLife_KillfeedList;

_display = findDisplay 46;
_ctrl = _display ctrlCreate ["RscStructuredText", AnzusLife_KillfeedControl];
_ctrl ctrlSetPosition [0.45,1,0.4,0.1];
_ctrl ctrlSetStructuredText parseText _message;
_ctrl ctrlSetTextColor [0, 0.6, 0, 1];
_ctrl ctrlSetFont "PuristaSemiBold";
_ctrl ctrlCommit 0;
AnzusLife_KillfeedList pushBack AnzusLife_KillfeedControl;
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 7;
sleep 7;
ctrlDelete _ctrl;