//Configuration for Airdrop Assistance
//Author: Apoc

APOC_AA_coolDownTime = 60; //Expressed in sec

APOC_AA_VehOptions =
[ // ["Menu Text",		ItemClassname,				Price,	"Drop Type"]
["Quadbike (Civilian)", "C_Quadbike_01_F", 			5000, 	"vehicle"],
["Offroad HMG", 		"B_G_Offroad_01_armed_F",	10000, 	"vehicle"],
["IFV-6a Cheetah AA", 	"B_T_APC_Tracked_01_AA_F", 	90000, 	"vehicle"],
["Panther APC", 		"B_T_APC_Tracked_01_rcws_F",	45000, 	"vehicle"],
["Kamysh APC", 			"O_APC_Tracked_02_cannon_F",	65000, 	"vehicle"],
["Strider HMG", 		"I_MRAP_03_hmg_F", 			22000, 	"vehicle"],
["Humming Bird Heli", 	"B_Heli_Light_01_F", 		8000, 	"vehicle"],
["Pawnee Heli", 		"B_Heli_Light_01_armed_F", 	50000, 	"vehicle"],
["Slammer (NO HMG)", 	"B_MBT_01_cannon_F", 		85000, 	"vehicle"],
["Kuma Tank", 			"I_MBT_03_cannon_F", 		100000, 	"vehicle"],
["Minigun Boat", 		"I_Boat_Armed_01_minigun_F", 	10000, 	"vehicle"],
["Rubber Ducky Boat", 	"I_G_Boat_Transport_01_", 	2000, 	"vehicle"]
];

APOC_AA_SupOptions =
[// ["stringItemName", 	"Crate Type for fn_refillBox 	,Price," drop type"]
["Launchers", 			"mission_USLaunchers", 			35000, "supply"],
["Assault Rifle", 		"mission_USSpecial", 			35000, "supply"],
["Sniper Rifles", 		"airdrop_Snipers", 				50000, "supply"],
["DLC Rifles", 			"airdrop_DLC_Rifles", 			45000, "supply"],
["DLC LMGs", 			"airdrop_DLC_LMGs", 			45000, "supply"],

//"Menu Text",			"Crate Type", 			"Cost", "drop type"
["Food",				"Land_Sacks_goods_F",	10000, 	"picnic"],
["Water",				"Land_BarrelWater_F",	10000, 	"picnic"]
];