/*
	Medical Ural Attack by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Format by Vampire
	Updated for DZMS 2.0 by JasonTM
*/

local _mission = count DZMSMissionData -1;
local _aiType = _this select 0;
local _coords = call DZMSFindPos;
local _name = "Ural Ambush";
local _localName = "STR_CL_DZMS_URAL_TITLE";
local _hero = _aiType == "Hero";
local _markerColor = ["ColorRed","ColorBlue"] select _hero;
local _localized = ["STR_CL_MISSION_BANDIT","STR_CL_MISSION_HERO"] select _hero;
local _startTime = diag_tickTime;

diag_log format["[DZMS]: %1 %2 starting at %3.",_aiType,_name,_coords];

////////////////////// Do not edit this section ///////////////////////////
//[position,createMarker,setMarkerColor,setMarkerType,setMarkerShape,setMarkerBrush,setMarkerSize,setMarkerText,setMarkerAlpha]
local _markers = [1,1,1,1];
_markers set [0, [_coords,"DZMS" + str _mission,_markerColor,"","ELLIPSE","Grid",[200,200],[],0]];
_markers set [1, [_coords,"DZMSDot" + str _mission,"ColorBlack","Vehicle","","",[],[_localized,_localName],0]];
if (DZMSAutoClaim) then {_markers set [2, [_coords,"DZMSAuto" + str _mission,"ColorRed","","ELLIPSE","Border",[DZMSAutoClaimAlertDistance,DZMSAutoClaimAlertDistance],[],0]];};
DZE_ServerMarkerArray set [count DZE_ServerMarkerArray, _markers]; // Markers added to global array for JIP player requests.
local _markerIndex = count DZE_ServerMarkerArray - 1;
PVDZ_ServerMarkerSend = ["start",_markers];
publicVariable "PVDZ_ServerMarkerSend";
[_aiType,_localName,"STR_CL_DZMS_URAL_START"] call DZMSMessage;
DZMSMarkerReady = true;

// Add the mission's position to the global array so that other missions do not spawn near it.
DZE_MissionPositions set [count DZE_MissionPositions, _coords];
local _posIndex = count DZE_MissionPositions - 1;

// Wait until a player is within range or timeout is reached.
local _playerNear = false;
local _timeout = false;
while {!_playerNear && !_timeout} do {
	_playerNear = [_coords,DZMSTimeoutDistance] call DZMSNearPlayer;
	
	if (diag_tickTime - _startTime >= (DZMSMissionTimeOut * 60)) then {
		_timeout = true;
	};
	uiSleep 1;
};

if (_timeout) exitWith {
	[_mission, _aiType, _markerIndex, _posIndex] call DZMSAbortMission;
	[_aiType,_localName,"STR_CL_DZMS_URAL_FAIL"] call DZMSMessage;
	diag_log format["DZMS: %1 %2 aborted.",_aiType,_name];
};
//////////////////////////////// End //////////////////////////////////////

// Spawn Mission Objects
[[
	["UralWreck",[0,0],149.64919],
	["Body",[-2.2905,-3.3438],61.798588],
	["Body",[-2.8511,-2.4346],52.402905],
	["Body",[-3.435,-1.4297],-117.27345],
	["Body2",[-4.0337,0.5],23.664057]
],_coords,_mission] call DZMSSpawnObjects;

//We create the vehicles like normal
[_mission,_coords,DZMSSmallVic,[5.7534,-9.2149]] call DZMSSpawnVeh;

// Spawn crates
[_mission,_coords,"DZ_AmmoBoxMedium1US","supply",[2.6778,-3.0889],-28.85478] call DZMSSpawnCrate;
[_mission,_coords,"DZ_MedBox","medical",[1.4805,-3.7432],62.744293] call DZMSSpawnCrate;
[_mission,_coords,"DZ_AmmoBoxMedium2US","weapons",[2.5405,-4.1612],-27.93351] call DZMSSpawnCrate;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, AI type, mission number]
[[(_coords select 0) - 6.9458,(_coords select 1) - 3.5352, 0],6,1,_aiType,_mission] call DZMSAISpawn;
[[(_coords select 0) + 4.4614,(_coords select 1) + 2.5898, 0],6,1,_aiType,_mission] call DZMSAISpawn;
[[(_coords select 0) + 4.4614,(_coords select 1) + 2.5898, 0],4,1,_aiType,_mission] call DZMSAISpawn;

// Spawn Static M2 Gunner positions if enabled.
if (DZMSM2Static) then {
	[[
	[(_coords select 0) + 11.64,(_coords select 1) + 11.5, 0],
	[(_coords select 0) - 9.37,(_coords select 1) - 14.58, 0]
	],0,_aiType,_mission] call DZMSM2Spawn;
};

// Start the mission loop.
[
	_mission,
	_coords,
	_aiType,
	_name,
	_localName,
	_markerIndex,
	_posIndex,
	"STR_CL_DZMS_URAL_WIN",
	"STR_CL_DZMS_URAL_FAIL"
] spawn DZMSWaitMissionComp;
