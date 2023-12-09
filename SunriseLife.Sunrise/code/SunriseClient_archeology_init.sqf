/*

	Filename: 	SunriseClient_archeology_init.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
"Archeology - Init..." call SunriseClient_system_log; //Тут мы запускаем на клиенте сам процесс поиска и добычи археологических предметов
if !(EQUAL(life_arc_currentZones,[])) exitWith {
	titleText ["Загружены сохраненные зоны раскопок","PLAIN"];
	call SunriseClient_archeology_setMarkers;
};

"Archeology - Init - All vars cleared" call SunriseClient_system_log;

["Запускаем поиск зоны раскопок...", "info"] call SunriseClient_gui_BottomNotification;

private _allZones = [];
{
	_allZones pushBack (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyZones" >> worldName));
format["Archeology - Init - All zones: %1",_allZones] call SunriseClient_system_log;

uiSleep 3;

private _zonesMax = ARC_SETTINGS(getNumber,"zonesCount");
format["Archeology - Init - Zones max: %1",_zonesMax] call SunriseClient_system_log;

private _currentZones = [];
while {(count _currentZones) < _zonesMax} do {
	_currentZones pushBackUnique (selectRandom _allZones);
};
format["Archeology - Init - Current Zones: %1",_currentZones] call SunriseClient_system_log;

private "_zoneCount";
{
	_zoneCount = getNumber (missionConfigFile >> "LifeCfgArcheology" >> "ArcheologyZones" >> worldName >> _x >> "count");
	life_arc_currentZones pushBack [_x,_zoneCount];
} forEach _currentZones;

SVAR_PRNS ["PRNS_arc_currentZones",life_arc_currentZones];
call SunriseClient_archeology_setMarkers;

[format["Найдены и отмечены на вашей карте %1 зон раскопок!",_zonesMax], "done"] call SunriseClient_gui_BottomNotification;
"Archeology - Init Completed" call SunriseClient_system_log;