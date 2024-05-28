local app = select(2,...);

local expansionID = 5;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Stormwind and Orgrimmar Cosmetic Sets
{"Stormwind","","Guard Cosmetic (WoD)",0,60001,{65967,65968,65969,66538,65970,65971,65972,65973,},"Alliance"},
{"Orgrimmar","","Guard Cosmetic (WoD)",0,60001,{66531,66532,66533,66534,66535,66536,66537,},"Horde"},

--Garrison Plate
{"Heart-Lesion","","Garrison Salvage",32,60001,{67332,67333,67334,67335,67336,67337,67338,67339,}},
{"Sunsoul","","Garrison Salvage",2,60001,{67425,67426,67427,67428,67429,67430,67431,67432,}},
{"Oathsworn","","Garrison Salvage",1,60001,{67534,67535,67536,67537,67538,67539,67540,67541,}},
--Garrison Mail
{"Trailseeker","","Garrison Salvage",4,60001,{67383,67384,67385,67386,67387,67389,67390,}},
{"Streamtalker","","Garrison Salvage",64,60001,{67492,67493,67494,67495,67496,67498,67499,67500,}},
--Garrison Leather
{"Mistdancer","","Garrison Salvage",512,60001,{67405,67406,67408,67409,67411,67412,}},
{"Springrain","","Garrison Salvage",1024,60001,{67353,67354,67355,67356,67357,67358,67360,67361,}},
{"Lightdrinker","","Garrison Salvage",8,60001,{67479,67480,67481,65876,67483,65878,65879,65880,}},
--Garrison Cloth
{"Communal","","Garrison Salvage",16,60001,{67459,67460,67461,67462,67463,67464,67465,67466,}},
{"Felsoul","","Garrison Salvage",256,60001,{67522,67523,67524,67525,67526,67527,67528,67529,}},
{"Mountainsage","","Garrison Salvage",128,60001,{67393,67394,67395,67396,67397,67398,67399,67400,}},

--Crafted Plate
{"Truesteel","","Crafted (WoD)",35,60001,{62930,62931,62932,62936,62937,62933,62934,62935,}},
{"Truesteel","","Crafted (WoD)",35,60001,{65292,65291,65290,65286,65284,65289,65288,65287,}},
{"Truesteel","","Crafted (WoD)",35,60001,{65299,65298,65297,65293,65285,65296,65295,65294,}},
--Crafted Mail
{"Wayfaring","","Crafted (WoD)",68,60001,{65018,65015,65027,65030,65024,65036,65021,65033,}},
{"Wayfaring","","Crafted (WoD)",68,60001,{65019,65016,65028,65031,65025,65037,65022,65034,}},
{"Wayfaring","","Crafted (WoD)",68,60001,{65020,65017,65029,65032,65026,65038,65023,65035,}},
--Crafted Leather
{"Supple","","Crafted (WoD)",3592,60001,{64992,64989,65001,65004,64998,65010,64995,65007,}},
{"Supple","","Crafted (WoD)",3592,60001,{64993,64990,65002,65005,64999,65011,64996,65008,}},
{"Supple","","Crafted (WoD)",3592,60001,{64994,64991,65003,65006,65000,65012,64997,65009,}},
--Crafted Cloth
{"Hexweave","","Crafted (WoD)",400,60001,{63683,63682,63686,63687,63685,63689,63684,63688,}},

--Blackrock LFR Plate
{"Bouldercrush","","Blackrock Foundry LFR",35,60002,{66701,66700,66703,66699,66702,66698,66697,66705,}},--no longer obtainable?
{"Crazed Bomber's","","Blackrock Foundry LFR",35,60002,{63356,63365,63380,63392,63404,63416,63428,63440,}},
{"Iron Bomb","","Blackrock Foundry LFR",35,60002,{66958,66956,66957,66955,66954,66961,66960,66959,}},

--Blackrock LFR Mail
{"Ashlink","","Blackrock Foundry LFR",68,60002,{68055,68047,68051,68039,66917,68035,68043,}},
{"Undying","","Blackrock Foundry LFR",68,60002,{63353,63362,63377,63389,63401,63413,63425,63437,}},
{"Longshot","","Blackrock Foundry LFR",68,60002,{66726,66727,66725,66724,66728,66729,66722,66723,}},--no longer obtainable?

--Blackrock LFR Leather
{"Determined Resolve","","Blackrock Foundry LFR",3592,60002,{63350,63359,63374,63386,63398,63410,63422,63434,}},
{"Bladefang","","Blackrock Foundry LFR",3592,60002,{70296,70260,70344,70312,70360,70280,70328,}},
{"Sootfur","","Blackrock Foundry LFR",3592,60002,{68023,68019,68013,68031,66904,68011,68027,}},

--Blackrock LFR Cloth
{"Ebonflame","","Blackrock Foundry LFR",400,60002,{67988,68000,67996,67992,66925,68004,68007,}},
{"Volatile Ice","","Blackrock Foundry LFR",400,60002,{63347,63368,63371,63383,63395,63407,63419,63431,}},
{"Felcast","","Blackrock Foundry LFR",400,60002,{70272,70292,70324,70356,70276,70340,70308,70244,}},

