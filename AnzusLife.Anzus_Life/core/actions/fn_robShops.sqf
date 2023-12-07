#include "..\..\script_macros.hpp"
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring","_oldRob"];
params [
	["_shop",objNull,[objNull]],
	["_robber",objNull,[objNull]]
];

_oldRob = (_shop getVariable ["robbing", objNull]);
_blacklistedWeapons = MAIN_SETTINGS_TYPE(getArray,"MajorCrimes","blacklistedWeapons");
if ((west countSide playableUnits) < 2) exitWith {[format["在线有 %1 警察在线,需要2名警察." ,(west countSide playableUnits)],"false","slow"] call ANZUS_fnc_notificationSystem;};
if(!(side _robber isEqualTo civilian)) exitWith {["你觉得你在做什么?","true","slow"] call ANZUS_fnc_notificationSystem;};
if((_oldRob isEqualTo player) || !(_oldRob isEqualTo objNull)) exitWith {["这家商店已经被抢劫了, 没有东西可抢劫!","false","slow"] call ANZUS_fnc_notificationSystem;};
if(_robber distance _shop > 10) exitWith {["你必须在10米以内才能抢劫这家商店!","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(isNull (objectParent player)) exitWith {["离开你的车!","true","slow"] call ANZUS_fnc_notificationSystem;};
if ((_shop getVariable ["robTime",0]) >= time) exitWith {["这家商店最近被抢劫了!","false","slow"] call ANZUS_fnc_notificationSystem;};
if (currentWeapon _robber isEqualTo "") exitWith {["如果没有适当的设备，您无法抢劫任何人，请先拿枪!","false","slow"] call ANZUS_fnc_notificationSystem;};
if ((currentWeapon _robber) in _blacklistedWeapons) exitWith {["你别用这个吓唬我，这是个玩笑吗?","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(alive _robber) exitWith {};

_var = missionNamespace getVariable ["AnzusLife_StartTime",time];
if ((time - _var) < 600) exitWith {["我的商店刚刚建立，请给我10分钟的正常运行时间，然后再抢劫!","true","slow"] call ANZUS_fnc_notificationSystem;};

_distanceFromCapital = (player distance [8569,6598,0]) * 1.5;
_rand = (random [5000,20000,35000]);

_kassa = _rand - _distanceFromCapital;
if (_kassa < 0) then {
    _kassa = (random [5000,6000,8500]);
};

_kassa = round _kassa;
_shop setVariable ["robbing", player, true];

_getlocation = [_shop] call AnzusLife_Lib_GetNearestLocation;
[format["报警！- 附近正在进行抢劫 %1", _getlocation],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",west];

//Setup the progress bar
_title = "抢劫商店，保持在10m之内";
_icon = "\AnzusLifeCore\images\displays\displayCommunicationTargets\police.paa";

disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_progress progressSetPosition 0.01;
_cP = 0.01;

_rndmrk = random(1000);
_mrkstring = format ["wrgMarker_%1", _rndmrk];
[_mrkstring,[0,0,0],"Robbery"] remoteExec ["AnzusLife_Lib_CreateMarker", 2];
while {true} do
{
	uiSleep 3.00;
	_cP = _cP + (0.01 * (missionNamespace getVariable ["mav_ttm_var_robbingMultiplier", 1]));
	_progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];

	if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
	if (!alive _robber) exitWith {};
	if (_robber distance _shop > 10) exitWith {};
	if ((_robber getVariable["restrained",false])) exitWith {};
	if (!((_shop getVariable ["robbing", objNull]) isEqualTo player)) exitWith {};
	if (life_istazed) exitWith {};
	if (currentWeapon _robber isEqualTo "" || (currentWeapon _robber) in _blacklistedWeapons) exitWith {};
	if !(isNull objectParent player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];
if (!((_shop getVariable ["robbing", objNull]) isEqualTo player)) exitWith { ["你不是在抢商店.","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};
_shop setVariable ["robbing", objNull, true];
if!(alive _robber) exitWith {  call ANZUS_fnc_hudUpdate;  };
if(_robber distance _shop > 10) exitWith {  ["你太远了，抢劫失败了!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"];call ANZUS_fnc_hudUpdate; };
if(_robber getVariable "restrained") exitWith {  ["你被捕了!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate; };
if(life_istazed) exitWith { ["你被击倒了!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate; };
if (_robber getVariable ["inHostage",false]) exitWith {["您被劫为人质，行动被取消.","true","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"];call ANZUS_fnc_hudUpdate;};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};
if (currentWeapon _robber isEqualTo "") exitWith {["没有合适的装备，你不能抢劫任何人，先拿枪!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};
if ((currentWeapon _robber) in _blacklistedWeapons) exitWith {["你别用这个吓唬我，这是个玩笑吗?","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};

_shop setVariable ["robTime", time + 600, true];

_noATMTime = MAIN_SETTINGS_TYPE(getNumber,"MajorCrimes","noatm_timer");
[_noATMTime] spawn {
    params["_noATMTime",5,[5]];
	life_use_atm = false;
	sleep 60 * _noATMTime;
	life_use_atm = true;
};

[format["You have recieved $%1 from the robbery, run!!",[_kassa] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
[_kassa] call cKGySJkJHNXbPgorKa;

["robshop"] spawn mav_ttm_fnc_addExp;
[] call ANZUS_fnc_hudSetup;
[0] call ANZUS_fnc_updatePartial;

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _robber];
if!(alive _robber) exitWith {};

[format["警方消息：一家商店刚刚被抢：被偷的钱是 $%1!",[_kassa] call ANZUS_fnc_numberText],"true","slow"] remoteExec ["ANZUS_fnc_notificationSystem",west];
[_robber,13] spawn AnzusLife_CREATEEVIDENCE;

if (!isNil {(group player) getVariable ["gang_name",""]}) then {
    _oldamm = (group player) getVariable ["AnzusLife_GasRobberys",0];
    _ammedit = _oldamm + 1;
    (group player) setVariable ["AnzusLife_GasRobberys",_ammedit,true];

    if ((group player) getVariable ["AnzusLife_GasRobberys",0] >= 19) then {
        _gangrole = (group player) getVariable ["gang_role",[]];
        if (_gangrole isEqualTo []) exitWith {};

        _gangselect = _gangrole select 0;
        if (_gangselect != 0) then {
            _task = "Armed Robbery";
            _check = [_task,_gangselect] call AnzusLife_Lib_CheckTask;
            if (!_check) then {
                [_task] remoteExec ["AnzusLife_UnlockTask",2];
                (group player) setVariable ["AnzusLife_GasRobberys",nil,true];
            };
        };
    };
};
