// Checks for updates to server level
// added this to init.sqf for convience

while {1 == 1} do
{
	sleep 60;
	diag_log format["[Donation System] callDatabase.sqf Fired"];
	_result = call compile preprocessFileLineNumbers ("addons\sigAddons\gearLevel\callDatabase.sqf"); //Go and grab the new level from a database call function
	if (count _result > 0) then
		{
			ServerLevel = _result select 0;
		};

	publicVariable "ServerLevel"; //Send it to the masses!!!!
	sleep 240;
};