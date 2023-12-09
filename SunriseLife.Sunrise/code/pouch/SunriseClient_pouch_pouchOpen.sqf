/*
	
	Filename: 	SunriseClient_pouch_pouchOpen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if (server_restartSoon) exitWith {["Надвигается буря. Доступ к контейнеру закрыт", "error"] call SunriseClient_gui_BottomNotification};
private _nearCops = (playableUnits - [player]) findIf {player distance _x < 100 && {_x getVariable ["copDuty",false]}};
if (!life_copDuty AND _nearCops != -1) exitWith {["Защищенный контейнер не может быть открыт рядом с полицейскими", "error"] call SunriseClient_gui_BottomNotification};

[player] remoteExecCall ["SunriseServer_pouch_openPouch",2];