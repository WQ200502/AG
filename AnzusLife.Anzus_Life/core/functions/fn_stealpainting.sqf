#include "..\..\script_macros.hpp"
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring","_oldRob"];
params [
	["_shop",objNull,[objNull]],
	["_robber",objNull,[objNull]]
];
 _var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
 _thanksjimbo = missionNamespace getVariable ["jimbohelpeddoug",false];
 _formatTime = [(1800 - (ceil(serverTime - _var))), "MM", false] call BIS_fnc_secondsToString;
 if ((time - _var) < 1800) exitWith {[format["最近发生了重大犯罪，您必须等待 %1 更多分钟.",_formatTime],true,"slow"] call ANZUS_fnc_notificationSystem;};
_oldRob = (_shop getVariable ["robbing", objNull]);

_blacklistedWeapons = MAIN_SETTINGS_TYPE(getArray,"MajorCrimes","blacklistedWeapons");
if ((west countSide playableUnits) < 5) exitWith {[format["有 %1 警察在线, 需要5警察才能抢劫美术馆." ,(west countSide playableUnits)],"false","slow"] call ANZUS_fnc_notificationSystem;};
if(!(side _robber isEqualTo civilian)) exitWith {["你觉得你在做什么?","true","slow"] call ANZUS_fnc_notificationSystem;};
if(_thanksjimbo) exitWith {["美术馆已经被抢劫，没有垃圾信息被抢劫!","false","slow"] call ANZUS_fnc_notificationSystem;};
if((_oldRob isEqualTo player) || !(_oldRob isEqualTo objNull)) exitWith {["美术馆已经被抢劫，没有垃圾信息被抢劫!","false","slow"] call ANZUS_fnc_notificationSystem;};
if(_robber distance _shop > 15) exitWith {["您需要15米之内才能抢走这幅画!","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(isNull (objectParent player)) exitWith {["离开你的车辆!","true","slow"] call ANZUS_fnc_notificationSystem;};
if ((_shop getVariable ["robTime",0]) >= time) exitWith {["这幅画最近被盗了!","false","slow"] call ANZUS_fnc_notificationSystem;};
if (currentWeapon _robber isEqualTo "") exitWith {["没有适当的装备你就不能抢劫任何人, get a gun first!","false","slow"] call ANZUS_fnc_notificationSystem;};

if ((currentWeapon _robber) in _blacklistedWeapons) exitWith {["你别用这个吓唬我，这是个玩笑吗?","false","slow"] call ANZUS_fnc_notificationSystem;};
if !(alive _robber) exitWith {};

_var = missionNamespace getVariable ["AnzusLife_StartTime",time];
if ((time - _var) < 600) exitWith {["我的商店刚刚建立，请给我10分钟的正常运行时间，然后再抢劫!","true","slow"] call ANZUS_fnc_notificationSystem;};

_shop setVariable ["robbing", player, true];
jimbohelpeddoug = true;
publicVariable "jimbohelpeddoug";
_getlocation = [_shop] call AnzusLife_Lib_GetNearestLocation;
[format["报警！-美术馆被抢劫 %1", _getlocation],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",west];
["ArtGallery"] remoteExec ['ANZUS_fnc_AANBank',-2];

//Setup the progress bar
_title = "Robbing the Art Gallery, stay within 15m";
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
[_mrkstring,[0,0,0],"ArtGallery"] remoteExec ["AnzusLife_Lib_CreateMarker", 2];
while {true} do
{
	uiSleep 12.00;
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
if (!((_shop getVariable ["robbing", objNull]) isEqualTo player)) exitWith { ["You are not robbing the store.","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};
_shop setVariable ["robbing", objNull, true];
jimbohelpeddoug = false;
publicVariable "jimbohelpeddoug";
if!(alive _robber) exitWith {  call ANZUS_fnc_hudUpdate;  };
if(_robber distance _shop > 10) exitWith {  ["你太远了，抢劫失败了!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"];call ANZUS_fnc_hudUpdate; };
if(_robber getVariable "restrained") exitWith {  ["你被捕了!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate; };
if(life_istazed) exitWith { ["你被击倒了!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate; };
if (_robber getVariable ["inHostage",false]) exitWith {["你被劫为人质, 操作已取消.","true","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"];call ANZUS_fnc_hudUpdate;};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};
if (currentWeapon _robber isEqualTo "") exitWith {["如果没有适当的设备，您无法抢劫任何人，请先拿枪!","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};
if ((currentWeapon _robber) in _blacklistedWeapons) exitWith {["你别用这个吓唬我，这是个玩笑吗?","false","slow"] call ANZUS_fnc_notificationSystem; 5 cutText ["","PLAIN"]; call ANZUS_fnc_hudUpdate;};

_shop setVariable ["robTime", time + 1800, true];

_noATMTime = MAIN_SETTINGS_TYPE(getNumber,"MajorCrimes","noatm_timer");
[_noATMTime] spawn {
    params["_noATMTime",5,[5]];
	life_use_atm = false;
	sleep 60 * _noATMTime;
	life_use_atm = true;
};

[format["You have stolen a large painting, run!!",[_kassa] call ANZUS_fnc_numberText],"true","slow"] call ANZUS_fnc_notificationSystem;
[true,"painting",1] call ANZUS_fnc_handleInv;

["robshop"] spawn mav_ttm_fnc_addExp;
missionNamespace setVariable ["AnzusLife_MajorCrime",time, true];
[] call ANZUS_fnc_hudSetup;
[0] call ANZUS_fnc_updatePartial;

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _robber];
if!(alive _robber) exitWith {};

[format["Police News: The Art Gallery has been robbed!",[_kassa] call ANZUS_fnc_numberText],"true","slow"] remoteExec ["ANZUS_fnc_notificationSystem",west];
[_robber,24] spawn AnzusLife_CREATEEVIDENCE;
_shop setObjectTextureGlobal [0, "\RL_Vegetation\art\blank.paa"];
sleep (60 * 30);
_randomArt = selectRandom ["\RL_Vegetation\art\art1.paa","\RL_Vegetation\art\art2.paa","\RL_Vegetation\art\nude1s.paa"];
_shop setObjectTextureGlobal [0, _randomArt];
