/*

	Filename: 	SunriseServer_system_clientConnect.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
///__SERVER__
if (_uid select [0,2] isEqualTo "HC") exitWith {
	remoteExec ["SunriseServer_fnc_initHeadless",_owner];
	format ["HeadlessClient connected %1", server_timetext] call SunriseServer_system_log;
};
/*"life_HC_server_isReady" addPublicVariableEventHandler {
    if (_this select 1) then {
        HC_UID = getPlayerUID hc_1;
        HC_Life = owner hc_1;
        cleanupFSM setFSMVariable ["stopfsm",true];
        terminate cleanup;
        terminate aiSpawn;
        [true] call SunriseServer_system_transferOwnership;
        HC_Life publicVariableClient "animals";
        HC_Life publicVariableClient "serv_sv_use";
        life_HC_isActive = true;
        publicVariable "life_HC_isActive";
        diag_log "Headless client is connected and ready to work!";
    };
};

HC_DC = ["HC_Disconnected","onPlayerDisconnected",
    {
        if (!isNil "HC_UID" && {_uid == HC_UID}) then {
            life_HC_isActive = false;
            publicVariable "life_HC_isActive";
            HC_Life = false;
            publicVariable "HC_Life";
            cleanup = [] spawn SunriseServer_system_cleanup;
            cleanupFSM = [] execFSM "\SunriseServer\FSM\cleanup.fsm";
            [false] call SunriseServer_system_transferOwnership;
            aiSpawn = ["hunting_zone",30] spawn SunriseServer_system_huntingZone;
            diag_log "Headless client disconnected! Broadcasted the vars!";
            diag_log "Ready for receiving queries on the server machine.";
        };
    }
] call BIS_fnc_addStackedEventHandler;*/