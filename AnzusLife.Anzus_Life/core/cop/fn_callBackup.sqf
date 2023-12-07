if(playerSide != west) exitWith {};
if(life_callBackup > time) exitWith {["您无法再这么快再次发出求救","false","slow"] call ANZUS_fnc_notificationSystem;};

[player,120,false] remoteExec ["ANZUS_fnc_backupCall",west];
life_callBackup = time + 300;

[false,"panicbutton",1] call ANZUS_fnc_handleInv;
