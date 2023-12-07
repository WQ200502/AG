
_clear = nearestObjects [player,["weaponholder"],3];
_clear = _clear + nearestObjects [player,["groundWeaponHolder"],3];
_destroyed = 0;

_xD = west countSide playableUnits;
if (_xD < 6) exitWith {
  for "_i" from 0 to count _clear - 1 do {
      _destroyed = _destroyed + 1;
      deleteVehicle (_clear select _i);
      uiSleep 0.056;
  };
  _destroyed = _destroyed - 1;
  [format["没收 %1 物品，因为没有足够的警察值勤，所以这些物品没有进入集货箱",_destroyed],"false","slow"] call ANZUS_fnc_notificationSystem;
};

for "_i" from 0 to count _clear - 1 do {
    _destroyed = _destroyed + 1;
    _item = _clear select _i;
		_mags = getMagazineCargo _item;
		_weapons = getWeaponCargo _item;
		clearBackpackCargo _item;

		if (count (_mags select 0) > 0) then {{evidencelocker addMagazineCargoGlobal [_mags select 0 select _forEachIndex,_mags select 1 select _forEachIndex]} forEach (_mags select 0); clearMagazineCargo _item;};
		if (count (_weapons select 0) > 0) then {{evidencelocker addWeaponCargoGlobal [_weapons select 0 select _forEachIndex,_weapons select 1 select _forEachIndex]} forEach (_weapons select 0);  clearWeaponCargo _item; };
    deleteVehicle (_clear select _i);
    uiSleep 0.056;
};
_destroyed = _destroyed - 1;
[format["没收 %1 物品并将其放入证据柜.",_destroyed],"true","slow"] call ANZUS_fnc_notificationSystem;
