private["_in","_flg","_fl","_def","_arr","_i","_j","_as","_aa","_org","_p","_out"];
_in=_this select 0;
_flg=toUpper(_this select 1);
_fl=[_flg] call SunriseClient_kron_StrLen;
_out="";
if ((count _this)>2) then {_out=_this select 2};
_arr=[_in] call SunriseClient_kron_ArrayToUpper;
if ((count _arr)>0) then {
	for "_i" from 0 to (count _in)-1 do {
		_as = _arr select _i;
		if (typeName _as=="STRING") then {
			_aa = [_as] call SunriseClient_kron_StrToArray;
			_p = _aa find ":";
			if (_p==_fl) then {
				if (([_as,_fl] call SunriseClient_kron_StrLeft)==_flg) then {
					_org = _in select _i;
					_out=[_org,_p+1] call SunriseClient_kron_StrMid;
				};
			};
		};
	};
};
_out