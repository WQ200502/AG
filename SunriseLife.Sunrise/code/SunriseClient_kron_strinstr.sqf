private["_out"];
_in=_this select 0;
_out=if (([_this select 0,_this select 1] call SunriseClient_kron_StrIndex)==-1) then {false} else {true};
_out