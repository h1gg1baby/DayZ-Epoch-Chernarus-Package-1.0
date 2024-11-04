/*
	DayZ Mission System Functions by Vampire
	Updated for DZMS 2.0 by JasonTM
*/

DZMSSpawnCrate = {
	local _mission = _this select 0;
	local _cratePos = _this select 1;
	local _boxType = _this select 2;
	local _lootType = _this select 3;
	local _offset = _this select 4;
	local _z = [0, (_cratePos select 2)] select (count _cratePos == 3);
	local _cratePosition = [(_cratePos select 0) + (_offset select 0), (_cratePos select 1) + (_offset select 1), _z];
	
	if (count _offset > 2) then {
		_cratePosition set [2, (_offset select 2)];
	};
	
	// Override regular crates because of Vanilla blacklisting
	if (!DZMSEpoch) then {
		if !(_boxType == "DZ_MedBox") then {
			_boxType = "AmmoBoxBig";
		};
	};
	
	local _crate = _boxType createVehicle _cratePosition;
		
	if (count _this > 5) then {
		_crate setDir (_this select 5);
	};
	
	_crate setPos _cratePosition;
	_crate setVariable ["permaLoot",true];
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	_crate addEventHandler ["HandleDamage", {0}];
	_crate enableSimulation false;
	((DZMSMissionData select _mission) select 3) set [count ((DZMSMissionData select _mission) select 3), [_crate,_lootType]];
	_crate // return crate object for AN2 mission
};

DZMSNearPlayer = {
	local _result = false;
	local _position = _this select 0;
	local _radius = _this select 1;
	{
		if ((isPlayer _x) && (_x distance _position <= _radius)) then {
			_result = true;
		};
	} count playableUnits;
	_result
};

DZMSCleanupThread = {
	local _coords = _this select 0;
	local _mission = _this select 1;
	local _objects = _this select 2;
	local _vehicles = _this select 3;
	local _crates = _this select 4;
	local _groups = _this select 5;
	local _staticGuns = _this select 6;
	local _posIndex = _this select 7;
	local _time0ut = _this select 8;
	local _cleaned = false;
	local _time = diag_tickTime;
	
	while {!_cleaned} do {
		
		if (DZMSSceneryDespawnTimer > 0 || _time0ut) then {
			if ((diag_tickTime - _time) > DZMSSceneryDespawnTimer*60 || _time0ut) then {
				
				// delete mission objects
				{
					_x call sched_co_deleteVehicle;
				} count _objects;
				
				// delete vehicles if they are not claimed
				{
					if (_x getVariable ["DZMSCleanup" + dayz_serverKey,false]) then {
						_x call sched_co_deleteVehicle;
					};
				
				} count _vehicles;
				
				// Delete Remaining AI that are alive
				{
					if ((_x getVariable ["DZMSAI" + dayz_serverKey,nil]) select 0 == _mission) then {
						_x call sched_co_deleteVehicle;
					};
				} count allunits;
				
				// Delete Static Guns
				{
					_x call sched_co_deleteVehicle;
				} count _staticGuns;
				
				// delete mission crates if enabled
				if (DZMSSceneryDespawnLoot || _time0ut) then {
					if (count _crates > 0) then {
						// Wait until players are at least 50 meters away
						if !([_coords,50] call DZMSNearPlayer) then {
							{
								(_x select 0) call sched_co_deleteVehicle;
							} count _crates;
							_cleaned = true;
						};
					};
				} else {
					_cleaned = true;
				};
			};
		};
	};
	DZE_MissionPositions set [_posIndex, -1];
	diag_log format ["DZMS: Cleanup for mission %1 complete.",_mission];
};

