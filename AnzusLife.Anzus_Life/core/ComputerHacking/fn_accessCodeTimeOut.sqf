while{true} do
{
	waitUntil{life_computer1CannotBeHacked || life_computer2CannotBeHacked || life_computer3CannotBeHacked || life_computer4CannotBeHacked};
	uiSleep 1800; //sleep for 30 minutes
	call ANZUS_fnc_resetCommandCodes; //recycle function cops use to reset the codes for this.
};
