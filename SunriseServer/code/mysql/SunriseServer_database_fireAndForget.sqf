/*

	Filename: 	SunriseServer_database_fireAndForget.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
"extDB3" callExtension ([1, FETCH_CONST(life_sql_id),_this] joinString ":");
true