// Generates the keys for mission vehicles - Epoch/Overpoch only
DZMSVehKey = {
	local _vehicle = _this;
	local _keyColor = ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
	local _keyNumber = (floor(random 2500)) + 1;
	local _keySelected = format["ItemKey%1%2",_keyColor,_keyNumber];
	local _isKeyOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
	local _characterID = str(getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid"));
	
	if (_isKeyOK) then {
		_vehicle addWeaponCargoGlobal [_keySelected,1];
		_vehicle setVariable ["CharacterID",_characterID,true];	
	} else {
		_vehicle setVariable ["CharacterID","0",true];
		diag_log format["There was a problem generating a key for vehicle %1",_vehicle];
	};
};

DZMSMessage = {
	local _type = _this select 0;
	local _title = _this select 1;
	local _message = _this select 2;
	local _color = "";
	
	call {
		if (DZMSAnnounceType == "Hint") exitWith {
			_color = if (_type == "Hero") then {"#0D00FF";} else {"#990000";}; // Blue and Red
			RemoteMessage = ["hintNoImage",[_title,_message],[_color,"1.75"]];
		};
		if (DZMSAnnounceType == "titleText") exitWith {
			RemoteMessage = ["titleText",_message];
		};
		if (DZMSAnnounceType == "rollingMessages") exitWith {
			RemoteMessage = ["rollingMessages",_message];
		};
		if (DZMSAnnounceType == "DynamicText") exitWith {
			_color = if (_type == "Hero") then {"#0D00FF";} else {"#990000";}; // Blue and Red
			_params = ["0.40","#FFFFFF","0.60",_color,0,-.35,10,0.5];
			RemoteMessage = ["dynamic_text", ["DZMS",_message],_params];
		};
	};
	publicVariable "RemoteMessage";
};

DZMSisClosest = {
	local _position	= _this;
	local _closest	= objNull;
	local _scandist	= DZMSAutoClaimAlertDistance;
	
	{
	local _dist = vehicle _x distance _position;
	if (isPlayer _x && _dist < _scandist) then {
		_closest = _x;
		_scandist = _dist;
	};
	} count playableUnits;
	
	_closest
};

DZMSAutoClaimAlert = {
	local _unit = _this select 0;
	local _mission = _this select 1;
	local _type = _this select 2;
	local _name = if (typeName _unit == "ARRAY") then {_unit select 1;} else {name _unit;};
	local _message = call {
		if (_type == "Start") exitWith {["STR_CL_AUTOCLAIM_ANNOUNCE",_mission,DZMSAutoClaimDelayTime];};
		if (_type == "Stop") exitWith {["STR_CL_AUTOCLAIM_NOCLAIM",_mission];};
		if (_type == "Return") exitWith {["STR_CL_AUTOCLAIM_RETURN",DZMSAutoClaimTimeout];};
		if (_type == "Reclaim") exitWith {"STR_CL_AUTOCLAIM_RECLAIM";};
		if (_type == "Claimed") exitWith {["STR_CL_AUTOCLAIM_CLAIM",_name,_mission];};
		if (_type == "Unclaim") exitWith {["STR_CL_AUTOCLAIM_ABANDON",_name,_mission];};
	};
	
	if (_type == "Claimed" || _type == "Unclaim") exitWith {
		RemoteMessage = ["IWAC",_message];
		publicVariable "RemoteMessage";
	};
	
	RemoteMessage = ["IWAC",_message];
	(owner _unit) publicVariableClient "RemoteMessage";
};

DZMSCheckReturningPlayer = {
	local _position 	= _this select 0;
	local _acArray	= _this select 1;
	local _playerUID	= _acArray select 0;
	local _returningPlayer = objNull;

	{
		if ((isPlayer _x) && (_x distance _position <= DZMSAutoClaimAlertDistance) && (getplayerUID _x == _playerUID)) then {
			_returningPlayer = _x;
		};
	} count playableUnits;
	
	_returningPlayer
};

DZMSAbortMission = {
	local _mission = _this select 0;
	local _aiType = _this select 1;
	local _markerIndex = _this select 2;
	local _posIndex = _this select 3;
	local _remove = [];
	
	{
		if (typeName _x == "ARRAY") then {
			_remove set [count _remove, (_x select 1)];
		};
	} count (DZE_ServerMarkerArray select _markerIndex);
	
	PVDZ_ServerMarkerSend = ["end",_remove];
	publicVariable "PVDZ_ServerMarkerSend";

	if (_aiType == "Hero") then {
		DZMSHeroEndTime = diag_tickTime;
		DZMSHeroRunning = DZMSHeroRunning - 1;
	} else {
		DZMSBanditEndTime = diag_tickTime;
		DZMSBanditRunning = DZMSBanditRunning - 1;
	};
	
	DZMSMissionData set [_mission, -1];
	DZE_ServerMarkerArray set [_markerIndex, -1];
	DZE_MissionPositions set [_posIndex, -1];
};

DZMSFreeze = {
	{
		if !(_x getVariable ["DoNotFreeze", false]) then {
			{
				if (alive _x) then {
					_x disableAI "TARGET";
					_x disableAI "MOVE";
					_x disableAI "FSM";
					_x setVehicleInit "this hideObject true";
				};
			} count units _x;
			processInitCommands;
			
			{
				clearVehicleInit _x;
			} count units _x;
			
			if (DZMSDebug) then {diag_log format ["DZMS: Freezing Units of Group: %1", _x];};
		};
	} count _this;
};

DZMSUnFreeze = {
	{
		if !(_x getVariable ["DoNotFreeze", false]) then {
			{
				if (alive _x) then {
					_x enableAI "TARGET";
					_x enableAI "MOVE";
					_x enableAI "FSM";
					_x setVehicleInit "this hideObject false";
				};
			} count units _x;
			processInitCommands;
				
			{
				clearVehicleInit _x;
			} count units _x;
			
			if (DZMSDebug) then {diag_log format ["DZMS: Unfreezing Units of Group: %1", _x];};
		};
	} count _this;
};

//------------------------------------------------------------------//
if (DZMSDebug) then {diag_log text format ["[DZMS]: Mission Functions Script Loaded!"];};
