#include "..\..\script_macros.hpp"

private ["_upp","_ui","_progress","_pgText","_cP","_displayName"];

 _var = missionNamespace getVariable ["AnzusLife_MajorCrime",time];
 _formatTime = [(1800 - (ceil(serverTime - _var))), "MM", false] call BIS_fnc_secondsToString;
 if ((time - _var) < 1800) exitWith {[format["最近发生了一起重大犯罪，您必须再等 %1 分钟。",_formatTime],true,"slow"] call ANZUS_fnc_notificationSystem;};

 _var = ShipDataStorage getVariable ["MainframeHacked",0];
 _formatTime = [(1800 - (ceil(serverTime - _var))), "MM", false] call BIS_fnc_secondsToString;
 if ((time - _var) < 1800) exitWith {[format["主机在最近一次黑客攻击后关闭，您必须再等待 %1 分钟。",_formatTime],true,"slow"] call ANZUS_fnc_notificationSystem;};

if (dbBreaching) exitWith {["有人已经在破坏主机了！",true,"slow"] call ANZUS_fnc_notificationSystem;};
if (!([false,"VirusUSB",1,"virusUSB"] call ANZUS_fnc_handleInv)) exitWith {["你没有病毒USB！",true,"slow"] call ANZUS_fnc_notificationSystem;};
if ((west countSide playableUnits) < 1) exitWith {[ format ["有 %1 名警察在线，需要1名警察。" , (west countSide playableUnits)],true,"slow"] call ANZUS_fnc_notificationSystem;};

["数据库被破坏时，请随时待命！8",true,"slow"] call ANZUS_fnc_notificationSystem;

dbBreaching = true;
publicVariable "dbBreaching";

life_interrupted = false;
_title = "Inserting Virus into the Mainframe";
_icon = "\anzuslifecore\images\displays\displayInteractionMenu\repair.paa";
    
disableSerialization;
"progressBar" cutRsc ["AnzusLife_Progress","PLAIN"];
_ui = uiNamespace getVariable "AnzusLife_Progress";
_controlsGroup = _ui displayCtrl 1;
_progress = _controlsGroup controlsGroupCtrl 3;
_pgText = _controlsGroup controlsGroupCtrl 2;
_pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, "1" + "%", (100 * (pixelH * pixelGrid * 0.50))];
_add = 0.015;
_progress progressSetPosition _add;
_cP = _add;

["Milship"] remoteExec ['ANZUS_fnc_AANBank',-2];

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "Acts_carFixingWheel") then {
        [player,"Acts_carFixingWheel",true] remoteExecCall ["ANZUS_fnc_animSync",-2];
        player switchMove "Acts_carFixingWheel";
        player playMoveNow "Acts_carFixingWheel";
        player disableAI "anim"; 
    };

    sleep 6;
    _cP = _cP + _add;
    _progress progressSetPosition _cP;
    _precentage = str round(_cP * 100) + "%";
    _pgText ctrlSetStructuredText parseText format ["<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>", _title, _icon, _precentage, (100 * (pixelH * pixelGrid * 0.50))];
    

    if (_cP >= 1) exitWith {};
    if (player getVariable ["inHostage",false]) exitWith {};
    //if (!life_alive) exitWith {};
    if !(isNull objectParent player) exitWith {};
    if (life_interrupted) exitWith {};
};

life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player switchMove "stop";
if (player getVariable ["inHostage",false]) exitWith {["你被扣为人质，行动取消。",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel",true,"slow"] call ANZUS_fnc_notificationSystem; life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};
if !(isNull objectParent player) exitWith {[localize "STR_NOTF_ActionInVehicle",true,"slow"] call ANZUS_fnc_notificationSystem;life_action_inUse = false; dbBreaching = false;
publicVariable "dbBreaching";};

_virusCode = [round (random 8), round (random 8), round (random 8), round (random 8), round (random 8   )];
ShipDataStorage setVariable ["virusCode", _virusCode, true];

sleep 1;
player switchMove "Stand";
[format ["你已经破坏了主机，数据存储代码是 %1", _virusCode],true,"slow"] call ANZUS_fnc_notificationSystem;

dbBreaching = false;
publicVariable "dbBreaching";

ShipDataStorage setVariable ["MainframeHacked",time,true];

ShipDataStorage setVariable ["DataUnlocked", true, true];
