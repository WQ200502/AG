/*
	
	Filename: 	SunriseClient_session_syncData.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if (time - life_save_timer < 300) exitWith {[localize "STR_Session_SyncdAlready","error"] call SunriseClient_gui_bottomNotification};

[] call SunriseClient_session_updateRequest;
[localize "STR_Session_SyncData","info"] call SunriseClient_gui_bottomNotification;
life_save_timer = time;