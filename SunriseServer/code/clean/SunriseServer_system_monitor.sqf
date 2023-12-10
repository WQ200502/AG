/*

	Filename:   SunriseServer_system_monitor.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	
*/
//private _shopsUpdateTime = diag_tickTime;
private _PriceTimeUpdata = diag_tickTime;

while {true} do {
	sleep 60;

	/*/update factories, process orders, update shops every 15 minutes
	if ((diag_tickTime - _shopsUpdateTime) > 60 * 15) then {
		_shopsUpdateTime = diag_tickTime;
		[] call SunriseServer_factory_updateFactories;
		{format ["updateShops:%1:%2",_x select 1,_x select 0] call SunriseServer_database_fireAndForget} forEach shops_array;
	};*/
	
	//update factories, process orders, update shops every 30 minutes
	if ((diag_tickTime - _PriceTimeUpdata) > 60 * 30) then {
		_PriceTimeUpdata = diag_tickTime;
		[] call SunriseServer_system_UpdataPrices;
	};

	//update government every minute
	[] call SunriseServer_system_updataGovern;
};