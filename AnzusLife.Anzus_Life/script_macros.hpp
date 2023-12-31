/* System Wide Stuff */
#define SYSTEM_TAG "life"
#define ITEM_TAG format ["%1%2",SYSTEM_TAG,"item_"]
#define CASH phRzBRcKJaTpqRLHbj
#define BANK sRSKPHDQmXDiDPMBkj
#define GANG_FUNDS group player getVariable ["gang_bank",0];
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define SUB(var1,var2) var1 = var1 - var2

//RemoteExec Macros
#define RSERV 2 //Only server
#define RCLIENT -2 //Except server
#define RANY 0 //Global

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if (var isEqualType "") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[ctrl,lbCurSel ctrl])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index

//System Macros
#define LICENSE_VARNAME(varName,flag) format ["license_%1_%2",flag,M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) missionNamespace getVariable [LICENSE_VARNAME(varName,flag),false]
#define ITEM_VARNAME(varName) format ["life_inv_%1",M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) missionNamespace getVariable [ITEM_VARNAME(varName),0]
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",varName,"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"buyPrice")
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")
#define ITEM_WEIGHT(varName) M_CONFIG(getNumber,"VirtualItems",varName,"weight")

//Namespace Macros
#define SVAR_MNS missionNamespace setVariable
#define SVAR_UINS uiNamespace setVariable
#define SVAR_PNS parsingNamespace setVariable
#define SVAR_PNAS profileNamespace setVariable
#define GVAR_MNS missionNamespace getVariable
#define GVAR_UINS uiNamespace getVariable
#define GVAR_PNAS profileNamespace getVariable

//Condition Macros
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}


#define LSALIVE(unit1) unit1 GVAR ["lifeState",""] isEqualTo "HEALTHY"
#define LSNOTALIVE(unit1) unit1 GVAR ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]

#define LSINCAP(unit1) unit1 GVAR ["lifeState",""] isEqualTo "INCAPACITATED"
#define LSDEAD(unit1) unit1 GVAR ["lifeState",""] isEqualTo "DEAD"
#define LSRESP(unit1) unit1 GVAR ["lifeState",""] isEqualTo "RESPAWN"

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "CfgMaster" >> SETTING)

//UI Macros
#define LIFEdisplay (uiNamespace getVariable ["AL_Hud",displayNull])
#define LIFEctrl(ctrl) ((uiNamespace getVariable ["AL_Hud",displayNull]) displayCtrl ctrl)

//New Config Stuff
#define MAIN_SETTINGS(SETTING1,SETTING2) (missionConfigFile >> "CfgMaster" >> SETTING1 >> SETTING2)
#define MAIN_SETTINGS_TYPE(TYPE,SETTING1,SETTING2) TYPE(missionConfigFile >> "CfgMaster" >> SETTING1 >> SETTING2)
#define DevServerName MAIN_SETTINGS_TYPE(getText,"Branch","devServerName")
#define isDevServer serverName isEqualTo DevServerName
#define isDevBranch MAIN_SETTINGS_TYPE(getText,"Branch","currentBranch") isEqualTo "dev"
