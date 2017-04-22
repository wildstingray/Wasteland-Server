// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
//_player unlinkItem "ItemGPS";
_player linkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "NVGoggles";

_player addBackpack "B_TacticalPack_mcamo";

_player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
_player addWeapon "arifle_TRG21_F";
_player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
_player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
_player addItem "FirstAidKit";
_player selectWeapon "arifle_TRG21_F";
_player addMagazine "HandGrenade";

switch (ServerLevel) do
{
	case 1:
	{
		switch (true) do
		{
			case (["_medic_", typeOf _player] call fn_findString != -1):
			{
				_player removeItem "FirstAidKit";
				_player addItem "Medikit";
			};
			case (["_engineer_", typeOf _player] call fn_findString != -1):
			{
				_player addItem "MineDetector";
				_player addItem "Toolkit";
				_player removeWeapon "arifle_TRG21_F";
				_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
				_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
				_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
				_player addMagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
				_player addWeapon "arifle_Mk20_plain_F";
				_player addMagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
				_player addMagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
				_player addMagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
				_player addMagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
			};
			case (["_sniper_", typeOf _player] call fn_findString != -1):
			{
				_player addWeapon "Rangefinder";
				_player removeWeapon "arifle_TRG21_F";
				_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
				_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
				_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addWeapon "arifle_MX_F";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addPrimaryWeaponItem "optic_ACO_grn";
			};
		};
	};
	case 2:
	{
	_player addMagazine "HandGrenade";
	_player removeWeapon "arifle_TRG21_F";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	_player addWeapon "arifle_MXC_F";
	_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
	_player addPrimaryWeaponItem "optic_ACO_grn";

		switch (true) do
		{
			case (["_medic_", typeOf _player] call fn_findString != -1):
			{
				_player removeItem "FirstAidKit";
				_player addItem "Medikit";
			};
			case (["_engineer_", typeOf _player] call fn_findString != -1):
			{
				_player addItem "MineDetector";
				_player addItem "Toolkit";
				_player removeWeapon "arifle_MXC_F";
				_player removeMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player removeMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player removeMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
				_player addWeapon "arifle_MX_SW_F";
				_player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
			};
			case (["_sniper_", typeOf _player] call fn_findString != -1):
			{
				_player addWeapon "Rangefinder";
				_player removeWeapon "arifle_MXC_F";
				_player removeMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player removeMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player removeMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addWeapon "arifle_MXM_Hamr_pointer_F";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
			};
		};
	};
	case 3:
	{
	_player addMagazine "HandGrenade";
	_player removeWeapon "arifle_TRG21_F";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
	_player addWeapon "arifle_MX_SW_Hamr_pointer_F";
	_player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
	_player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
	
		switch (true) do
		{
			case (["_medic_", typeOf _player] call fn_findString != -1):
			{
				_player removeItem "FirstAidKit";
				_player addItem "Medikit";
			};
			case (["_engineer_", typeOf _player] call fn_findString != -1):
			{
				_player addItem "MineDetector";
				_player addItem "Toolkit";
				_player addMagazine "RPG32_F";
				_player addWeapon "launch_RPG32_F";
			};
			case (["_sniper_", typeOf _player] call fn_findString != -1):
			{
				_player addWeapon "Rangefinder";
				_player removeWeapon "arifle_MX_SW_Hamr_pointer_F";
				_player removeMagazine "100Rnd_65x39_caseless_mag_Tracer";
				_player removeMagazine "100Rnd_65x39_caseless_mag_Tracer";
				_player removeMagazine "100Rnd_65x39_caseless_mag_Tracer";
				_player addMagazine "20Rnd_762x51_Mag";
				_player addWeapon "srifle_EBR_ARCO_pointer_F";
				_player addMagazine "20Rnd_762x51_Mag";
				_player addMagazine "20Rnd_762x51_Mag";
				_player addMagazine "20Rnd_762x51_Mag";
				_player addMagazine "20Rnd_762x51_Mag";
			};
		};
	};
	case 4:
	{
	_player addMagazine "HandGrenade";
	_player removeWeapon "arifle_TRG21_F";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player removeMagazine "30Rnd_556x45_Stanag_Tracer_Green";
	_player addMagazine "10Rnd_762x54_Mag";
	_player addWeapon "srifle_DMR_01_ACO_F";
	_player addMagazine "10Rnd_762x54_Mag";
	_player addMagazine "10Rnd_762x54_Mag";
	_player addMagazine "10Rnd_762x54_Mag";
	_player addMagazine "10Rnd_762x54_Mag";
	_player addMagazine "10Rnd_762x54_Mag";
	
		switch (true) do
		{
			case (["_medic_", typeOf _player] call fn_findString != -1):
			{
				_player removeItem "FirstAidKit";
				_player addItem "Medikit";
			};
			case (["_engineer_", typeOf _player] call fn_findString != -1):
			{
				_player addItem "MineDetector";
				_player addItem "Toolkit";
				_player removeWeapon "srifle_DMR_01_ACO_F";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player addMagazine "200Rnd_65x39_cased_Box_Tracer";
				_player addWeapon "LMG_Mk200_MRCO_F";
				_player addMagazine "200Rnd_65x39_cased_Box_Tracer";
				_player addMagazine "200Rnd_65x39_cased_Box_Tracer";
				_player addMagazine "RPG32_F";
				_player addWeapon "launch_RPG32_F";
			};
			case (["_sniper_", typeOf _player] call fn_findString != -1):
			{
				_player addWeapon "Rangefinder";
				_player removeWeapon "srifle_DMR_01_ACO_F";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player removeMagazine "10Rnd_762x54_Mag";
				_player addMagazine "10Rnd_338_Mag";
				_player addWeapon "srifle_DMR_02_DMS_F";
				_player addMagazine "10Rnd_338_Mag";
				_player addMagazine "10Rnd_338_Mag";
				_player addMagazine "10Rnd_338_Mag";
				_player addMagazine "10Rnd_338_Mag";
			};
		};
	};
};

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
