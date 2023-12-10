/*
	
	Filename: 	SunriseServer_database_insertSingle.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _result = parseSimpleArray ("extDB3" callExtension ([0, FETCH_CONST(life_sql_id),_this] joinString ":"));
(_result select 1) select 0