/*

	Filename:   SunriseClient_hazard_deleteParticleSource.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
private _trigger = param [0,objNull,[objNull]];
private _source = _trigger getVariable ["anomaly_particle_source", objNull];
if !(isNull _source) then {deleteVehicle _source;};