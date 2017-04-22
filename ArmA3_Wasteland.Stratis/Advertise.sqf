// ******************************************************************
// Advertise.sqf 
// Author: Wildstingray
// ver 1.0
// 
// Waits 3 minutes for server to be running for first message then 
// writes a message on players screen every X seconds (_delay)
// List each message on a separate line [your message], and end with a 
// comma EXCEPT the last message, no comma for last element of an array.
// 
// Include this file in your mission folder and in your init.sqf
// add this line
// if (!isserver) then {[]execvm "advertise.sqf";};
//
//
// The lines after this are for the Repeated MOTD
// *******************************************************************/

vS = 296;
vS2 = 2;
sleep 300;

//while {true} do
//{
//	"Welcome To [SiV] Wasteland, Server restarts every 6 hours, 12 & 6 am/pm EST" remoteExec ["systemChat", -2];
//	sleep vS2;
//	"Join ts.compactgamers.com to report bugs or make Suggestions" remoteExec ["systemChat", -2];
//	sleep vS2;
//	"Remember to always shoot first, Have Fun!!!" remoteExec ["systemChat", -2];
//	sleep Vs;
//};




// ********************* Server Restart Function after this line ******************/
_delay1 = 20520;//15 minutes left
_messageArray1 = [
	["The Server will restart in 15 minutes"]
];

while {true} do
{
	sleep _delay1;
	_msg = _messageArray1 select (random (count _messageArray - 1));
	["<t size='.65' color='1cee09' align='left' font='PuristaSemibold'>_msg<br /></t>", -1,-1,4,1,0,789 ] spawn BIS_fnc_dynamicText
};

_delay2 = 21120;//5 minutes left
_messageArray2 = [
	["The Server will restart in 5 minutes"]
];

while {true} do
{
	sleep _delay2;
	_msg = _messageArray2 select (random (count _messageArray - 1));
	["<t size='.65' color='1cee09' align='left' font='PuristaSemibold'>_msg<br /></t>", -1,-1,4,1,0,789 ] spawn BIS_fnc_dynamicText
};

_delay3 = 21300;//2 minutes left
_messageArray3 = [
	["The Server will restart in 2 minutes!!!!!"]
];

while {true} do
{
	sleep _delay3;
	_msg = _messageArray3 select (random (count _messageArray - 1));
	["<t size='.65' color='1cee09' align='left' font='PuristaSemibold'>_msg<br /></t>", -1,-1,4,1,0,789 ] spawn BIS_fnc_dynamicText
};