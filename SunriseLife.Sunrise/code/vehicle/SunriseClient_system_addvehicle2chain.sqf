/*

	Filename: 	SunriseClient_system_addvehicle2chain.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
_vehicle = param [0,ObjNull,[ObjNull]];
if !(_vehicle in life_vehicles) then
{
	life_vehicles pushBack _vehicle;
};