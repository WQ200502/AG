/*

	Filename: 	SunriseClient_processing_menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _vendor = param [0,ObjNull,[ObjNull]];
private _type = param [3,"",[""]];

if (isNull _vendor OR (EQUAL(_type,"")) OR (player distance _vendor > 10) OR !(NOTINVEH(player))) exitWith {};
if !(EQUAL(CURWEAPON,"")) exitWith {hint "Освободите свои руки, уберите оружие за спину"};

life_process_info = switch (_type) do {
	case "oil": {[[["oil",1]],"oilp",localize "STR_Process_Oil"]};
	case "petrol": {[[["oilp",1]],"petrol",localize "STR_MF_ResProcOilToGasoline"]};
	
	case "copper": {[[["copper_ore",1]],"copper",localize "STR_Process_Copper"]};
	case "bronze": {[[["bronze_ore",1]],"bronze",localize "STR_MF_ResProcBronzeC"]};
	case "iron": {[[["iron_ore",1]],"iron",localize "STR_Process_Iron"]};
	case "silver": {[[["silver_ore",1]],"silver",localize "STR_MF_ResProcSilver"]};
	case "wood": {[[["wood",1]],"woodp","STR_MF_ResProcWoodbU"]};
	
	case "fish": {[[["fish",1]],"fish_meat",localize "STR_Process_Sand"]};
	
	// Нелегал
	case "marijuana": {[[["cannabis_unpr",1]],"cannabis",localize "STR_Process_Marijuana"]};
	case "heroin": {[[["heroinu",1]],"heroinp",localize "STR_Process_Heroin"]};
	case "cocaine": {[[["cocaine",1]],"cocainep",localize "STR_Process_Cocaine"]};
	case "meth": {[[["methu",1]],"methp",localize "STR_MF_ResProcMeth"]};
	
	//Алкоголь
	case "sand": {[[["sand",1]],"glass",localize "STR_Process_Sand"]};
	case "glassbottle":{[[["glass",1]],"bottles",localize "STR_MF_ResProcMakeBottles"]};
	case "bottledshine": {[[["moonshine",1],["bottles",1]],"bottledshine",localize "STR_MF_ResProcMoonshinePour"]};
	case "bottledbeer": {[[["beerp",1],["bottles",1]],"bottledbeer",localize "STR_MF_ResProcBeerPour"]};
	case "bottledwhiskey": {[[["whiskey",1],["bottles",1]],"bottledwhiskey",localize "STR_MF_ResProcWhiskeyPour"]};
	case "mash": {[[["hops",1],["cornmeal",1]],"mash",localize "STR_MF_ProcActMash"]};
	case "whiskey": {[[["yeast",1],["rue_unpr",1]],"whiskey",localize "STR_MF_ProcActWhiskey"]};
	case "moonshine": {[[["yeast",1],["mash",1]],"moonshine",localize "STR_MF_ProcActMoonshine"]};
	case "beer": {[[["yeast",1],["hops",1]],"beerp",localize "STR_MF_ResProcBrewery"]};
	
	
	case "gas": {[[["gasu",1]],"gasp",localize "STR_MF_ResProcGas"]};
	case "ammonia": {[[["gasp",1]],"ammonia",localize "STR_MF_ResProcAmmonia"]};
	case "shrimp": {[[["shrimp",1]],"shrimp_s",localize "STR_MF_ResProcShrimp"]};
	case "diamond": {[[["diamond",1]],"diamondc",localize "STR_Process_Diamond"]};
	case "jeweler": {[[["diamondc",1]],"jewelry",localize "STR_MF_ResProcJewelry"]};
	case "coppertape": {[[["copper_r",1]],"copper_tape",localize "STR_MF_ResProcCopTapes"]};
	case "salt": {[[["salt",1]],"salt_r",localize "STR_Process_Salt"]};
	case "tobacco": {[[["tobacco",1]],"cigar",localize "STR_MF_ResProcCigar"]};
	case "medmarijuana": {[[["cannabis",1]],"marijuana",localize "STR_Process_Marijuana"]};
	case "cement": {[[["rock",1]],"cement",localize "STR_Process_Cement"]};
	case "uranium": {[[["uraniumu",1]],"uraniump",localize "STR_MF_ResProcUran"]};
	case "uraniumclean": {[[["uraniump",1]],"uraniumc",localize "STR_MF_ResProcUran2"]};
	case "mash": {[[["hops",1],["cornmeal",1]],"mash",localize "STR_MF_ProcActMash"]};


	//tanoa
	case "sugar": {[[["sugar",1]],"sugarp","Переработка сахара"]};
	case "olive": {[[["olivec",10],["allup",2]],"olivep","Консервирование оливок"]};
	case "amber": {[[["amber",1]],"amberp","Переработка янтаря"]};
	case "pearl": {[[["pearl",3]],"pearlp","Переработка жемчуга"]};
	case "coffee": {[[["coffee",3]],"coffeep","Производство кофе"]};
	case "coquinap": {[[["coquina",1]],"coquinap","Опрессовка ракушечника"]};
	case "woodbu": {[[["woodb",1]],"woodbu","Переработка черного дерева"]};
	case "woodbp": {[[["woodbu",2]],"woodbp","Распил черного дерева"]};
	case "woodrp": {[[["woodr",2]],"woodrp","Распил красного дерева"]};
	case "bdiamond": {[[["blackd",1]],"blackdp","Переработка черного алмаза"]};
	case "allup": {[[["bauxites",1]],"allup","Переработка аллюминия"]};
	case "bronzec": {[[["bronze",1]],"bronzec","Очистка бронзы"]};
	case "bronzep": {[[["bronzec",1]],"bronzep","Производство бронзовой чушки"]};
	case "obsid": {[[["obsid",1]],"obsidp","Переработка обсидиана"]};
	case "opium": {[[["opium",3]],"opiump","Производство опиума"]};
	case "weppartp": {[[["weppart",1]],"weppartp","Очистка фрагмента оружия"]};
	case "royalcp": {[[["royalc",1]],"royalcp","Переработка краба"]};
	case "cacaop": {[[["cacao",3],["sugarp",3]],"cacaop","Производство шоколада"]};
	case "dish": {[[["cacaop",3],["sugarp",3],["anana",3],["banana",3]],"dish","Производство торта"]};
	case "roma": {[[["sugarp",4],["anana",1],["arwater",1]],"roma","Производство рома"]};
	case "sofa": {[[["woodbp",3],["woodbu",2],["nails",10]],"sofa","Производство мебели"]};

	default {[]};
};

//Error checking
if (EQUAL(life_process_info,[])) exitWith {};

private _cops = (count units life_copGroup);
private _cop_min_illegal = [] call SunriseClient_system_copsForIllegal;

if (_type in ["uranium","uraniumclean"] && _cops < LIFE_SETTINGS(getNumber,"life_cop_min")) exitWith {
	hint format["Для переработки урана необходимо как минимум %1 полицейских на острове.",LIFE_SETTINGS(getNumber,"life_cop_min")];
};

//private _index = [life_process_info select 1,life_illegal_items] call SunriseClient_system_index;
//if (!(EQUAL(_index,-1)) && _cops < _cop_min_illegal && (call life_adminlevel isEqualTo 0)) exitWith {
//	hint format["Для переработки нелегальных ресурсов необходимо как минимум %1 полицейских на острове.",_cop_min_illegal];
//};

/*private _canProcess = true;
private _gangResource = switch (worldName) do {
	case "Sunrise": {[mari_processor,coke_processor,heroin_processor,meth_processor,uran_processor,uran_processor_clean]};
	case "Tanoa" : {[]};
	default {[]};
};
if (_vendor in _gangResource) then {
	private _gang = _vendor GVAR ["proc_owner",-1];
	if (_gang isEqualTo -1) exitWith {};

	private _whoCan = _vendor GVAR ["canProcess",[]];
	if ((_gang isEqualTo ((group player) getVariable ["gang_id",-1])) OR ((getPlayerUID player) in _whoCan)) exitWith {};

	private _gangName = _vendor GVAR ["proc_name",""];
	if (EQUAL(_gangName,"")) exitWith {hint "Ошибка получения имени банды. Сообщите админу."};

	private _valToPay = if ('nkvd' in life_licenses or 'sector7' in life_licenses) then {250000} else {100000};

	private _action = [
		format["回收器是由组 %1. 你必须支付贡品或控制它来回收资源。您同意缴纳金额为 $%2?",_gangName,[_valToPay] call SunriseClient_system_numberText],
		"Переработчик находится под контролем...",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;

	if (_action) then {
		if (BANK < _valToPay) exitWith {_canProcess = false; ["У вас нет необходимой суммы на банковском счете","error"] call SunriseClient_gui_bottomNotification;};
		["atm","take",_valToPay] call SunriseClient_system_myCash;

		[[str(_vendor),_gang,_valToPay],"capturePay","SYS",false] call SunriseClient_system_hcExec;

		_whoCan pushBack steamid;
		_vendor SVAR ["canProcess",_whoCan,true];

		hint "Вы оплатили дань и можете перерабатывать ресурс";
	} else {
		_canProcess = false;
		hint "Вы отказались от уплаты дани и не можете перерабатывать";
	};
};

if !(_canProcess) exitWith {titleText["Переработка отменена","PLAIN"];};*/

if (EQUAL(_type,"meth") && !(EQUAL((uniform player),""))) exitWith {
	hint format["Для варки мета вам необходимо быть в трусах, иначе одежда пропахнет..."];
	if (EQUAL(life_meth_bb,0)) then {
		"SmokeShellRed" createVehicle (getMarkerPos "meth_flash");
		life_meth_bb = 1;
	};
	player say3D "meth_bb";
};

disableSerialization;
if (isNull (findDisplay 5000)) then {
	if !(createDialog "SunriseDialogProcessing") exitWith {};
};

private _title = CONTROL(5000,5001);
_title ctrlSetText format ["%1",life_process_info select 2];

[life_process_info] call SunriseClient_processing_update;

private _progress = CONTROL(5000,5006);
private _pgText = CONTROL(5000,5007);

_pgText ctrlSetText "";
_progress progressSetPosition 0;