--Dungeon Plate
{"Incardine","","Dungeon (WoD)",35,60001,{59461,59486,59505,59524,59560,59605,59627,}},
{"Goldsteel","","Dungeon (WoD)",35,60001,{61480,61482,61478,61479,61475,61481,61476,}},
{"Verdant Plate","","Dungeon (WoD)",35,60001,{59462,59487,59506,59525,59561,59606,59628,}},

--Dungeon Mail
{"Streamslither","","Dungeon (WoD)",68,60001,{61382,61402,59574,61362,61372,61332,61392,61342,}},
{"Sharpeye (Blue)","","Dungeon (WoD)",68,60001,{59623,59602,59577,59556,59521,59502,59482,59459,}},
{"Sharpeye (Red)","","Dungeon (WoD)",68,60001,{61384,61404,66773,61364,61374,61334,61394,61344,}},

--Dungeon Leather
{"Leafmender","","Dungeon (WoD)",3592,60001,{59455,59477,59497,59516,59552,59596,59617,59536,}},
{"Burning Focus","","Dungeon (WoD)",3592,60001,{61261,61265,61257,61255,61259,61251,61263,61253,}},
{"Bloodfeather","","Dungeon (WoD)",3592,60001,{61277,61281,61273,61270,61275,61267,61279,61269,}},

--Dungeon Cloth
{"Felflame","","Dungeon (WoD)",400,60001,{59465,59476,59496,59529,59571,59610,59616,59549,}},
{"Felflame","","Dungeon (WoD)",400,60001,{59465,59476,59496,59529,59571,59610,59616,59549,}},
{"Frost-Touched","","Dungeon (WoD)",400,60001,{59453,59473,59493,59513,59568,59593,59613,59533,}},

--Leveling Plate
{"Sharptusk","","Leveling (WoD)(Set 1)",35,60000,{57639,57640,57641,57642,57643,57644,57645,57647,}},
{"Ravenskar","","Leveling (WoD)(Set 1)",35,60000,{57672,57673,57674,57675,57676,57677,57678,57680,}},
{"Talon Guard","","Leveling (WoD)(Set 1)",35,60000,{57705,57706,57707,57708,57709,57710,57711,57713,}},

{"Gul'rok","","Leveling (WoD)(Set 2)",35,60000,{57573,57574,57575,57576,57577,57578,57579,57581,}},
{"Frostwolf Stalwart","","Leveling (WoD)(Set 2)",35,60000,{57245,57246,57247,57248,66009,57251,57253,57244,}},
{"Bladespire","","Leveling (WoD)(Set 2)",35,60000,{57441,57442,57443,57444,57445,57446,57447,57449,}},

--Leveling Mail
{"Frostwolf Ringmail","","Leveling (WoD)(Set 1)",68,60000,{57265,57266,57267,57268,57269,57271,57272,57276,}},
{"Warpscale","","Leveling (WoD)(Set 1)",68,60000,{57602,57598,57600,57601,57603,57604,57605,}},
{"Frostlink","","Leveling (WoD)(Set 1)",68,60000,{57466,57467,57468,57469,57470,57471,57472,57473,}},

{"Varashi","","Leveling (WoD)(Set 2)",68,60000,{57664,57665,57666,57667,57668,57669,57670,57671,}},
{"Ravenchain","","Leveling (WoD)(Set 2)",68,60000,{63595,63599,63604,63607,63611,63617,63620,63624,}},
{"Spirestrider","","Leveling (WoD)(Set 2)",68,60000,{57697,57698,57699,57700,57701,57702,57703,57704,}},

--Leveling Leather
{"Ripfang","","Leveling (WoD)(Set 1)",3592,60000,{57649,57650,57651,57652,57653,57654,57655,57648,}},
{"Breezestrider","","Leveling (WoD)(Set 1)",3592,60000,{57715,57716,57717,57718,57719,57720,57721,57714,}},
{"Shadeback","","Leveling (WoD)(Set 1)",3592,60000,{57682,57683,57684,57685,57686,57687,57688,57681,}},

{"Frostwolf Scout's","","Leveling (WoD)(Set 2)",3592,60000,{57234,57235,57236,57237,57239,57240,57241,57233,}},
{"Voidcaller","","Leveling (WoD)(Set 2)",3592,60000,{57483,57484,57485,57486,57487,57488,57489,57490,}},
{"Daggerjaw","","Leveling (WoD)(Set 2)",3592,60000,{57582,57583,57584,57585,57586,57587,57588,57589,}},

--Leveling Cloth
{"Frostwolf Wind-Talker","","Leveling (WoD)(Set 1)",400,60000,{58077,57256,57258,57260,57261,57262,57263,57264,}},
{"Lunarglow","","Leveling (WoD)(Set 1)",400,60000,{57458,57459,57460,57461,57462,57463,57464,57465,}},
{"Orunai","","Leveling (WoD)(Set 1)",400,60000,{57590,57591,57592,57593,57594,57595,57596,57597,}},

