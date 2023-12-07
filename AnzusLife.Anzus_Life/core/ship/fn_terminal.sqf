#include "..\..\script_macros.hpp"

private ["_upp","_ui","_progress","_pgText","_cP","_displayName"];

 _var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
 _formatTime = [(1800 - (ceil(serverTime - _var))), "MM", false] call BIS_fnc_secondsToString;
 if ((time - _var) < 1800) exitWith {[format["最近发生了一起重大犯罪，您必须再等 %1 分钟。",_formatTime],true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((west countSide playableUnits) < 1) exitWith {[ format ["有 %1 名警察在线，需要1名警察。" , (west countSide playableUnits)],true,"slow"] call ANZUS_fnc_notificationSystem;};

if !(ShipDataTerminal getVariable ["TerminalUnlocked", false]) exitWith {["终端被锁定在激活的防火墙后面！",true,"slow"] call ANZUS_fnc_notificationSystem;};

["下载数据时请随时待命！",true,"slow"] call ANZUS_fnc_notificationSystem;


_title = "Downloading Ship Data (Stay within 15M)";
_icon = "\anzuslifecore\images\displays\displayInteractionMenu\repair.paa";
    
disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_add = 0.002;
_progress progressSetPosition _add;
_cP = _add;


for "_i" from 0 to 1 step 0 do {
    sleep 0.35;
    _cP = _cP + _add;
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    

    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
   // if (!life_alive) exitWith {};
    if !(isNull objectParent player) exitWith {};
    if ((player distance ShipDataTerminal) > 15) exitWith {}
};

life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player switchMove "stop";
if (player getVariable ["inHostage",false]) exitWith {["你被扣为人质，行动取消。",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};
if ((player distance ShipDataTerminal) > 15) exitWith {["你走得太远了！。",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",true,"slow"] call ANZUS_fnc_notificationSystem;life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};

sleep 1;
player switchMove "Stand";
["You have downloaded the data, it is encrypted, decyption download at the mainframe.",true,"slow"] call ANZUS_fnc_notificationSystem;

USAFTerminalOpener setVariable ["TerminalUnlocked", true, true];
ShipDataTerminal setVariable ["TerminalUnlocked", false, true];

[true,"EncyrptedUSB",1,"major"] call ANZUS_fnc_handleInv;