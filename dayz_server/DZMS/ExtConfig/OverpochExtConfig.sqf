/*
	OverpochExtConfig.sqf
	This config file is loaded in DZMSInit.sqf if both Epoch and Overwatch mods are detected.
	It contains specific AI, Crate, and Vehicle configurations for DayZ Overpoch.
*/

// Generates keys for mission vehicles and places it in the gear. Only works if DZMSSaveVehicles is set to true and Epoch is detected.
DZMSMakeVehKey = true;

//If you have ZSC installed then you can set this to true to place money in ai wallets.
DZMSAICheckWallet = false;

// Do you want AI to use RPG7V's?
// Odd numbered AI will spawn with one if enabled.
DZMSUseRPG = false;

// Do you want static M2 heavy machine gunners at the missions? (Some of the easier missions don't have them).
DZMSM2Static = false;

///////////////////////////////////////////////
// Arrays of skin classnames for the AI to use
DZMSBanditSkins = ["Bandit1_DZ","BanditW1_DZ","TK_INS_Warlord_EP1_DZ","GUE_Commander_DZ"];
DZMSHeroSkins = ["Survivor3_DZ","Survivor2_DZ","SurvivorW2_DZ","Soldier1_DZ","Camo1_DZ","UN_CDF_Soldier_EP1"];

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
	["ItemBandage","ItemSepsisBandage","ItemAntibiotic6","ItemPainkiller6","ItemSodaGrapeDrink","FoodBaconCooked"],
	["ItemKnife","ItemFlashlight"]
];

DZMSGear1 = [
	["ItemBandage","ItemSepsisBandage","ItemPainkiller6","ItemMorphine","ItemSodaRocketFuel","FoodGoatCooked"],
	["ItemToolbox","ItemEtool"]
];

DZMSGear2 = [
	["ItemBandage","ItemAntibacterialWipe",_bloodbag,"ItemPainkiller6","ItemSodaSacrite","FishCookedTrout"],
	["ItemMatchbox","ItemHatchet"]
];

DZMSGear3 = [
	["ItemBandage","ItemSepsisBandage","ItemMorphine","ItemHeatPack","ItemSodaRabbit","FoodMRE"],
	["ItemCrowbar","ItemMachete"]
];

DZMSGear4 = [
	["ItemBandage","ItemAntibacterialWipe","ItemEpinephrine",_bloodbag,"ItemSodaMtngreen","FoodRabbitCooked"],
	["ItemGPS","Binocular_Vector"]
];

// New to DayZ Epoch 1.0.7. Dog tags can be traded at hero and bandit vendors for +/- humanity.
DZMS_HeroDogTag = .15; // Chance for a dog tag on hero NPC: Between 0 and 1.
DZMS_BanditDogTag = .15; // Chance for a dog tag on bandit NPC: Between 0 and 1.

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.

//Armed Choppers
DZMSChoppers = ["BAF_Merlin_DZE","UH60M_MEV_EP1_DZ","CH_47F_EP1_DZE","UH1H_DZE","Mi17_DZE","UH60M_EP1_DZE","UH1Y_DZE","MH60S_DZE","UH1H_CDF_DZE","UH1H_WD_DZE","UH1H_2_DZE","UH1H_DES_DZE","UH1H_GREY_DZE","UH1H_BLACK_DZE","UH1H_SAR_DZE","Mi17_DZE","Mi17_TK_EP1_DZE","Mi17_UN_CDF_EP1_DZE","Mi17_CDF_DZE","Mi17_DES_DZE","Mi17_GREEN_DZE","Mi17_BLUE_DZE","Mi17_BLACK_DZE","Mi171Sh_CZ_EP1_DZE","MH60S_DZE","Ka60_GL_PMC_DZE","AW159_Lynx_BAF_DZE","UH60M_EP1_DZE","UH1Y_DZE","CH_47F_EP1_DZE","CH_47F_EP1_Black_DZE","CH_47F_EP1_GREY_DZE","CH_47F_EP1_DES_DZE","pook_transport_DZE","pook_transport_CDF_DZE","pook_gunship_DZE","pook_gunship_CDF_DZE"];

//Small Vehicles
DZMSSmallVic = ["hilux1_civil_3_open_DZE","SUV_TK_CIV_EP1_DZE","HMMWV_DZ","UAZ_Unarmed_UN_EP1_DZE","HMMWV_Ambulance_CZ_DES_EP1_DZE","LandRover_TK_CIV_EP1_DZE","SUV_Camo","Nissan_Orange_DZE","BTR40_TK_INS_EP1_DZE","Jeep_DZE","ScrapAPC_DZE","Tractor_Armored_DZE"];