{"Ravendown","","Leveling (WoD)(Set 2)",400,60000,{57656,57657,57658,57659,57660,57661,57662,57663,}},
{"Windswept","","Leveling (WoD)(Set 2)",400,60000,{57722,57723,57724,57725,57726,57727,57728,57729,}},
{"Sunscryer","","Leveling (WoD)(Set 2)",400,60000,{57689,57690,57691,57692,57693,57694,57695,57696,}},
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
{416,69911,69841}, --Hellfire Citadel, Mail/Shaman, Chest/Robe (Heroic)
{415,69910,69839}, --Hellfire Citadel, Mail/Shaman, Chest/Robe (Normal)
{82,70913,70864}, --Warlords Season 2, Mail/Shaman, Chest/Robe (Gladiator)
{103,71824,71775}, --Warlords Season 3, Mail/Shaman, Chest/Robe (Gladiator)
{417,69912,69842}, --Hellfire Citadel, Mail/Shaman, Chest/Robe (Mythic)

{112,71411,71378}, --Warlords Season 3, Leather/Monk, Chest/Robe (Gladiator)
{88,70500,70467}, --Warlords Season 2, Leather/Monk, Chest/Robe (Gladiator)
{503,69711,69697}, --Hellfire Citadel, Leather/Monk, Chest/Robe (Heroic)
{505,69712,69698}, --Hellfire Citadel, Leather/Monk, Chest/Robe (Mythic)
{502,69710,69696}, --Hellfire Citadel, Leather/Monk, Chest/Robe (Normal)

{106,71342,71373}, --Warlords Season 3, Leather/Druid, Chest/Robe (Gladiator)
{84,70431,70462}, --Warlords Season 2, Leather/Druid, Chest/Robe (Gladiator)
{552,69708,69705}, --Hellfire Citadel, Leather/Druid, Chest/Robe (Heroic)
{553,69709,69706}, --Hellfire Citadel, Leather/Druid, Chest/Robe (Mythic)
{551,69707,69703}, --Hellfire Citadel, Leather/Druid, Chest/Robe (Normal)

{418,64467,62902}, --Blackrock Foundry, Mail/Shaman, Chest/Robe (Normal)
{328,67283,62904}, --Blackrock Foundry, Mail/Shaman, Chest/Robe (Heroic)
{420,67284,67278}, --Blackrock Foundry, Mail/Shaman, Chest/Robe (Mythic)

{554,64430,62671}, --Blackrock Foundry, Leather/Druid, Chest/Robe (Normal)
{555,67120,62673}, --Blackrock Foundry, Leather/Druid, Chest/Robe (Heroic)
{556,67121,67117}, --Blackrock Foundry, Leather/Druid, Chest/Robe (Mythic)

{126,64517,64620}, --Warlords Season 1, Leather/Druid, Chest/Robe (Gladiator)
}

--Legion alt appearances at 35559

function AddToCollection()
  for i = 1, #db do
    local data = {};
    data.classMask = db[i][4];
    data.note = db[i][2];
    data.label = db[i][3];
    data.uiOrder = i;
    data.name = db[i][1];
    data.patchID = db[i][5];
    data.requiredFaction = db[i][7];
    data.favorite = false;
    data.expansionID = expansionID;
    if db[i][8] == true then
      data.noLongerObtainable = true;
    end
    
    data.setID = (expansionID + 1) * app.SetsFrame.ExpandedID + db[i][6][1];
    
    data.sources = {};
    for j=1,#db[i][6] do 
      if type(db[i][6][j]) == "table" then
        if not data.altSources then data.altSources = {}; data.altSourceNumbers = {}; end
        data.sources[db[i][6][j][1]] = false--C_TransmogCollection.GetSourceInfo(db[i][6][j][1]).isCollected;
        data.altSources[db[i][6][j][1]] = {db[i][6][j][1], db[i][6][j][2]};
        data.altSourceNumbers[db[i][6][j][1]] = 1;
      else
        data.sources[db[i][6][j]] = false--C_TransmogCollection.GetSourceInfo(db[i][6][j]).isCollected;
      end
    end
    
    app.SetsFrame.AddSetToTables(data);
  end
  
  for i = 1, #altAppearancesDB do
    app.SetsFrame.AddAltAppearancesToTables(altAppearancesDB[i][1],altAppearancesDB[i][2],altAppearancesDB[i][3]);
  end
end

app.ExpandedCallbacks[expansionID] = AddToCollection;
app.altAppearancesDB[expansionID] = altAppearancesDB;
--do
--  for i = 1, #altAppearancesDB do
--    app.ExpandedAltAppearances[altAppearancesDB[i][1]] = {altAppearancesDB[i][2],altAppearancesDB[i][3]};
--  end
--end

--data:
----classMask:    yes (simply use 35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
----collected:    no
----description:  yes
----expansionID:  no (file dependent can hardcode)
----favorite:     no
----hidden...:    no
----label:        yes (source i.e. dungeon/leveling/islands)
----limitedTime:  no
----name:         yes
----patchID:      yes (for sorting, 80300 = patch 8.3)
----requiredFact: yes
----setID:        yes (auto gened)
----uiOrder:      yes (might just always put 0, for sorting)
----sources:      myAddition, list of items in the set