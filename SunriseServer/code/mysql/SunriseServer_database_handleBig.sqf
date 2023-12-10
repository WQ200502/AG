/*

	Filename: 	SunriseServer_database_handleBig.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _result = "";
while {true} do
{
	private _pipe = "extDB3" callExtension format["5:%1", _this];
	if (_pipe isEqualTo "") exitWith {};
	_result = _result + _pipe;
};
call (compile _result)