//Large Vehicles
DZMSLargeVic = ["Kamaz_DZE","MTVR_DES_EP1_DZE","Ural_INS_DZE","Ural_CDF_DZE","Ural_TK_CIV_EP1_DZE","Ural_UN_EP1_DZE","V3S_Open_TK_CIV_EP1_DZE","V3S_Open_TK_EP1_DZE","T810A_ACR_DZE","T810A_ACR_DES_DZE","T810A_ACR_OPEN_DZE","T810A_ACR_DES_OPEN_DZE","MTVR_Open_DZE","MTVR_DZE"];

////////////////////////////////////////////////////////////////
// Weapons that can be added to AI or crates
DZMSPistol = ["RH_m9","RH_m9c","RH_m93r","RH_M9sd","RH_m9csd","RH_browninghp","vil_B_HP","RH_anac","RH_anacg","RH_python","RH_deagle","RH_Deagleg","RH_Deaglem","RH_Deaglemzb","RH_Deaglemz","RH_Deagles","vil_Glock","RH_g17","vil_Glock_o","RH_g17sd","RH_g18","RH_g19","RH_g19t","RH_tec9","RH_m1911","RH_m1911sd","RH_m1911old","RH_mk22","RH_mk22sd","RH_mk22v","RH_mk22vsd","RH_p38","RH_ppk","RH_mk2","RH_p226","RH_p226s","RH_bull","RH_tt33","RH_usp","RH_uspm","RH_uspsd","vil_USP45","vil_USP45SD","vil_USP","vil_USPSD","RH_vz61"];
DZMSAK = ["vil_AEK2","vil_AEK_GL","vil_AeK_3","vil_AeK_23","vil_AeK_3_K","vil_AK_105","Vil_AK_105_c","vil_AK_101","vil_AK_103","vil_AK_107","Vil_AK_107_c","vil_ak12","vil_ak12_ap","vil_ak12_gp","vil_AK_47","vil_AK_47_49","vil_AK_47_m1","vil_AK_47","vil_AK_74_N","vil_AK_74P","vil_AK_74m","vil_AK_74m_p29","vil_AK_74m_EOT_Alfa","vil_AK_74m_gp_29","vil_AK_74m_gp","vil_AK_74m_EOT","vil_AK_74m_EOT_FSB","vil_AK_74m_EOT_FSB_60","vil_AK_74m_EOT_FSB_45","vil_AK_74m_c","vil_AK_74m_k","vil_AK_74m_PSO","vil_AKM","vil_AKM_GL","vil_AKMS","vil_AKMS_GP25","vil_AKMSB","vil_AKS_47","vil_AKS_74","vil_AKS_74_gp","vil_AKS_74p_gp","vil_AKS_74p","vil_AKS_74p_45","vil_AKs_74_u","vil_AKs_74_u45","Vil_AKS_74_UB","Vil_AKS_74_UN_kobra","vil_AMD63","vil_AMD","vil_Abakan","vil_Abakan_P29","vil_Abakan_gp","vil_AK_nato_m1","vil_ASH82","vil_MPi","vil_PMI74S","vil_PMI","vil_PMIS","vil_type88_1","vil_M64","vil_M70","vil_M70B","vil_AK_nato_m80"];
DZMSSpare = ["vil_Galil","vil_Galil_arm","vil_SKS","gms_k98","gms_k98_knife","gms_k98_rg","gms_k98zf39"];
DZMSACRSD = ["FHQ_ACR_BLK_CCO_GL_SD","FHQ_ACR_TAN_CCO_GL_SD","FHQ_ACR_SNW_CCO_GL_SD","FHQ_ACR_WDL_CCO_GL_SD","FHQ_ACR_BLK_CCO_SD","FHQ_ACR_TAN_CCO_SD","FHQ_ACR_SNW_CCO_SD","FHQ_ACR_WDL_CCO_SD","FHQ_ACR_BLK_G33_GL_SD","FHQ_ACR_TAN_G33_GL_SD","FHQ_ACR_SNW_G33_GL_SD","FHQ_ACR_WDL_G33_GL_SD","FHQ_ACR_BLK_G33_SD","FHQ_ACR_TAN_G33_SD","FHQ_ACR_SNW_G33_SD","FHQ_ACR_WDL_G33_SD","FHQ_ACR_BLK_HAMR_GL_SD","FHQ_ACR_TAN_HAMR_GL_SD","FHQ_ACR_SNW_HAMR_GL_SD","FHQ_ACR_WDL_HAMR_GL_SD","FHQ_ACR_BLK_HAMR_SD","FHQ_ACR_TAN_HAMR_SD","FHQ_ACR_SNW_HAMR_SD","FHQ_ACR_WDL_HAMR_SD","FHQ_ACR_BLK_HWS_GL_SD","FHQ_ACR_TAN_HWS_GL_SD","FHQ_ACR_SNW_HWS_GL_SD","FHQ_ACR_WDL_HWS_GL_SD","FHQ_ACR_BLK_HWS_SD","FHQ_ACR_TAN_HWS_SD","FHQ_ACR_SNW_HWS_SD","FHQ_ACR_WDL_HWS_SD","FHQ_ACR_BLK_IRN_GL_SD","FHQ_ACR_TAN_IRN_GL_SD","FHQ_ACR_SNW_IRN_GL_SD","FHQ_ACR_WDL_IRN_GL_SD","FHQ_ACR_BLK_RCO_GL_SD","FHQ_ACR_TAN_RCO_GL_SD","FHQ_ACR_SNW_RCO_GL_SD","FHQ_ACR_WDL_RCO_GL_SD","FHQ_ACR_BLK_RCO_SD","FHQ_ACR_TAN_RCO_SD","FHQ_ACR_SNW_RCO_SD","FHQ_ACR_WDL_RCO_SD","FHQ_ACR_BLK_IRN_SD","FHQ_ACR_TAN_IRN_SD","FHQ_ACR_SNW_IRN_SD","FHQ_ACR_WDL_IRN_SD"];
DZMSACR = ["FHQ_ACR_BLK_IRN","FHQ_ACR_TAN_IRN","FHQ_ACR_SNW_IRN","FHQ_ACR_WDL_IRN","FHQ_ACR_BLK_CCO","FHQ_ACR_TAN_CCO","FHQ_ACR_SNW_CCO","FHQ_ACR_WDL_CCO","FHQ_ACR_BLK_CCO_GL","FHQ_ACR_TAN_CCO_GL","FHQ_ACR_SNW_CCO_GL","FHQ_ACR_WDL_CCO_GL","FHQ_ACR_BLK_G33","FHQ_ACR_TAN_G33","FHQ_ACR_SNW_G33","FHQ_ACR_WDL_G33","FHQ_ACR_BLK_G33_GL","FHQ_ACR_TAN_G33_GL","FHQ_ACR_SNW_G33_GL","FHQ_ACR_WDL_G33_GL","FHQ_ACR_BLK_HAMR","FHQ_ACR_TAN_HAMR","FHQ_ACR_SNW_HAMR","FHQ_ACR_WDL_HAMR","FHQ_ACR_BLK_HAMR_GL","FHQ_ACR_TAN_HAMR_GL","FHQ_ACR_SNW_HAMR_GL","FHQ_ACR_WDL_HAMR_GL","FHQ_ACR_BLK_HWS","FHQ_ACR_TAN_HWS","FHQ_ACR_SNW_HWS","FHQ_ACR_WDL_HWS","FHQ_ACR_BLK_HWS_GL","FHQ_ACR_TAN_HWS_GL","FHQ_ACR_SNW_HWS_GL","FHQ_ACR_WDL_HWS_GL","FHQ_ACR_BLK_IRN_GL","FHQ_ACR_TAN_IRN_GL","FHQ_ACR_SNW_IRN_GL","FHQ_ACR_WDL_IRN_GL","FHQ_ACR_BLK_RCO","FHQ_ACR_TAN_RCO","FHQ_ACR_SNW_RCO","FHQ_ACR_WDL_RCO","FHQ_ACR_BLK_RCO_GL","FHQ_ACR_TAN_RCO_GL","FHQ_ACR_SNW_RCO_GL","FHQ_ACR_WDL_RCO_GL"];
DZMSSCAR = ["SCAR_L_CQC_CCO_SD","SCAR_L_CQC","SCAR_L_CQC_Holo","SCAR_L_CQC_EGLM_Holo","SCAR_L_STD_EGLM_RCO","SCAR_L_STD_HOLO","SCAR_L_STD_Mk4CQT","SCAR_H_CQC_CCO","SCAR_H_CQC_CCO_SD","SCAR_H_STD_EGLM_Spect","SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper_SD"];
DZMSSMG = ["vil_9a91","vil_9a91_c","vil_9a91_csd","vil_VAL","vil_VAL_C","vil_Groza_HG","vil_Groza_GL","vil_Groza_SC","vil_Groza_SD","vil_Vikhr","vil_vsk94","vil_MP5_EOTech","vil_MP5SD_EOTech","vil_uzimini","vil_uzimini_SD","vil_uzi","vil_uzi_c","vil_uzi_SD"];
DZMSSniper = ["USSR_cheytacM200","USSR_cheytacM200_sd","vil_SVD_63","vil_SVD_N","vil_SVD_M","vil_SVD_P21","vil_SVD_S","FHQ_MSR_DESERT","FHQ_MSR_NV_DESERT","FHQ_MSR_NV_SD_DESERT","FHQ_MSR_SD_DESERT","FHQ_RSASS_TAN","FHQ_RSASS_SD_TAN","vil_SV_98_69","vil_SV_98","vil_SV_98_SD","vil_SVDK","FHQ_XM2010_DESERT","FHQ_XM2010_NV_DESERT","FHQ_XM2010_NV_SD_DESERT","FHQ_XM2010_SD_DESERT"];
DZMSTavor = ["RH_ctar21","RH_ctar21glacog","RH_ctar21m","RH_ctar21mgl","RH_star21"];
DZMSG3 = ["vil_AG3","vil_G3a2","vil_G3a3","vil_G3an","vil_G3anb","vil_G3SG1","vil_G3sg1b","vil_G3TGS","vil_G3TGSb","vil_G3ZF","vil_G3zfb","vil_G3a4","vil_G3a4b"];
DZMSMasada = ["RH_masacog","RH_masaim","RH_masbaim","RH_masb","RH_masbeotech","RH_mas","RH_massd","RH_massdacog","RH_masbsdacog","RH_massdaim","RH_masbsdaim","RH_masbsd","RH_massdeotech","RH_masbsdeotech"];
DZMSLMG = ["vil_RPK75_Romania","vil_M240_B","vil_M249_Para","skavil_M60","skavil_M60e3","vil_Mg3","vil_MG4","vil_MG4E","vil_PKP","vil_PKP_EOT","vil_PK","vil_PKM","vil_RPD","vil_RPK","vil_RPK75","vil_RPK74","vil_RPK74M","vil_RPK74M_P29","vil_RPK75_M72","vil_zastava_m84"];
DZMSHk417 = ["RH_hk417","RH_hk417acog","RH_hk417aim","RH_hk417s","RH_hk417sacog","RH_hk417saim","RH_hk417seotech","RH_hk417eotech","RH_hk417sd","RH_hk417sdacog","RH_hk417sdaim","RH_hk417sdeotech","RH_hk417sdsp","RH_hk417sp","RH_hk417sglacog","RH_hk417sgl","RH_hk417sglaim","RH_hk417sgleotech"];
DZMSHk416 = ["RH_hk416","RH_hk416glacog","RH_hk416gl","RH_hk416aim","RH_hk416glaim","RH_hk416s","RH_hk416sacog","RH_hk416sglacog","RH_hk416saim","RH_hk416sglaim","RH_hk416seotech","RH_hk416sgleotech","RH_hk416sgl","RH_hk416eotech","RH_hk416gleotech","RH_hk416sd","RH_hk416sdgl","RH_hk416sdglaim","RH_hk416sdeotech","RH_hk416sdgleotech"];
DZMSG36 = ["vil_AG36KA4","vil_AG36KV","vil_G36KSKdes","vil_G36KA4","vil_G36KSKES","vil_G36KSKdesES","vil_G36KES","vil_G36KVZ","vil_G36KSK","vil_G36VA4Eot","vil_G36KV3","vil_G36KVA4","vil_G36KV3Des","vil_G36VA4","vil_AG36","vil_G36a2","vil_AG36A2","vil_G36CC","vil_G36E"];
DZMSHkDMR = ["vil_HK417s","vil_M110","vil_M110sd","RH_m14","vil_M14G","RH_m14acog","RH_m14aim","RH_m14eot","RH_m1s","RH_m1sacog","RH_m1saim","RH_m1seot","RH_m1sshd","RH_m1ssp","RH_m1st","RH_m1stacog","RH_m1staim","RH_m1steot","RH_m1stshd","RH_m1stsp","RH_m21","vil_M21G","RH_sc2","RH_sc2acog","RH_sc2aim","RH_sc2eot","RH_sc2shd","RH_sc2sp","vil_SR25","vil_SR25SD"];

