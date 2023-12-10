/*

	Filename: 	SunriseServer_database_selectFull.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	
	Выбрать все совпадения [[blalba],[blalba]]
*/
#include "..\..\script_macros.hpp"
private _result = parseSimpleArray ("extDB3" callExtension ([0, FETCH_CONST(life_sql_id),_this] joinString ":"));
switch (_result select 0) do
{
	case 0: {(format["Database Error: %1", (_result select 1)]) call SunriseServer_system_log};
	case 2: {_result = (_result select 1) call SunriseServer_database_handleBig};
};
_result select 1
