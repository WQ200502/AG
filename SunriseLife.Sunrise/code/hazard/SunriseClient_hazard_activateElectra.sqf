/*

	Filename: 	SunriseClient_hazard_activateElectra.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params[
	["_trg",objNull],
	["_list",[]]
];
if (isNull _trg) exitWith {};

private _proxy = _trg getVariable "anomaly_sound";
_proxy say3d ("electra_blast" + str (ceil random 2));
_sucked = [];
{
	if (alive _x) then {
		_sucked pushBackUnique _x;
		if (local _x) then {addCamShake [15, 3, 25];[_x, getpos _trg, 2, 2] spawn SunriseClient_hazard_suckToLocation};
	} else {
		[_x] call SunriseClient_hazard_minceCorpse;
	};
} forEach (nearestObjects [getPos _trg, ["Man","WeaponHolderSimulated"], 5]);

_proxy = _trg getVariable "anomaly_sound";
_light = "#lightpoint" createVehicleLocal (getpos _proxy);
_light setLightBrightness 10;
_light setLightAmbient [0.6, 0.6, 1];
_light setLightColor [0.6, 0.6, 1];
_light setLightUseFlare true;
_light setLightFlareSize 100;
_light setLightFlareMaxDistance 100;
_light setLightDayLight true;
uiSleep 0.1;
_light setLightBrightness 0;
uiSleep 0.1;
_light setLightBrightness 10;
uiSleep 0.2;
_light setLightBrightness 0;
uiSleep 1.2;
_light setLightBrightness 10;
uiSleep 0.1;
_light setLightBrightness 0;
uiSleep 0.1;
_light setLightBrightness 10;
uiSleep 0.2;
deleteVehicle _light;

{
	[_x] call SunriseClient_hazard_minceCorpse;
	if (local _x) then {_x setDamage 1};
} forEach _sucked;

uiSleep (30 + random 11);
_trg setVariable ["anomaly_cooldown", false, true];