// Weapon arrays that can spawn on the AI
DZMSAIWeps = [DZMSAK,DZMSSpare,DZMSACRSD,DZMSACR,DZMSSCAR,DZMSSMG,DZMSSniper,DZMSTavor,DZMSG3,DZMSMasada,DZMSLMG,DZMSHk417,DZMSHk416,DZMSG36,DZMSHkDMR];

// Weapon arrays that can spawn in the crates - Pistols spawn separately
DZMSCrateWeps = [DZMSAK,DZMSSpare,DZMSACRSD,DZMSACR,DZMSSCAR,DZMSSMG,DZMSSniper,DZMSTavor,DZMSG3,DZMSMasada,DZMSLMG,DZMSHk417,DZMSHk416,DZMSG36,DZMSHkDMR];

// Items and tools that can be added to crates
DZMSGeneralStore = ["ItemTent","ItemTentWinter","forest_net_kit","ItemMixOil","ItemWaterBottleSafe","ItemSodaCoke","ItemSodaPepsi","ItemSodaMdew","ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste","ItemSodaFranka","ItemSodaLemonade","ItemSodaLirik","ItemSodaLvg","ItemSodaMzly","ItemSodaPeppsy","ItemSodaRabbit","ItemSodaSacrite","ItemSodaRocketFuel","ItemSodaGrapeDrink","ItemSherbet","FoodPistachio","FoodNutmix","FoodChipsSulahoops","FoodChipsMysticales","FoodChipsChocolate","FoodCandyChubby","FoodCandyAnders","FoodCandyLegacys","FoodCandyMintception","FoodCakeCremeCakeClean","FoodCanBeef","FoodCanPotatoes","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanDerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers","FoodCanUnlabeled","FoodCanBakedBeans","FoodCanSardines","FoodCanFrankBeans","FoodCanPasta","FoodCanRusUnlabeled","FoodCanRusStew","FoodCanRusPork","FoodCanRusPeas","FoodCanRusMilk","FoodCanRusCorn","ItemJerrycan"];
DZMSCrateTools = ["ItemToolbox","ItemFishingPole","ItemGPS","ItemMap","ItemMachete","ItemKnife","ItemFlashlight","ItemMatchbox","ItemHatchet","Binocular_Vector","ItemKeyKit","Binocular","ItemCompass","NVGoggles_DZE","ItemRadio"];
DZMSMeds = [_bloodbag,"ItemBandage","ItemAntibiotic6","ItemPainkiller6","ItemMorphine","ItemAntibacterialWipe","ItemEpinephrine","ItemSepsisBandage","equip_woodensplint","FoodMRE","ItemWaterBottleSafe"];
DZMSPacks = ["Patrol_Pack_DZE1","Assault_Pack_DZE1","Czech_Vest_Pouch_DZE1","TerminalPack_DZE1","TinyPack_DZE1","ALICE_Pack_DZE1","TK_Assault_Pack_DZE1","CompactPack_DZE1","British_ACU_DZE1","GunBag_DZE1","NightPack_DZE1","SurvivorPack_DZE1","AirwavesPack_DZE1","CzechBackpack_DZE1","WandererBackpack_DZE1","LegendBackpack_DZE1","CoyoteBackpack_DZE1","LargeGunBag_DZE1"];
DZMSGrenades = ["HandGrenade_west","FlareGreen_M203","FlareWhite_M203"];
DZMSBuildSupply = [[3,"CinderBlocks"],[1,"MortarBucket"],[3,"ItemPole"],[3,"PartPlywoodPack"],[3,"PartPlankPack"],[3,"ItemSandbag"],[3,"ItemWire"],[1,"ItemFireBarrel_kit"],[1,"forest_large_net_kit"],[1,"ItemComboLock"],[3,"ItemTankTrap"],[1,"ItemRSJ"]]; // [Number to add to crate,Item]
DZMSCraftingSupply = ["equip_tent_poles","equip_nails","ItemScrews","equip_scrapelectronics","equip_floppywire","equip_metal_sheet","equip_1inch_metal_pipe","equip_2inch_metal_pipe","equip_rope","ItemLightBulb","ItemCorrugated","ItemMetalSheet"];
DZMSBuildTools = ["ItemCrowbar","ItemEtool","ItemToolbox","ItemSledgeHammer","ChainSaw","Hammer_DZE","ItemSledge","Handsaw_DZE","ItemSolder_DZE"];
DZMSVehAmmo = ["100Rnd_762x51_M240","1500Rnd_762x54_PKT","2000Rnd_762x51_M134","100Rnd_762x54_PK","100Rnd_127x99_M2","150Rnd_127x107_DSHKM"];
DZMSVehParts = ["PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel","ItemFuelcan","ItemJerrycan","ItemFuelBarrel"];
DZMSHighValue = ["ItemTallSafe","ItemVault","ItemVault2","ItemLockbox","ItemLockbox2","ItemLockboxWinter","ItemLockboxWinter2","plot_pole_kit"];
