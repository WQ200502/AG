private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];
if (isNull _display) exitWith {};

private _numberSetupCombo = _display displayCtrl 180010;
private _numberSelection = lbCurSel  _numberSetupCombo;

if (_numberSelection isEqualTo -1) exitWith {};//Nothing Selected

private _numberData = _numberSetupCombo lbData _numberSelection;

if (_numberData isEqualTo "") exitWith {};//FECK, SOMETHING BORKED

private _text = format["请确认您要选择 %1 作为您的电话号码",(_numberSetupCombo lbText _numberSelection)];

private _response = ["Confirm", _text] call ANZUS_fnc_sendWarning;

if (_response) then {
  [_numberData, player] remoteExec ["ANZUS_fnc_SetupQueryNumber", 2];
};
