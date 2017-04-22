/*
 =======================================================================================================================

	File:		init.sqf
	Author:		T-800a

=======================================================================================================================
*/

enableSaving [ false, false ];

call compile preprocessFile "addons\sigAddons\hackers\downloadData.sqf";

waitUntil { !isNil "downloadDataDONE" };
