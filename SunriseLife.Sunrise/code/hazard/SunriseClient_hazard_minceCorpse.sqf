/*

	Filename: 	SunriseClient_hazard_minceCorpse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _body = param [0,objNull,[objNull]];
if (isNull _body) exitWith {};

_body hideObject true;
_body spawn {
	private _proxy = "Land_HelipadEmpty_F" createVehicleLocal position _this;
	_proxy enableSimulation false;
	_proxy setPos (_this modelToWorld [0,0,0]);
	_proxy say3D "anomaly_body_tear_1";
	sleep 15;
	deleteVehicle _this;
	deleteVehicle _proxy;
};
private _source = "#particlesource" createVehicleLocal getPos _body;
[_body, _source, "meat"] call SunriseClient_hazard_effectMeatgrinder;
_source spawn {
	sleep 0.75;
	deleteVehicle _this;
};