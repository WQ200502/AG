/*

	Filename: 	SunriseClient_archeology_spawnItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _index = [life_arc_currentZone,life_arc_currentZones] call SunriseClient_system_index;
format["Archeology - SpawnItem - Index of current Zone in Zones: %1",_index] call SunriseClient_system_log;
if (EQUAL(_index,-1)) exitWith {"Archeology - SpawnItem - Bad index" call SunriseClient_system_log};
private _itemModel = selectRandom (ARC_SETTINGS(getArray,"spawnItem"));
format["Archeology - SpawnItem - Model: %1",_itemModel] call SunriseClient_system_log;

private _item = _itemModel createVehicleLocal life_arc_currentPoint;
waitUntil {!isNull _item};
[_item] call SunriseClient_archeology_addItems;
_item addAction ["<img image='\sunrise_pack\icons\ui\s_icon_box.paa' /> Содержимое находки",SunriseClient_system_openInventory,"",0,true,true,"",'',2];

player reveal _item;
["Вы что-то нашли!", "done"] call SunriseClient_gui_BottomNotification;
["ArcheologyFound"] spawn SunriseClient_experience_addExp;

private _tmpCurZoneCfg = life_arc_currentZones select _index;
private _tmpCurZone = _tmpCurZoneCfg select 0;
private _tmpCurCount = _tmpCurZoneCfg select 1;

SUB(_tmpCurCount,1);

if (_tmpCurCount <= 0) then {
	deleteMarkerLocal _tmpCurZone;	
	deleteMarkerLocal format["%1_text",_tmpCurZone];	
	life_arc_currentZones deleteAt _index;
	call SunriseClient_archeology_clearZone;
	"Archeology - SpawnItem - Marker & Point deleted" call SunriseClient_system_log;
} else {
	life_arc_currentZones set [_index,[_tmpCurZone,_tmpCurCount]];
	life_arc_currentPoint = [_tmpCurZone] call CBA_fnc_randPosArea;
	format["Archeology - SpawnItem - New Point: %1",life_arc_currentPoint] call SunriseClient_system_log; //точка где и лежит сам КЛАД	
};

SVAR_PRNS ["PRNS_arc_currentZones",life_arc_currentZones];