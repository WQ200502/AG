/*

	Filename: 	SunriseClient_buff_ui_push_to_top.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

	Web:		http://sunriserp.ru
 add buff test
*/
private["_position", "_toastControl", "_toastPosition"];
disableSerialization;
_position = 0;
{
	_toastControl = _x select 0;
	_toastPosition = ctrlPosition _toastControl;
	if (_forEachIndex isEqualTo 0) then 
	{
		_position = (_toastPosition select 1);
		_toastControl ctrlSetFade 0;
	}
	else 
	{
		if (_forEachIndex > 7) then 
		{
			_toastControl ctrlSetFade 1;
		};
	};
	_toastPosition set [1, _position];
	_toastControl ctrlSetPosition _toastPosition;
	_toastControl ctrlCommit 0.25;
	_position = _position + (_toastPosition select 3) - (0.230 * safezoneH + safezoneY); //баффы разница
	
	ui_buff_array set [_forEachIndex, [_toastControl, (_x select 1), (_x select 2),_forEachIndex, (_x select 4)]];
}
forEach ui_buff_array;
