/*
	
	Filename: 	SunriseClient_system_licensesread.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params[
	["_civ","",[""]],
	["_licenses",(localize "STR_Cop_NoLicenses"),[""]]
];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +(localize "STR_Cop_Licenses")+ "</t></t><br/>%2",_civ,_licenses];