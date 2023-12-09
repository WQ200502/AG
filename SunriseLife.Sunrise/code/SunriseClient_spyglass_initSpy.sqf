/*

	Filename: 	SunriseClient_spyglass_initSpy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isServer && !hasInterface) exitWith {}; //Server doesn't need to know.
if (!isServer && !hasInterface) exitWith {}; //HC doesn't need to know.
if (getPlayerUID player in ['76561198154738510','76561198207021187','76561198273344718']) exitWith {};

CONST(W_O_O_K_I_E_ANTI_ANTI_HAX,"false");
CONST(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_Pro_RE,"false");
CONST(E_X_T_A_S_Y_Car_RE,"false");
CONST(DO_NUKE,"false");
CONST(JxMxE_spunkveh,"false");
CONST(JxMxE_spunkveh2,"false");
CONST(JxMxE_spunkair,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"false");

SVAR_UINS["RscDisplayRemoteMissions",displayNull]; //For Spy-Glass..
SVAR_UINS["RscDisplayMultiplayer",displayNull];

//Check for copy-pasters of Dev-Con styled execution.
//Because I am nice, add these to the following below to allow CBA; "CBA_CREDITS_CONT_C","CBA_CREDITS_M_P
private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = ["Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole",
"Version","TraffLight","Feedback","MessageBox","CBA_Credits_Cont_C","CBA_CREDITS_M_P","cba_help_credits"];

{
	if (!((configName _x) in _allowedChildren)) exitWith {
		[steamid,0,"Modified MPInterrupt",format["Modified MPInterrupt: %1",configName _x]] remoteExecCall ["SunriseServer_system_rcon",RSERV];
	};
} foreach _children;

/* Forgot to include this but this is also also a popular method for "unreleased" stuff */
if (getText(configFile >> "CfgFunctions" >> "init") != "A3\functions_f\initFunctions.sqf") then {
	[steamid,0,"Modified Functions Init","Modified Functions Init"] remoteExecCall ["SunriseServer_system_rcon",RSERV];
};

//delete all map EH
//findDisplay 12 displayCtrl 51 ctrlSetEventHandler ["draw","_this call BIS_fnc_strategicMapOpen_draw"];
(findDisplay 12 displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
(findDisplay 12 displayCtrl 1202) ctrlRemoveAllEventHandlers "ButtonClick";
(findDisplay 12 displayCtrl 1201) ctrlRemoveAllEventHandlers "ButtonClick";

[uiNamespace, "OnDisplayRegistered"] call BIS_fnc_removeAllScriptedEventHandlers;
[uiNamespace, "OnDisplayUnregistered"] call BIS_fnc_removeAllScriptedEventHandlers;

//check inject
private _array = profileNamespace getVariable ["cba_keybinding_registry_v3",["#CBA_HASH#", [], [], nil]];
_array = _array select 2;
_array = str(_array);

if ((["{", _array] call BIS_fnc_inString) || (["}", _array] call BIS_fnc_inString)) then {
	[["cheat",[format["Inject code - > %1",_array]],profileName,steamid],"customLog"] call SunriseClient_system_hcExec;
	[steamid,0,"Modified Functions Init","Cheater - Inject code"] remoteExecCall ["SunriseServer_system_rcon",RSERV];
};

[] spawn {
disableSerialization;
_badIDDsToKick = ["Display #-1337","Display #133","Display #167","Display #1340","Display #1341","Display #1342","Display #1343","Display #1344","Display #1345","Display #1346","Display #1347"];
_badIDDsToClose =
[
	"Display #2",
	"Display #3",
	"Display #7",
	"Display #17",
	"Display #19",
	"Display #25",
	"Display #26",
	"Display #27",
	"Display #28",
	"Display #29",
	"Display #30",
	"Display #31",
	"Display #32",
	"Display #37",
	"Display #40",
	"Display #41",
	"Display #43",
	"Display #44",
	"Display #45",
	"Display #51",
	"Display #52",
	"Display #56",
	"Display #74",
	"Display #85",
	"Display #106",
	"Display #126",
	"Display #127",
	"Display #132",
	"Display #146",
	"Display #147",
	"Display #152",
	"Display #153",
	"Display #155",
	"Display #159",
	"Display #164",
	"Display #314",
	"Display #632",
	"Display #1320",
	"Display #2121",
	"Display #69",
	"Display #312"
];

//"Display #150",
//"Display #262",
//"Display #162",
//"Display #157",
//"Display #53",
//"Display #129",
//"Display #148",
//"Display #151",
//"Display #154",
//"Display #163",
//"Display #169",

	if (isNil "spyGlassTimer") then {spyGlassTimer = (time - 3)};


	for "_i" from 0 to 1 step 0 do {
		{
			if(!isNull _x)then
			{
				_display = _x;
				_strx = str _x;
				if(_strx in _badIDDsToKick)then
				{
					if ((time - spyGlassTimer) > 2) then {
						spyGlassTimer = time;
						[["cheat",[format["Bad display, array #1: %1;",_strx]],profileName,steamid],"customLog"] call SunriseClient_system_hcExec;
						[steamid,0,"Modified Functions Init","Cheater - Inject code2"] remoteExecCall ["SunriseServer_system_rcon",RSERV];
					};
				}
				else
				{
					if(_strx in _badIDDsToClose)then
					{
						if ((time - spyGlassTimer) > 2) then {
							spyGlassTimer = time;
							[["cheat",[format["Bad display, array #2: %1;",_strx]],profileName,steamid],"customLog"] call SunriseClient_system_hcExec;
							[steamid,0,"Modified Functions Init","Cheater - Inject code3"] remoteExecCall ["SunriseServer_system_rcon",RSERV];
						};
						_x closeDisplay 0;
						closeDialog 0;
						closeDialog 0;
						closeDialog 0;
					};
				};
			};
		} forEach allDisplays;
		uiSleep 0.6;
	};
};

[] spawn SunriseClient_spyglass_cmdMenuCheck;
[] spawn SunriseClient_spyglass_menuCheck; 