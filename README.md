# Epoch-Chernarus-Package - Version 1.0

## Epoch-Version 1.0.7.1 Map: Chernarus

- Without BattlEye filter. Edit BattlEye? No way!
- My Server are only with Whitelist or Password. :-)

Have FUN!

## Used mods:

Epoch-Antihack-Admin-Tools - Compatible with DayZ Epoch 1.0.7 + | [GitHub repo](https://github.com/BigEgg17/Epoch-Antihack-Admin-Tools)

DZAI 2.2.5 - AI Addon for DayZ Epoch 1.0.7+ | [GitHub repo](https://github.com/oiad/DZAI)

DZMS 2.1 - AI Addon for DayZ Epoch 1.0.7+ | [GitHub repo](https://github.com/worldwidesorrow/DZMS-DayZMissionSystem)

WICKED AI 2.2.7 | [GitHub repo](https://github.com/f3cuk/WICKED-AI)

ESSV3 | [GitHub repo](https://github.com/AirwavesMan/ESSV3)

## Install:

1. Copy the DayZ_Epoch_11.Chernarus folder (or *.pbo / use "PBO tool" for packing) to your Arma2 OA\MPMissions folder

	1.1 Enabling or disableing your own settings: dayz_code\configVariables.sqf

2. Copy the dayz_server.pbo folder to your Arma 2 OA@dayz_epoch_server\addons folder (use "PBO tool" for packing)


## Epoch-Antihack-Admin-Tools

1. Copy the files from "AdminTool_dll_ini.7z" to your Serverroot

2. Edit the config.sqf in your Server.pbo in "\dayz_server\antihack\"

## ESSV3

1. Edit the config.sqf in your Mission.pbo in "\DayZ_Epoch_11.Chernarus\spawn\"

## You use ESSV3 & InfiStar?

You have a Problem at spawning with HALO? Clients spawn left down the map into water?

Then use the following fix. Credits to Cherdenko for fixing that bug | [klick me!](https://epochmod.com/forum/topic/43012-release-essv3-enhanced-spawn-selection-updated-for-107/?do=findComment&comment=288727)

Look at your AH.sqf in your dayz_server.pbo (infiSTAR folder). Open that file and search for:

```
					_driver = driver _curVeh;
						_aidriver = false;
						if(!isNull _driver)then
						{
							if(!isPlayer _driver)then
							{
								_aidriver = true;
								
								player setVectorUp [0,0,1];
								player setVelocity [0,0,0];
								player setPosATL _lastPos;
							};
						};
						if(_aidriver)exitWith{hint 'Bad boys, bad boys whatcha gonna do? Whatcha gonna do when they come for you?';systemchat 'AI Drivers not allowed!';}; 
```

Delete it!

## Extra/optional: 

Serverstart with "Steamlink":

```
steam://run/33930//-connect=99.999.999.99%20-port=2302%20-mod=EXPANSION;@DayZ_Epoch;%20-nosplash%20-world=empty%20-nopause
```

with password usage:

```
steam://run/33930//-connect=99.999.999.99%20-port=2302%20-PASSWORD=password%20-mod=EXPANSION;@DayZ_Epoch;%20-nosplash%20-world=empty%20-nopause
```

## Contact

epoch{at}posteo.de | No support for used mods! Send your Server-IP. I will visit you! ;-)

## Licences

Note the respective licenses of the files from the other GitHub Repositories. Thx to at all publishers and [EpochModTeam](https://github.com/EpochModTeam/DayZ-Epoch)