private _sel = param [0];

switch (_sel) do {
	case 0: {
		["威胁级别已更改为绿色!","green","slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	};
	case 1: {
		["威胁级别已更改为橙色!","orange","slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	};
	case 2: {
		["威胁级别已更改为红色!","false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
	};
	case 3: {
		["威胁级别已更改为戒严!","false","slow"] remoteExec ["ANZUS_fnc_notificationSystem",0];
		[] spawn ANZUS_fnc_MartialLaw;
	};
};

missionNamespace setVariable ["AnzusLife_ThreatLevel",_sel,true];
[] remoteExec ["ANZUS_fnc_hudUpdate",0];
