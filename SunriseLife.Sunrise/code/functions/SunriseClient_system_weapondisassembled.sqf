/*

	Filename: 	SunriseClient_system_WeaponDisassembled.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_unit",ObjNull,[ObjNull]],
	["_primaryBag",ObjNull,[ObjNull]],
	["_secondaryBag",ObjNull,[ObjNull]]
];
/*
systemchat format ["_this: %1", _this];
systemchat format ["_primaryBag: %1", _primaryBag];
systemchat format ["_secondaryBag: %1", _secondaryBag];
*/

systemchat format ["_this: %1", _this];

if (!isNull _secondaryBag) then
{
	_containers = nearestObjects[_unit,["GroundWeaponHolder"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
};



