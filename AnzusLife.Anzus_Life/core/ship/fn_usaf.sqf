#include "..\..\script_macros.hpp"

private ["_upp","_ui","_progress","_pgText","_cP","_displayName"];

_var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
_formatTime = [(1800 - (ceil(serverTime - _var))), "MM", false] call BIS_fnc_secondsToString;
if ((time - _var) < 1800) exitWith {[format["最近发生了一起重大犯罪，您必须再等 %1 分钟。",_formatTime],true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!([false,"EncyrptedUSB",1,"EncyrptedUSB"] call ANZUS_fnc_handleInv)) exitWith {["您没有要解密的加密USB！",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (dbBreaching) exitWith {["有人已经在破坏主机了！",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((west countSide playableUnits) < 1) exitWith {[ format ["有 %1 名警察在线，需要1名警察。" , (west countSide playableUnits)],true,"slow"] call ANZUS_fnc_notificationSystem;};

["与美国空军建立联系时，请随时待命！",true,"slow"] call ANZUS_fnc_notificationSystem;


life_interrupted = false;
_title = "Breaching Air Force Systems (Stay within 15M)";
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
["Milship"] remoteExec ['ANZUS_fnc_AANBank',-2];

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
    if (life_interrupted) exitWith {};
    if ((player distance ShipMainframe) > 15) exitWith {}
};

life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player switchMove "stop";
if (player getVariable ["inHostage",false]) exitWith {["你被扣为人质，行动取消。",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};
if ((player distance ShipMainframe) > 15) exitWith {["你走得太远了！。",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",true,"slow"] call ANZUS_fnc_notificationSystem;life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};

_virusCode = [round (random 8), round (random 8), round (random 8), round (random 8), round (random 8)];
USAFTerminalOpener setVariable ["virusCode", _virusCode, true];

sleep 1;
player switchMove "Stand";
[format ["你违反了美国空军的规定，临时的美国空军防御代码是 %1 -你需要去空军基地。", _virusCode],true,"slow"] call ANZUS_fnc_notificationSystem;
[true,"EncyrptedUSB",1,"major"] call ANZUS_fnc_handleInv;
USAFTerminalOpener setVariable ["TerminalUnlocked", true, true];
missionNamespace setVariable ["AnzusLife_MajorCrime",time, true];
dbBreaching = false;
publicVariable "dbBreaching";