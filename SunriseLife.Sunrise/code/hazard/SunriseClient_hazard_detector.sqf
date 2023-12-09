/*

	Filename: 	SunriseClient_hazard_detector.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
life_hazard_detectorOn = !life_hazard_detectorOn;
if (life_hazard_detectorOn) then {
	private _sleep = 2;
	private _m = 0.9 / 5;
	private _b = 0.1 - (_m * 5);
	
	["done","",format["Детектор включен"]] call SunriseClient_message;
	_lastBeep = time - 10;
	_ANOMALY_DETECTION_RANGE = 20;
	while {life_hazard_detectorOn AND life_hazard_detectorCool < 600 AND (currentWeapon player isEqualTo "sl_detektor")} do {
		_found = false;
		_min = _ANOMALY_DETECTION_RANGE + 4;
		{
			if !(isNil {_x getVariable "anomaly_type"} && _x getVariable "anomaly_cooldown") then {
				_found = true;
				_tmp = _x distance player;
				if (_tmp < _min) then {
					_min = _tmp;
				};
			};
		} forEach (getpos player nearObjects ["EmptyDetector", _ANOMALY_DETECTION_RANGE + 4]);

		if(_found) then {
			_sleep = (((_m * _min + _b) max 0.1) min 1);
			if((time - _lastBeep) > _sleep) then {
				playSound "da_2_beep1";
				_lastBeep = time;
			};
		};
		life_hazard_detectorCool = life_hazard_detectorCool + 0.05;
		uiSleep 0.05;
	};
	if (life_hazard_detectorCool > 600) then {
		["error","",format["Детектор перегрелся! Он охладится через 10 минут!"]] call SunriseClient_message;
		life_hazard_detectorCool = time + 600;
		life_hazard_detectorOn = false;
	};
} else {
	["error","",format["Детектор выключен"]] call SunriseClient_message;
};