/*

	Filename:   SunriseServer_market_init.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
market_loaded = false;
publicVariable "market_loaded";
//
diag_log "------------- Vendetta Auction House Initialization -------------";
_rows = [];
private _count = "countMarket" call SunriseServer_database_selectSingleField;
for "_x" from 0 to _count step 25 do {	
	private _queryResult = format ["initMarket:%1",_x] call SunriseServer_database_selectFull;
	diag_log format ["OK fn_initMarket:_queryResult = %1",_queryResult];
	if (_queryResult isEqualTo []) exitWith {};
	
	_rows append _queryResult;
};
diag_log format["Result: %1",_rows];
diag_log "--------------------------------------------";

all_ah_items = _rows;
publicVariable "all_ah_items";

market_loaded = true;
publicVariable "market_loaded";
