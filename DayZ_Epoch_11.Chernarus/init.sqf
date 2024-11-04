// EPOCH CONFIG VARIABLES //
//#include "\z\addons\dayz_code\configVariables.sqf" // If you have problems with certain variables uncomment this line.
#include "configVariables.sqf" // Don't remove this line, path in your missionfile

// Map Specific Config //

if (isServer) then {
	dayZ_instance = 11; //Instance ID of this server
	spawnArea = 1400; // Distance around markers to find a safe spawn position
	spawnShoremode = 1; // Random spawn locations  1 = on shores, 0 = inland
};

// Setting for both server and client
DZE_SafeZonePosArray = [[[6325,7807,0],100],[[4063,11664,0],100],[[11447,11364,0],100],[[1621.91,7797,0],100],[[12944,12766,0],100],[[12060,12638,0],100]]; // Format is [[[3D POS],RADIUS],[[3D POS],RADIUS]]; Stops loot and zed spawn, salvage and players being killed if their vehicle is destroyed in these zones.

// Map Specific Config End //

enableRadio false;
enableSentences false;
//setTerrainGrid 25;

//diag_log 'dayz_preloadFinished reset';
dayz_preloadFinished=nil;
onPreloadStarted "dayz_preloadFinished = false;";
onPreloadFinished "dayz_preloadFinished = true;";
with uiNameSpace do {RscDMSLoad=nil;}; // autologon at next logon

if (!isDedicated) then {
	enableSaving [false, false];
	startLoadingScreen ["","RscDisplayLoadCustom"];
	dayz_progressBarValue = 0;
	dayz_loadScreenMsg = localize 'str_login_missionFile';
	progress_monitor = [] execVM "\z\addons\dayz_code\system\progress_monitor.sqf";
	0 cutText ['','BLACK',0];
	0 fadeSound 0;
	0 fadeMusic 0;
};

initialized = false;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
dayz_progressBarValue = 0.05;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
dayz_progressBarValue = 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
dayz_progressBarValue = 0.15;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
dayz_progressBarValue = 0.25;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\chernarus11.sqf"; //Add trader city objects locally on every machine early
initialized = true;

if (dayz_REsec == 1) then {call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\REsec.sqf";};

if (isServer) then {
	if (dayz_POIs) then {call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\chernarus\poi\init.sqf";};
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\system\dynamic_vehicle.sqf";
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\system\server_monitor.sqf";
	execVM "\z\addons\dayz_server\traders\chernarus11.sqf"; //Add trader agents
	
	//Get the server to setup what waterholes are going to be infected and then broadcast to everyone.
	if (dayz_infectiousWaterholes) then {execVM "\z\addons\dayz_code\system\mission\chernarus\infectiousWaterholes\init.sqf";};
	
	// Lootable objects from CfgTownGeneratorDefault.hpp
	if (dayz_townGenerator) then { execVM "\z\addons\dayz_code\system\mission\chernarus\MainLootableObjects.sqf"; };
};

if (!isDedicated) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\server_traders\chernarus11.sqf";
    call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\chernarus11.sqf";

	if (toLower worldName in ["chernarus","chernarus_winter"]) then {
		execVM "\z\addons\dayz_code\system\mission\chernarus\hideGlitchObjects.sqf";
	};
	
	// Enables Plant lib fixes
	execVM "\z\addons\dayz_code\system\antihack.sqf";
	
	if (dayz_townGenerator) then {execVM "\z\addons\dayz_code\compile\client_plantSpawner.sqf";};
	call compile preprocessFileLineNumbers "spawn\init.sqf";
    "PVCDZ_veh_Init" addPublicVariableEventHandler {if ((_this select 1) isKindOf "AllVehicles") then {(_this select 1) addEventHandler ["HandleDamage",{_this call fnc_veh_handleDam}];};};
	execFSM "\z\addons\dayz_code\system\player_monitor.fsm";
    call compile preprocessFileLineNumbers "dayz_code\DZAI_Client\dzai_initclient.sqf";
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	//[600,.15,30] execVM "\z\addons\dayz_code\compile\fn_chimney.sqf"; // Smoking chimney effects.
	if (DZE_R3F_WEIGHT) then {execVM "\z\addons\dayz_code\external\R3F_Realism\R3F_Realism_Init.sqf";};
	waitUntil {scriptDone progress_monitor};
	cutText ["","BLACK IN", 3];
	3 fadeSound 1;
	3 fadeMusic 1;
	endLoadingScreen;
};

[] ExecVM "map\balota.sqf";
[] ExecVM "map\noa.sqf";
[] ExecVM "map\nwa.sqf";
[] ExecVM "map\hos_nwa.sqf";
[] ExecVM "map\hos_gorka.sqf";
[] ExecVM "map\hos_novy.sqf";
[] ExecVM "map\hos_zeleno.sqf";
[] ExecVM "map\sp1_nwa.sqf";
[] ExecVM "map\sp2_stary.sqf";
[] ExecVM "map\sp3_elektro.sqf";
[] ExecVM "map\sp4_beri.sqf";
[] ExecVM "map\sp5_zeleno.sqf";
[] ExecVM "map\basebor.sqf";
[] ExecVM "map\basedichina.sqf";
[] ExecVM "map\basenovy.sqf";
[] ExecVM "map\kamenka.sqf";
[] ExecVM "map\krasno.sqf";
[] ExecVM "map\vybor.sqf";
[] ExecVM "map\NEAFS4M.sqf";
[] ExecVM "map\nwafPlayground.sqf";
[] ExecVM "map\checkpoints.sqf";
[] ExecVM "map\fobwest.sqf";
[] ExecVM "map\junkyard.sqf";
[] ExecVM "map\klamenkamillbase.sqf";
[] ExecVM "map\skalka.sqf";
[] ExecVM "map\solindustry.sqf";
[] ExecVM "map\svetlojarsk.sqf";
[] ExecVM "map\Hilltop.sqf";
[] ExecVM "map\dk_Skalisty.sqf";
