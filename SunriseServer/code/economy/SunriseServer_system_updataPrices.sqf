private _tickTime = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------------- Starting UpdataPrices --------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
private _count = "countEconomy" call SunriseServer_database_selectSingleField;
private _randomids = [];
for "_i" from 1 to 22 do {_randomids pushback floor random _count};
diag_log _randomids;
//for [{_x = 0}, {_x <= _count}, {_x = _x + 10}] do {
for "_x" from 0 to _count step 10 do {
	private _queryResult = format ["updataPrices:%1",_x] call SunriseServer_database_selectFull;
	if (_queryResult isEqualTo []) exitWith {};

	{
		_x params ["_resource","_sellPrice","_minPrice","_maxPrice","_amount","_resID"];
		private _NewSellPrice = 0;
		if (_sellPrice > 0 && _amount > 0) then {//продавали во время рестарта
			if ((_sellPrice - (_sellPrice * (_amount/3000))) > _minPrice) then {
				_NewSellPrice = round(_sellPrice - (_sellPrice * (_amount/3000)));
				diag_log format ["CASE #1 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = %3", _resource, _NewSellPrice, _sellPrice];
			} else {
				_NewSellPrice = round(_minPrice);
				diag_log format ["CASE #2 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = %3", _resource, _NewSellPrice, _sellPrice];
			};
			format ["upPrices:%1:%2",_NewSellPrice,_resource] call SunriseServer_database_fireAndForget;
		} else {
			_amount = (count allPlayers + 100);
			if (_resID in _randomids) then {
				if (_sellPrice + (_sellPrice * (_amount/1500)) < _maxPrice) then {
					_NewSellPrice = round(_sellPrice + (_sellPrice * (_amount/1500)));
					diag_log format ["CASE #3 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = %3", _resource, _NewSellPrice, _sellPrice];
				} else {
					_NewSellPrice = round(_maxPrice);
					diag_log format ["CASE #4 - Resource = '%1' NewSellPrice = '%2' OldSellPrice = %3", _resource, _NewSellPrice, _sellPrice];
				};
				format ["downPrices:%1:%2",_NewSellPrice,_resource] call SunriseServer_database_fireAndForget;
			};	
		};
	} forEach _queryResult;
};
[] call SunriseServer_system_loadPrices;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Updating Prices process :: Total Execution Time %1 seconds ", (diag_tickTime) - _tickTime];
diag_log "----------------------------------------------------------------------------------------------------";