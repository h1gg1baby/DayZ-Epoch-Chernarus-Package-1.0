#include "\z\addons\dayz_server\compile\server_toggle_debug.hpp"

private ["_type","_objectUID","_characterID","_object","_worldspace","_key","_ownerArray","_inventory","_clientKey","_exitReason","_player","_playerUID"];

if (count _this < 6) exitWith {diag_log "Server_PublishObj error: Wrong parameter format";};

_characterID =		_this select 0;
_object = 		_this select 1;
_worldspace = 	_this select 2;
_inventory = 		_this select 3;
_player = _this select 4;
_clientKey = _this select 5;
_type = typeOf _object;
_playerUID = getPlayerUID _player;

_exitReason = [_this,"PublishObj",(_worldspace select 1),_clientKey,_playerUID,_player] call server_verifySender;
if (_exitReason != "") exitWith {diag_log _exitReason};

if ([_object, "Server"] call check_publishobject) then {
	//diag_log ("PUBLISH: Attempt " + str(_object));

	_objectUID = _worldspace call dayz_objectUID2;
	_object setVariable [ "ObjectUID", _objectUID, true ];
	// we can't use getVariable because only the object creation is known from the server (position,direction,variables are not sync'ed yet)
	//_characterID = _object getVariable [ "characterID", 0 ];
	//_ownerArray = _object getVariable [ "ownerArray", [] ];
	//_key = str formatText["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:", dayZ_instance, _type, 0, _characterID, _worldspace, _inventory, [], 0,_objectUID];
	_key = str formatText["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _type, 0, _characterID, _worldspace call AN_fnc_formatWorldspace, _inventory, [], 0,_objectUID]; // Precise Base Building 1.0.5

	_key call server_hiveWrite;

	if !(_object isKindOf "TrapItems") then {
		if (DZE_GodModeBase && {!(_type in DZE_GodModeBaseExclude)}) then {
			_object addEventHandler ["HandleDamage", {0}];
		} else {
			_object addMPEventHandler ["MPKilled",{if !(isServer) exitWith {};_this call vehicle_handleServerKilled;}];
		};
	};
	
	// Test disabling simulation server side on buildables only.
	_object enableSimulation false;

	dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];

	#ifdef OBJECT_DEBUG
	diag_log format["PUBLISH: Player %1(%2) created %3 with UID:%4 CID:%5 @%6 inventory:%7",(_player call fa_plr2str),_playerUID,_type,_objectUID,_characterID,((_worldspace select 1) call fa_coor2str),_inventory];
	#endif
}
else {
	#ifdef OBJECT_DEBUG
	diag_log ("PUBLISH: *NOT* created " + (_type ) + " (not allowed)");
	#endif
};
