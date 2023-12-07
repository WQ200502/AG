#include "..\..\script_macros.hpp"

if !(isNull(objectParent player)) exitWith {["您不能在车辆中使用绷带!.","false","slow"] call ANZUS_fnc_notificationSystem;};
if (ITEM_VALUE("bandage") < 1) exitWith {["你没有绷带!","false","slow"] call ANZUS_fnc_notificationSystem;};

_heal = 0.25;
_heal = _heal - (missionNamespace getVariable ["mav_ttm_var_bandage", 0]);

if (damage player > _heal || (player getHit "legs") >= 0.5) then {
	closeDialog 0;
	life_action_inUse = true;

	_title = "Bandaging Wounds";
    _icon = "\AnzusLifeCore\images\displays\displayCommunicationTargets\medical.paa";

    disableSerialization;
    "progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
    _ui = uiNamespace getVariable "AnzusLife_Progress";
    _controlsGroup = _ui displayCtrl 1;
    _progress = _controlsGroup controlsGroupCtrl 3;
    _pgText = _controlsGroup controlsGroupCtrl 2;
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

    for "_i" from 0 to 1 step 0 do {
        if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
            [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
            player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
            player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            player disableAI "anim";
        };

        sleep 0.40;
        _cP = _cP + 0.2;
        _progress progressSetPosition _cP;
        _precentage = str round(_cP * 100) + "%";
        _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

        if (_cP >= 1) exitWith {};
        if (player getVariable ["inHostage",false]) exitWith {};
        if (!alive player) exitWith {};
        if !(isNull objectParent player) exitWith {};
        if (life_interrupted) exitWith {};
    };

    life_action_inUse = false;
    "progressBar" cutText ["","PLAIN"];
    player playActionNow "stop";
    if (player getVariable ["inHostage",false]) exitWith {["您被劫为人质，行动被取消.","false","slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false;};
    if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
    if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

	[false,"bandage",1] call ANZUS_fnc_handleInv;
	[format["你用绷带包扎了。 你的惠普现在 %1",((100 - ((100 * _heal))))],"true","slow"] call ANZUS_fnc_notificationSystem;
	sleep 1;
    if ((damage player) > _heal) then {
        player setDamage _heal;
    };
    player setHit ["legs",0];
} else {
	[format["You must be be below %1 HP to heal with a bandage.",((100 - ((100 * _heal))))],true,"slow"] call ANZUS_fnc_notificationSystem;
};
