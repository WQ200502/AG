/*
	
	Filename: 	SunriseClient_ui_message_thread.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

	Web:		http://sunriserp.ru

*/
#include "..\..\script_macros.hpp"
private["_toastControl", "_status", "_statusChangeAt", "_toastPosition"];

if (ui_message_array isEqualTo []) exitWith {};

disableSerialization;
{
	_toastControl = _x select 0;
	_status = _x select 1;
	_statusChangeAt = _x select 2;
	if (diag_tickTime >= _statusChangeAt) then 
	{
		switch (_status) do 
		{
			case 0: 
			{
				_toastPosition = ctrlPosition _toastControl;
				_toastPosition set [1, (_toastPosition select 1) + 20 * pixelH];
				_toastControl ctrlSetPosition _toastPosition;
				_toastControl ctrlSetFade 1;
				_toastControl ctrlCommit 0.25;
				ui_message_array set [_forEachIndex, [_toastControl, 1, diag_tickTime + 1]];
			};
			case 1:
			{
				ctrlDelete _toastControl;
				ui_message_array deleteAt _forEachIndex;
			};
		};
	};
}
forEach ui_message_array;