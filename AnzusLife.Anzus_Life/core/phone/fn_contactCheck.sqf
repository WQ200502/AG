params [["_player",objNull,[objNull]],["_newname","",[""]]];

if (!isRemoteExecuted) exitWith {};
if (!isPlayer _player) exitWith {};
if (player isEqualTo _player) exitWith {};

private _serverTag = getText (missionconfigfile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _serverContacts = profileNamespace getVariable [format ["%1_contacts",_serverTag],[]];
private _playersNumber = _player getVariable ["AnzusLife_PhoneNumber",0];
if (_playersNumber isEqualTo 0) exitWith {["玩家似乎没有接到他们的电话号码.","true","slow"] call ANZUS_fnc_notificationSystem};

private _index = [_playersNumber,_serverContacts] call TON_fnc_index;
if (_index == -1) then {
	//Not Found
	_serverContacts pushBack [_newname,"",_playersNumber,"",""];
	[format["添加 %1 到您的手机通讯录!",_newname],false,"slow"] call ANZUS_fnc_notificationSystem;
} else {
	//Found
	private _thisContactInfo = _serverContacts select _index;
	_thisContactInfo params ["_first","_last","_phone","_company","_email"];
	_oldname = _first + " " + _last;

	_serverContacts set [_index, [_newname, "", _phone, _company, _email]];
	[format["已变更 %1 联系人姓名，从 %2.",_newname, _oldname],false,"slow"] call ANZUS_fnc_notificationSystem; 
};

profileNamespace setVariable [format ["%1_contacts",_serverTag], _serverContacts];
saveProfileNamespace;