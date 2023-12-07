params [
	["_arr", [], [[]]]
];

if (_arr isEqualTo []) exitWith {};

if (isNil "AnzusLife_EMS_Messages") then {
  AnzusLife_EMS_Messages = [];
};

_arr params [
	"_side",
	"_number",
	"_name",
	"_message",
	"_pos",
	"_timeSent"
];

private _prefix = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "phoneNumberPrefix");
private _numberTemp = format ["%1%2", _prefix, _number];

[format["有一个新的 %1 请求来自 %2 (%3), 检查调度!",_side, _name, _numberTemp],true,"slow"] call ANZUS_fnc_notificationSystem;

AnzusLife_EMS_Messages pushBack _arr;

if (isNil "AnzusLife_Phone_CurrentlyOpen") then {AnzusLife_Phone_CurrentlyOpen = ""};
if (AnzusLife_Phone_CurrentlyOpen == "AnzusLife_MessagesEmergency") then {
	{
		ctrlDelete _x;
	} forEach AnzusLife_EMS_Messages_controls;
	[] spawn ANZUS_fnc_OpenEmergencyMessage;
};
