/*

	Filename: 	SunriseClient_admin_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0};

disableSerialization;
if (isNull (findDisplay 2900)) then {
	if !(createDialog "SunriseDialogAdmin") exitWith {};
};

private _title = CONTROL(2900,2901);
private _playersList = CONTROL(2900,2902);
private _playerInfo = CONTROL(2900,2903);
private _playerLicenses = CONTROL(2900,2904);
private _playerLloot = CONTROL(2900,2905);

private _getLootButton = CONTROL(2900,2906);
private _spectateButton = CONTROL(2900,2907);
private _freezeButton = CONTROL(2900,2908);
private _teleportToMeButton = CONTROL(2900,2909);
private _teleportToHimButton = CONTROL(2900,2910);
private _banButton = CONTROL(2900,2912);
private _kickButton = CONTROL(2900,2911);

private _housesList = CONTROL(2900,2913);
private _getHousesButton = CONTROL(2900,2914);

private _vehiclesList = CONTROL(2900,2915);
private _getVehiclesButton = CONTROL(2900,2916);

private _lockButton = CONTROL(2900,2919);
private _unLockButton = CONTROL(2900,2920);

private _compensateButton = CONTROL(2900,2921);
private _markersButton = CONTROL(2900,2922);
private _godButton = CONTROL(2900,2923);
private _teleportButton = CONTROL(2900,2924);
private _invisButton = CONTROL(2900,2925);

_getHousesButton ctrlEnable false;
_getVehiclesButton ctrlEnable false;

_title ctrlsettext format["Sunrise Life                 Игроков: %4                 Полиция: %1 | EMS: %2 | Гражданские: %3", count units life_copGroup, count units life_medGroup, count allPlayers - (count units life_copGroup + count units life_medGroup), count allPlayers];

lbClear _playersList;

{
	_color = switch(true) do {
		case (_x getVariable ["copDuty",false]): {[0,0.588,1,1]};
		case (_x getVariable ["medDuty",false]): {[1,0,0,1]};
		default {[0.902,0.553,1,1]};
	};
	
	_name = GVAR_RNAME(_x);
	if (_name == "") then {
		_name = format ["%1 (заходит)",name _x];
		_color = [0.624,0.624,0.624,1];
	};

	_playersList lbAdd format["%1", _name];
	_playersList lbSetColor [(lbSize _playersList)-1,_color];
	_playersList lbSetdata [(lbSize _playersList)-1,str(_x)];
} foreach playableUnits;

lbSort [_playersList,"ASC"];