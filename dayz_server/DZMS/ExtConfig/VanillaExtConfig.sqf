/*
	VanillaExtConfig.sqf
	This config file is loaded in DZMSInit.sqf if the Vanilla DayZ Mod is detected.
	It contains specific AI, Crate, and Vehicle configurations for DayZ Vanilla Mod.
*/

///////////////////////////////////////////////
// Arrays of skin classnames for the AI to use
DZMSBanditSkins = ["Bandit1_DZ","BanditW1_DZ","TK_GUE_Soldier_Sniper_EP1","TK_Soldier_Officer_EP1"];
DZMSHeroSkins = ["Survivor3_DZ","Survivor2_DZ","SurvivorW2_DZ","Soldier1_DZ","Camo1_DZ","UN_CDF_Soldier_EP1","CZ_Soldier_DES_EP1","UN_CDF_Soldier_Officer_EP1"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [
	["aimingAccuracy",0.10],
	["aimingShake",0.45],
	["aimingSpeed",0.45],
	["endurance",0.40],
	["spotDistance",0.30],
	["spotTime",0.30],
	["courage",0.40],
	["reloadSpeed",0.50],
	["commanding",0.40],
	["general",0.40]
];

DZMSSkills1 = [
	["aimingAccuracy",0.125],
	["aimingShake",0.60],
	["aimingSpeed",0.60],
	["endurance",0.55],
	["spotDistance",0.45],
	["spotTime",0.45],
	["courage",0.55],
	["reloadSpeed",0.60],
	["commanding",0.55],
	["general",0.55]
];

DZMSSkills2 = [
	["aimingAccuracy",0.15],
	["aimingShake",0.75],
	["aimingSpeed",0.70],
	["endurance",0.70],
	["spotDistance",0.60],
	["spotTime",0.60],
	["courage",0.70],
	["reloadSpeed",0.70],
	["commanding",0.70],
	["general",0.70]
];

DZMSSkills3 = [	
	["aimingAccuracy",0.20],
	["aimingShake",0.85],
	["aimingSpeed",0.80],
	["endurance",0.80],
	["spotDistance",0.70],
	["spotTime",0.70],
	["courage",0.80],
	["reloadSpeed",0.80],
	["commanding",0.80],
	["general",0.80]
];

// Set the bloodbag type
local _bloodbag = ["bloodBagONEG","ItemBloodbag"] select dayz_classicBloodBagSystem;

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
DZMSGear0 = [
	["ItemBandage","ItemBandage","ItemAntibiotic","ItemPainkiller","ItemSodaGrapeDrink","FoodBaconCooked"],
	["ItemKnife","ItemFlashlight"]
];

DZMSGear1 = [
	["ItemBandage","ItemBandage","ItemPainkiller","ItemMorphine","ItemSodaRocketFuel","FoodGoatCooked"],
	["ItemToolbox","ItemEtool"]
];

DZMSGear2 = [
	["ItemBandage","ItemAntibacterialWipe",_bloodbag,"ItemPainkiller","ItemSodaSacrite","FishCookedTrout"],
	["ItemMatchbox","ItemHatchet"]
];

DZMSGear3 = [
	["ItemBandage","ItemBandage","ItemMorphine","ItemHeatPack","ItemSodaRabbit","FoodMRE"],
	["ItemCrowbar","ItemMachete"]
];

DZMSGear4 = [
	["ItemBandage","ItemAntibacterialWipe","ItemEpinephrine",_bloodbag,"ItemSodaMtngreen","FoodRabbitCooked"],
	["ItemGPS","Binocular_Vector"]
];

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.

//Armed Choppers
DZMSChoppers = ["UH1H_DZ","Mi17_DZ","UH1H_2_DZ"];

//Small Vehicles
DZMSSmallVic = ["hilux1_civil_3_open_EP1","SUV_TK_CIV_EP1","HMMWV_DZ","UAZ_Unarmed_UN_EP1","BAF_Offroad_D"];

//Large Vehicles
DZMSLargeVic = ["Ural_TK_CIV_EP1","Ural_INS","V3S_Civ"];

////////////////////////////////////////////////////////////////
// Weapons Arrays -  These can be adjusted as desired or make your own custom arrays
DZMSPistol = ["M9_DZ","M9_SD_DZ","G17_DZ","G17_SD_DZ","Makarov_DZ","Makarov_SD_DZ","Revolver_DZ","M1911_DZ","PDW_DZ"];
DZMSAssault = ["M16A2_DZ","M4A1_DZ","M4A1_SD_DZ","SA58_RIS_DZ","L85A2_DZ","L85A2_SD_DZ","AKM_DZ","G36C_DZ","G36C_SD_DZ","G36A_Camo_DZ","G36K_Camo_DZ","G36K_Camo_SD_DZ"];
DZMSLMG = ["L110A1_DZ","M249_DZ","M240_DZ","Mk48_DZ","RPK_DZ","UK59_DZ","PKM_DZ"];
DZMSSMG = ["Bizon_DZ","Bizon_SD_DZ","MP5_DZ","MP5_SD_DZ"];
DZMSSniper = ["Mosin_PU_DZ","M4SPR","M14_DZ","M24_DZ","M24_des_EP1","M40A3_DZ","SVD_DZ","SVD_des_EP1","FNFAL_DZ","DMR_DZ","L115A3_DZ","L115A3_2_DZ"];
DZMSSingleShot = ["Remington870_DZ","M1014_DZ","Winchester1866_DZ","LeeEnfield_DZ","CZ550_DZ"];

// Weapon arrays that can spawn on the AI. Because I want mostly assault rifles, I add them to the array multiple times to increase the frequency
DZMSAIWeps = [DZMSAssault,DZMSAssault,DZMSAssault,DZMSAssault,DZMSSMG,DZMSSingleShot,DZMSLMG,DZMSSniper];

// Weapon arrays that can spawn in the crates. Pistols spawn separately
DZMSCrateWeps = [DZMSAssault,DZMSAssault,DZMSAssault,DZMSLMG,DZMSSniper];

// Items and tools that can be added to crates
DZMSGeneralStore = ["ItemSandbag","equip_string","equip_duct_tape","equip_rope","equip_herb_box","equip_pvc_box","equip_lever","equip_rag","ItemJerrycan","PartWoodPile","ItemTent","ItemDomeTent","ItemWaterBottleSafe","ItemSodaCoke","ItemSodaPepsi","ItemSodaMdew","ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste","ItemSodaFranka","ItemSodaLemonade","ItemSodaLirik","ItemSodaLvg","ItemSodaMzly","ItemSodaPeppsy","ItemSodaRabbit","ItemSodaSacrite","ItemSodaRocketFuel","ItemSodaGrapeDrink","ItemSherbet","FoodPistachio","FoodNutmix","FoodChipsSulahoops","FoodChipsMysticales","FoodChipsChocolate","FoodCandyChubby","FoodCandyAnders","FoodCandyLegacys","FoodCandyMintception","FoodCakeCremeCakeClean","FoodCanBeef","FoodCanPotatoes","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanDerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers","FoodCanUnlabeled","FoodCanBakedBeans","FoodCanSardines","FoodCanFrankBeans","FoodCanPasta","FoodCanRusUnlabeled","FoodCanRusStew","FoodCanRusPork","FoodCanRusPeas","FoodCanRusMilk","FoodCanRusCorn"];
DZMSCrateTools = ["ItemToolbox","ItemFishingPole","ItemGPS","ItemMap","ItemMachete","ItemKnife","ItemFlashlight","ItemMatchbox","ItemHatchet","Binocular_Vector"];
DZMSMeds = [_bloodbag,"ItemBandage","ItemAntibiotic","ItemPainkiller","ItemMorphine","ItemAntibacterialWipe","ItemEpinephrine","FoodMRE","ItemWaterBottleSafe"];
DZMSPacks = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Pouch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];
DZMSGrenades = ["HandGrenade_west","FlareGreen_M203","FlareWhite_M203"];
DZMSBuildSupply = [[2,"equip_1inch_metal_pipe"],[2,"equip_2inch_metal_pipe"],[2,"equip_metal_sheet"],[2,"equip_metal_sheet_rusted"],[5,"ItemStone"],[3,"ItemPlank"],[4,"ItemLog"],[1,"ItemCamonet"]]; // [Number to add to crate,Item]
DZMSCraftingSupply = ["ItemScrews","ItemPadlock","ItemRSJ","ItemConcreteBlock","equip_nails","equip_rag","equip_rope","equip_duct_tape","equip_string","equip_comfreyleafs","equip_herb_box"];
DZMSBuildTools = ["ItemCrowbar","ItemEtool","ItemToolbox","ItemSledgeHammer","ItemShovel","ItemPickaxe","ItemDIY_wood","ItemDIY_Gate"];
DZMSVehAmmo = ["100Rnd_762x51_M240","100Rnd_762x54_PK","150Rnd_127x107_DSHKM"]; // Not sure if can use 150Rnd_127x107_DSHKM
DZMSVehParts = ["PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel","ItemFuelcan","ItemJerrycan"];
