/*
    
    Filename:   SunriseServer_system_customlog.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
"extDB3" callExtension ([1, FETCH_CONST(life_sql_log),(_this joinString ":")] joinString ":");
true