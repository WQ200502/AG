#include "..\..\script_macros.hpp"
/*
    File: fn_bloodDrive.sqf
    Author: Fresqo
    Description: takes blood from player
	Improved by ANZUS
*/
private["_targetName","_ui","_progressBar","_titleText","_cP","_title"];
params [
    ["_target",objNull,[objNull]],
    ["_taker",objNull,[objNull]]
];

if (isNull _target || !alive _target || isNull _taker || !alive _taker) exitWith {};
if (_target distance _taker > 4) exitWith {hint "The patient is too far away"};

//Fetch their name so we can shout it.
_targetName = name _target;
if (_target getVariable["givingBlood",false]) exitWith {hint "该患者目前已经在输血!"};
if (life_action_inUse) exitWith {hint "您已经在某事中间"};
life_action_inUse = true; //Lockout the controls.
_target setVariable ["givingBlood",true,true];
//Setup our progress bar
_title = "Drawing blood from patient";
_icon = "\AnzusLifeCore\images\displays\displayInteractionMenu\pullout.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progressBar = _controlsGroup controlsGroupCtrl 3;
_titleText = _controlsGroup controlsGroupCtrl 2;
_titleText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, str("1" + "%"), (100 * (pixelH * pixelGrid * 0.50))];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
while {true} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep .15;
	_cP = _cP + .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
	if((player getVariable ["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;[] call ANZUS_fnc_hudUpdate;_target setVariable ["givingBlood",false,true];};
if((player getVariable ["restrained",false])) exitWith {life_action_inUse = false;[] call ANZUS_fnc_hudUpdate;_target setVariable ["givingBlood",false,true];};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;[] call ANZUS_fnc_hudUpdate;_target setVariable ["givingBlood",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;[] call ANZUS_fnc_hudUpdate;_target setVariable ["givingBlood",false,true];};
[] call ANZUS_fnc_hudUpdate;
_target setVariable ["givingBlood",false,true];
private _b = _target getVariable["bloodtype",[]];
if (count _b isEqualTo 0) exitWith {diag_log "MEDIC ERROR1"};
private _bGive = _b select 0;
if (_bGive isEqualTo "") exitWith {diag_log "MEDIC ERROR2"};
_b set[2,((_b select 2) + 1)];
_target setVariable ["bloodtype",_b,true];
private _toGive = 5;

private _amount = round (random (2) + _toGive);
if(([true,_bGive,_amount] call ANZUS_fnc_handleInv)) then {
	hint format["You have successfully taken (x%1) blood vial from %2",_amount,_targetName];
	[] remoteExec ["ANZUS_fnc_medBDpayout",_target];
	private _bType = _target getVariable ["bloodtype",[]];
        if ((_bType param [2,0,[0]]) > (_bType param [1,0,[0]])) then
	{
	    [_target,_taker] remoteExec ["ANZUS_fnc_medBDeffect",_target];
	};
} else {hint "You cannot take any blood at the moment"};
life_action_inUse = false;
