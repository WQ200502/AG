private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];
if (isNull _display) exitWith {};

	
private _firstNameCtrl = _display displayCtrl 180020;
private _lastNameCtrl = _display displayCtrl 180021;

private _firstName = ctrlText _firstNameCtrl;
private _lastName = ctrlText _lastNameCtrl;

if (_firstName isEqualTo "" || _lastName isEqualTo "" || _lastName isEqualTo "First Name" || _lastName isEqualTo "Last Name") exitWith {["您需要一个名字和一个姓氏","true","slow"] call ANZUS_fnc_notificationSystem};

private _text = format["请确认您要使用名称 %1 %2 对于您的手机，目前无法更改",_firstName, _lastName];
private _response = ["Confirm", _text] call ANZUS_fnc_sendWarning;

if (_response) then {
  AnzusLife_TempPhoneData = [_firstName, _lastName, ""];
  AnzusLife_Phone_NameSetupComplete = true;
} else {
};
