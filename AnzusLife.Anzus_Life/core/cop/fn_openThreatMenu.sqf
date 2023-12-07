if (playerSide != west) exitWith {["你不是警察!","true","slow"] call ANZUS_fnc_notificationSystem};
if (call(life_coplevel) < 5) exitWith {["你的职级太低了，不能用这个!","true","slow"] call ANZUS_fnc_notificationSystem;};
if ((Anti_ThreatSpam > 0) && ((time - Anti_ThreatSpam) < 120)) exitWith{["您必须等待2分钟，然后才能再次更改威胁级别.","true","slow"] call ANZUS_fnc_notificationSystem;};

closeDialog 0;
createDialog "AnzusLife_ThreatLevel";

lbClear 2100;
lbAdd [2100,"Green"];
lbAdd [2100,"Amber"];
lbAdd [2100,"Red"];
lbAdd [2100,"Martial Law"];

_getCur = missionNamespace getVariable "AnzusLife_ThreatLevel";
lbSetCurSel [2100, _getCur]; 

buttonSetAction [2400, "Anti_ThreatSpam = time; [lbCurSel 2100] call ANZUS_fnc_changeThreat; closeDialog 0;"];