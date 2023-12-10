/*

	Filename: 	SunriseServer_system_vote.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
_voterid = param [0];
_candidate = param [1];

_query = format ["UPDATE players,politics SET players.voted=1, politics.votecount=politics.votecount+1 WHERE players.playerid = '%1' and politics.uid='%2'",_voterid,_candidate];
[_query,1] call SunriseServer_database_asyncCall;