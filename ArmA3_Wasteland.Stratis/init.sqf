// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Description: The main init.

#include "debugFlag.hpp"

#ifdef A3W_DEBUG
#define DEBUG true
#else
#define DEBUG false
#endif

enableSaving [false, false];

// block script injection exploit
inGameUISetEventHandler ["PrevAction", ""];
inGameUISetEventHandler ["Action", ""];
inGameUISetEventHandler ["NextAction", ""];

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

CHVD_allowNoGrass = true;
CHVD_allowTerrain = false; // terrain option has been disabled out from the menu due to terrible code, this variable has currently no effect
CHVD_maxView = 5000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 5000; // Set maximimum object view distance (default: 12000)

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			9999 cutText ["Welcome to [SiG] Wasteland, please wait for your client to initialize", "BLACK", 0.01];

			waitUntil {!isNull player};
			player setVariable ["playerSpawning", true, true];
			playerSpawning = true;

			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;

			execVM "client\init.sqf";

			if ((vehicleVarName player) select [0,17] == "BIS_fnc_objectVar") then { player setVehicleVarName "" }; // undo useless crap added by BIS
		}
		else // Headless
		{
			waitUntil {!isNull player};
			if (getText (configFile >> "CfgVehicles" >> typeOf player >> "simulation") == "headlessclient") then
			{
				execVM "client\headless\init.sqf";
			};
		};
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

if (hasInterface || isServer) then
{
	//init 3rd Party Scripts
	[] execVM "addons\parking\functions.sqf";
	[] execVM "addons\storage\functions.sqf";
	[] execVM "addons\vactions\functions.sqf";
	[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
	[] execVM "addons\proving_ground\init.sqf";
	[] execVM "addons\JumpMF\init.sqf";
	[] execVM "addons\outlw_magrepack\MagRepack_init.sqf";
	[] execVM "addons\APOC_Airdrop_Assistance\init.sqf";
	[] execVM "addons\lsd_nvg\init.sqf";
	[] execVM "addons\stickyCharges\init.sqf";
	[] execVM "addons\hvt\HvT.sqf";
	[] execVM "addons\StatusBar\statusBar.sqf";
	[] execVM "addons\sigAddons\gearLevel\updateGearLevel.sqf";
	[] execVM "addons\sigAddons\globalMessage\chat.sqf";
	[] execVM "addons\sigAddons\hackers\init.sqf";
	if (isNil "drn_DynamicWeather_MainThread") then { drn_DynamicWeather_MainThread = [] execVM "addons\scripts\DynamicWeatherEffects.sqf" };
};

// Remove line drawings from map
(createTrigger ["EmptyDetector", [0,0,0], false]) setTriggerStatements
[
	"!triggerActivated thisTrigger", 
	"thisTrigger setTriggerTimeout [30,30,30,false]",
	"{if (markerShape _x == 'POLYLINE') then {deleteMarker _x}} forEach allMapMarkers"
];

// *********************************************** Add Custom Sections Below This Line ***************************************************

/*
ServerLevel = ["getServerLevel", 2] call extDB_Database_async;
publicVariable "ServerLevel";

while (1) do
{
	sleep 300;
	
	diag_log format["[Donation System] getServerLevel.sqf Fired"];
	ServerLevel = call compile preprocessFileLineNumbers ("addons\sigAddons\gearLevel\getServerLevel.sqf"); //Go and grab the new level from a database call function
	if (count ServerLevel > 0) then
		{
			ServerLevel = ServerLevel select 0;
		};
	publicVariable "ServerLevel"; //Send it to the masses!!!!
}
*/

// Coefficent of weapon Sway
//{
//	if (true) then 
//	{
//		_x enableFatigue false;
//		_x enableStamina false;
//		_x setCustomAimCoef 0.001;
//		_x addEventHandler 
//		[
//			"Respawn",
//			{
//				(_this select 0) enableFatigue false;
//				(_this select 0) enableStamina false;
//				(_this select 0) setCustomAimCoef 0.001;
//			}
//		];
//	};
//} foreach (playableUnits + switchableUnits);

// Server Restart Announcements and MOTD
if (!isserver) then {[]execvm "advertise.sqf";};