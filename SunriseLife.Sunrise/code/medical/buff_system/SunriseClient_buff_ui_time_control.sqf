/*

	Filename: 	SunriseClient_buff_ui_time_control.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF
	Web:		http://sunriserp.ru
	
*/
disableSerialization;
private _toastControl = param [0,controlNull,[controlNull]];
private _time = param [1,0,[0]];

if (_time <= 0) exitWith {};
if (isNull _toastControl) exitWith {};

private _pbControl = _toastControl controlsGroupCtrl 103; 
private _textControl = _toastControl controlsGroupCtrl 104; 
private _textOld = ctrlText _textControl;
private _buffEnd = diag_tickTime + _time;

private _step = (100 / _time) * 0.01;

While {true} do {
	if (isNull _toastControl) exitWith {};
	if (_time > 0 && diag_tickTime >= _buffEnd) exitWith {_pbControl progressSetPosition 1};
	
	_textControl ctrlSetText format ["%2 | %1",_textOld,[(_buffEnd - diag_tickTime),"MM:SS"] call BIS_fnc_secondsToString];

	//мб убрать? (Плавное заполнение прогрессбара)
	//for "_i" from 1 to 10 step 1 do {
		_progressPosition = progressPosition _pbControl;
		//_pbControl progressSetPosition (_progressPosition + (_step / 10));
		_pbControl progressSetPosition (_progressPosition + _step);
		//uiSleep 0.001;
	//};
	
	uiSleep 1;
};