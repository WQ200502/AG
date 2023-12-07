#include "..\..\script_macros.hpp"


private ["_unit"];
_unit = cursorTarget;

//Checks first
if(playerSide != civilian) exitWith {["你以为你是谁？下班后用这个!",false,"slow"] call anzus_fnc_notificationSystem;};
if(vehicle player != player) exitWith {};
if(!canMove _unit) exitWith {["您可以将NOS放在这辆车上，但必须先修理!",false,"slow"] call anzus_fnc_notificationSystem;};
if(!([false, "vehnos",1] call anzus_fnc_handleInv)) exitWith {}; //Make sure theres no exploiting.

    life_action_inUse = true;
    _woooooooooooopwoop = "Installing Nitrous";
	_done = false; // so the if statement isnt retarded sir

    //Setup the progress bar
    _title = _woooooooooooopwoop;
    _icon = "\AnzusLifeCore\images\displays\displayInteractionMenu\repair.paa";

    disableSerialization;
    "progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
    _ui = uiNamespace getVariable "AnzusLife_Progress";
    _controlsGroup = _ui displayCtrl 1;
    _progress = _controlsGroup controlsGroupCtrl 3;
    _pgText = _controlsGroup controlsGroupCtrl 2;
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
    _add = 0.01;
    _progress progressSetPosition _add;
    _cP = _add;

    for "_i" from 0 to 1 step 0 do {
        if (animationState player != "Acts_carFixingWheel") then {
            playSound "repair";
            [player,"Acts_carFixingWheel",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
            player switchMove "Acts_carFixingWheel";
            player playMoveNow "Acts_carFixingWheel";
            player disableAI "anim"; 
        };

        sleep 0.15;
		_cP = _cP + _add;
        _progress progressSetPosition _cP;
        _precentage = str round(_cP * 100) + "%";
        _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

        if(_cP >=1) exitWith {_done = true;};
		if(player distance _unit > 5) exitWith {["NOS 安装失败！您必须在距离车辆 5 米以内.",false,"slow"] call anzus_fnc_notificationSystem;};
		if(!alive player) exitWith {_done = true; life_action_inUse = false;};
		if(life_istazed) exitWith {_done = true; life_action_inUse = false;};
		if(speed player > 5) exitWith {["You cant install NOS while driving!",false,"slow"] call anzus_fnc_notificationSystem;};
        if (player getVariable ["inHostage",false]) exitWith {};
        if (!alive player) exitWith {};
        if !(isNull objectParent player) exitWith {};
        if (life_interrupted) exitWith {};
    };

    life_action_inUse = false;
    "progressBar" cutText ["","PLAIN"];
    player switchMove "stop";
	_done = true;
    if (player getVariable ["inHostage",false]) exitWith {["您被劫为人质，行动被取消.","true","slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
    if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
    if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];life_action_inUse = false;};

    sleep 1;
    player switchMove "Stand";

if(_done) then {
	_unit setVariable ["vehnos",4,true];
	titleText ["您已经成功安装了NOS。您有4个NOS Boost's.","PLAIN"]; titleFadeOut 2;
	sleep 3;
	["When driving, press 5 to activate!",false,"slow"] call anzus_fnc_notificationSystem;
};
