/*

	Filename: 	SunriseClient_system_getPassportText.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
[] call SunriseClient_system_passportConfig;

private _flag = switch(true) do {
	case (player getVariable ["fakeside",false]): {"civ"};
	case (life_copDuty): {"cop"};
	case (life_medDuty): {"med"};
	default {"civ"};
};
private _img = format ["<img size='10' color='#FFFFFF' image='%1'/>",M_CONFIG(getText,"LifeCfgPassports",life_myPassportID,"image")];
private _side = M_CONFIG(getText,"LifeCfgPassportsTexts",_flag,"text");

if (GVAR_RTITLE(player) == "") then {
	format["%1<br/><br/><t color='#e8c302' size='0.85'>Имя</t><br/><t size='1.5'>%2</t><br/><br/><t color='#e8c302' size='0.85'>Фракция</t><br/><t size='1.2'>%3</t><br/><br/><t color='#e8c302' size='0.85'>Номер паспорта</t><br/><t size='1'>%4</t><br/><br/>",_img,GVAR_RNAME(player),_side,getPlayerUID player];
} else {
	format["%1<br/><br/><t color='#e8c302' size='0.85'>Имя</t><br/><t size='1.2' color ='#00fffc'>%2</t><br/><t size='1.5'>%3</t><br/><br/><t color='#e8c302' size='0.85'>Фракция</t><br/><t size='1.2'>%4</t><br/><br/><t color='#e8c302' size='0.85'>Номер паспорта</t><br/><t size='1'>%5</t><br/><br/>",_img,GVAR_RTITLE(player),GVAR_RNAME(player),_side,getPlayerUID player];
};
