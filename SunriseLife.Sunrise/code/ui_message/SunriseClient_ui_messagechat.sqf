/*
	
	Filename: 	SunriseClient_ui_messagechat.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

	Web:		http://sunriserp.ru

*/
#include "..\..\script_macros.hpp"
private["_rawText", "_stripeColor", "_display", "_toastControl", "_toastPosition", "_textControl", "_textHeight", "_textPosition", "_backgroundControl", "_backgroundPosition", "_stripeControl", "_stripePosition"];

private _ui_new_message_pushToBottom = 
{
	private["_position", "_toastControl", "_toastPosition", "_status", "_statusChangeAt"];
	disableSerialization;
	_position = 0;
	{
		_toastControl = _x select 0;
		_toastPosition = ctrlPosition _toastControl;
		_status = 0;
		_statusChangeAt = (_x select 2) max (diag_tickTime + 2);
		if (_forEachIndex isEqualTo 0) then 
		{
			_position = safeZoneY + 825 * pixelH;
			_toastControl ctrlSetFade 0;
		}
		else 
		{
			if (_forEachIndex > 5) then 
			{
				_toastControl ctrlSetFade 1;
				_status = 1;
				_statusChangeAt = diag_tickTime + 2;
			};
		};
		_toastPosition set [1, _position];
		_toastControl ctrlSetPosition _toastPosition;
		_toastControl ctrlCommit 0.25;
		_position = _position + (_toastPosition select 3) + (3 * pixelH);
		ui_message_chat_array set [_forEachIndex, [_toastControl, _status, _statusChangeAt]];
	}
	forEach ui_message_chat_array;
};

disableSerialization;
if !(ui_message_chat_visible) exitWith { false };
_rawText = _this select 0;
_stripeColor = _this select 1;

_display = GVAR_UINS ["RscNewUiMessageChatArea",displayNull];
if (isNull _display) then {	
	["RscNewUiMessageChatArea","PLAIN",1,false] call SunriseClient_gui_CreateRscLayer;
	_display = GVAR_UINS ["RscNewUiMessageChatArea",displayNull];
};

_toastControl = _display ctrlCreate ["RscNewUiMessageChat", -1]; 
_toastPosition = ctrlPosition _toastControl;
_textControl = _toastControl controlsGroupCtrl 102;  
_textControl ctrlSetStructuredText (parseText _rawText); 
_textHeight = ctrlTextHeight _textControl;
_textPosition = ctrlPosition _textControl;  
_textPosition set [3, _textHeight];  
if (_textHeight < ((_toastPosition select 3) - 14 * pixelH)) then 
{
	_textPosition set [1, (_toastPosition select 1) + ((_toastPosition select 3) - _textHeight) * 0.5];  
}
else 
{
	_toastPosition set [3, _textHeight + 14 * pixelH];
	_textPosition set [1, 7 * pixelH];
};
_textControl ctrlSetPosition _textPosition;
_textControl ctrlCommit 0;
_backgroundControl = _toastControl controlsGroupCtrl 100;  
_backgroundPosition = ctrlPosition _backgroundControl;
_backgroundPosition set [3, _toastPosition select 3];
_backgroundControl ctrlSetPosition _backgroundPosition;
_backgroundControl ctrlSetBackGroundColor [0,0,0,0.2];
_backgroundControl ctrlCommit 0;
_stripeControl = _toastControl controlsGroupCtrl 101;  
_stripeControl ctrlSetBackGroundColor _stripeColor;
_stripePosition = ctrlPosition _stripeControl;
_stripePosition set [3, _toastPosition select 3];
_stripeControl ctrlSetPosition _stripePosition;
_stripeControl ctrlCommit 0;
_toastPosition set [0, safeZoneX + 20 * pixelW];
_toastPosition set [1, safeZoneY + 700 * pixelH - (_toastPosition select 3)];
_toastControl ctrlSetPosition _toastPosition;
_toastControl ctrlSetFade 1;
_toastControl ctrlCommit 0;
reverse ui_message_chat_array;
ui_message_chat_array pushBack [_toastControl, 0, diag_tickTime + 10];
reverse ui_message_chat_array;
//playsound "HintExpand";
call _ui_new_message_pushToBottom;