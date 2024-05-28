local app = select(2,...);

local expansionID = 3;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Crafted Plate
{"Pyrium","","Crafted (Cata)",35,39902,{38287,38299,38300,38290,38283,38286,38284,38288,}},
{"Ornate Pyrium","","Crafted (Cata)",35,39902,{38282,38292,38297,38293,38285,38298,38296,38289,}},
{"Dancing Waves","","Crafted (Cata)",35,39902,{28609,28764,28765,28766,28767,28768,31339,}},
--Crafted Mail
{"Dragonscale","","Crafted (Cata)",68,39902,{38264,38279,38272,38266,38280,38245,38274,38278,}},
{"Charscale","","Crafted (Cata)",68,39902,{38247,38248,38261,38254,38234,38249,38256,38258,}},
--Crafted Leather
{"Late Bloom","","Crafted (Cata)",3592,39902,{28613,28788,28789,28790,28791,28792,35644,35645,}},
{"Bloodthirsty","","Crafted (Cata)",3592,39902,{35635,35638,35641,35640,35642,35639,35636,35637,}},
--Crafted Cloth
{"Embersilk","","Crafted (Cata)",400,39902,{26471,26472,26473,26474,26475,26476,26477,26478,}},
{"Fireweave","","Crafted (Cata)",400,39902,{26463,26464,26465,26466,26467,26468,26469,26470,}},
{"Embalmed Darkness","","Crafted (Cata)",400,39902,{28614,28793,28794,28795,28796,28797,}},

--Dungeon Plate
{"Risen Land","","Dungeon (Cata)",35,39901,{26879,26888,27381,27393,27425,27547,27564,}},
{"Omega","","Dungeon (Cata)",35,39901,{26875,28567,27384,27397,27420,27430,27555,}},
{"Sullen Earth","","Dungeon (Cata)",35,39901,{34147,26897,27410,27424,27433,27552,27568,}},

{"Skullpiercer","","Troll Dungeon (Cata)",35,40100,{15277,15284,15479,15480,15481,35494,35523,}},
{"Amani Empire","","Troll Dungeon (Cata)",35,40100,{35495,35505,35528,35568,}},
{"Troll Skull","","Troll Dungeon (Cata)",35,40100,{15272,15454,15461,15476,15477,15478,}},
{"Tarnished Fanatic's","","Troll Dungeon (Cata)",35,40100,{49173,49174,49176,49177,49178,49179,49232,}},

{"Lost Time","","Caverns of Time Dungeon (Cata)",35,40300,{37287,37297,37321,37341,37356,38412,72506,}}, --Hour of Twilight/End Times/Well of Eternity
{"Tarnished Bronze","","Caverns of Time Dungeon (Cata)",35,40300,{37280,37283,37295,37298,37299,37320,37338,}},
{"Temporal","","Caverns of Time Dungeon (Cata)",35,40300,{37281,37300,37301,37311,37330,37349,37357,38414,}},

--Dungeon Mail
{"Heat Wave","","Dungeon (Cata)",68,39901,{26873,26893,27403,27411,27426,27445,27565,26901}},
{"Wentletrap","","Dungeon (Cata)",68,39901,{26868,26884,26889,27413,27429,27515,27567,27396}},

{"Restless Spirits","","Troll Dungeon (Cata)",68,40100,{35476,35492,35502,35514,35525,35548,49237,35481}},
{"Brittle Flamereaver","","Troll Dungeon (Cata)",68,40100,{49165,49166,49168,49169,{49170,35524},49171,49172,49167,}},
{"Scaled Drakeskin","","Troll Dungeon (Cata)",68,40100,{16189,16190,16191,}},

{"Dead End","","Caverns of Time Dungeon (Cata)",68,40300,{37279,37313,37325,37336,37347,37352,37361,38417,}},
{"Demonsbane","","Caverns of Time Dungeon (Cata)",68,40300,{37286,37296,37319,37327,37333,37354,38419,}},

--Dungeon Leather
{"Fallen City","","Dungeon (Cata)",3592,39901,{26880,27385,27394,27414,27439,27548,33173,}},
{"Hieroglyphic","","Dungeon (Cata)",3592,39901,{26872,26896,27399,27417,27435,28573,27729,}},

{"Soulflayer","","Troll Dungeon (Cata)",3592,40100,{35471,35498,35506,35522,35532,49234,}},
{"Timeworn Shadowtooth","","Troll Dungeon (Cata)",3592,40100,{49163,49158,49164,49160,15459,49162,49159,49161,}},
{"Kaldorei Protector","","Troll Dungeon (Cata)",3592,40100,{15350,15505,15509,15510,15719,35478,35486,}},

{"Timeway","","Caverns of Time Dungeon (Cata)",3592,40300,{37278,37303,37318,37334,37351,37358,38409,38415,}},
{"Time Twisted","","Caverns of Time Dungeon (Cata)",3592,40300,{37285,37304,37310,37314,37324,37326,37345,}},

--Dungeon Cloth
{"Overly Intelligent","","Dungeon (Cata)",400,39901,{26886,27421,27438,31999,28574,30743,32186,}},
{"Broken Dreams","","Dungeon (Cata)",400,39901,{26869,27386,27391,27421,27440,27556,34163,}},
{"Inquisition","","Dungeon (Cata)",400,39901,{26898,26900,27402,27575,28194,}},

{"Departed Spirits","","Troll Dungeon (Cata)",400,40100,{35480,35490,35521,35565,}},
{"Heavenly Purpose","","Troll Dungeon (Cata)",400,40100,{15274,15447,15465,15516,15518,}},
{"Faded Spirit-Wrencher","","Troll Dungeon (Cata)",400,40100,{49153,49254,15517,35466,49117,}},
{"Serpentine","","Troll Dungeon (Cata)",400,40100,{35489,35510,35513,}},

{"Time Traveler's","","Caverns of Time Dungeon (Cata)",400,40300,{37282,37293,37305,37335,37359,38411,38416,}},
{"Fate","","Caverns of Time Dungeon (Cata)",400,40300,{37306,37315,37317,37328,37329,37342,}},

--Leveling Plate
{"Completed Rituals","","Leveling (Cata)(Set 1)",35,39900,{26234,26239,26248,29626,29627,32219,32300,}},
{"Poetic Orc","","Leveling (Cata)(Set 1)",35,39900,{26259,29611,29615,29619,29622,32312,34258,32304,}},
{"High-Grade","","Leveling (Cata)(Set 1)",35,39900,{26231,26242,32227,32268,32308,32309,32310,34253,}},

{"Sunveil","","Leveling (Cata)(Set 2)",35,39900.1,{29669,31638,32277,33299,33362,}},
{"Thaurissan's","","Leveling (Cata)(Set 2)",35,39900.1,{29634,29637,31610,31987,32852,33302,33324,}},

{"Alraming Dreams","","Leveling (Cata)(Set 3)",35,39900.2,{29885,29806,29817,29826,29831,29869,29920,}},
{"Stormforged","","Leveling (Cata)(Set 3)",35,39900.2,{26798,26799,26800,26801,26802,26803,26804,26805,}},
{"Direforge","","Leveling (Cata)(Set 3)",35,39900.2,{27094,27103,27112,27121,27130,27139,27148,27157,}},
{"Mendicant","","Leveling (Cata)(Set 3)",35,39900.2,{28198,28204,28212,28233,28247,28253,28269,}},

{"Contained Sorrow","","Leveling (Cata)(Set 4)",35,39900.3,{31588,31615,31907,31894,}},
{"Thankless Deeds","","Leveling (Cata)(Set 4)",35,39900.3,{32880,31751,31761,32879,32890,}},

{"Redsteel","","Leveling (Cata)(Set 5)",35,39900.4,{26790,26791,26792,26793,26795,26797,31738,31757,}},
{"Eastwall","","Leveling (Cata)(Set 5)",35,39900.4,{31630,31634,31646,27969}},
{"Rustproof","","Leveling (Cata)(Set 5)",35,39900.4,{15310,15311,15313,31617,31620,31880,72500,31887}},

{"Leftover Mechachicken","","Leveling (Cata)(Set 6)",35,39900.5,{25895,25896,25922,26760,}},

{"Hardened Obsidian","","Leveling (Cata)(Set 7)",35,39900.5,{26653,26654,26655,26666,26787,26788,26789,32007,}},

{"Tablet-Bearer's","","Leveling (Cata)(Set 8)",35,39900.5,{29515,26046,26041,27476,28562,}},

--Leveling Mail
{"Earthen","","Leveling (Cata)(Set 1)",68,39900,{29837,29864,30777,29880,29902,29914,29965,}},
{"Rapid Promotion","","Leveling (Cata)(Set 1)",68,39900,{28195,28209,28218,28222,28225,28228,28255,}},

{"Fuselight","","Leveling (Cata)(Set 2)",68,39900.1,{27968,31597,31599,31697,31613,31911,31699}},
{"Blood Speaker","","Leveling (Cata)(Set 2)",68,39900.1,{27946,27949,27976,31587,31605,31657,31886,31596}},
{"Protest","","Leveling (Cata)(Set 2)",68,39900.1,{27991,27998,31649,31754,31763,31769,32883,27956}},

{"Improvised","","Leveling (Cata)(Set 3)",68,39900.2,{26238,32226,32237,32251,32292,32301,34218,34251,}},
{"Bravery","","Leveling (Cata)(Set 3)",68,39900.2,{26241,26247,29610,29614,29630,32306,34243,}},
{"Merciless","","Leveling (Cata)(Set 3)",68,39900.2,{26245,26254,29606,29618,29621,32296,32303,}},
{"Mischievous","","Leveling (Cata)(Set 3)",68,39900.2,{26230,32233,32243,32260,32267,32299,32302,}},

{"Overlord's","","Leveling (Cata)(Set 4)",68,39900.3,{31985,32276,33319,33326,}},
{"Redemption","","Leveling (Cata)(Set 4)",68,39900.3,{29632,31660,33341,33344,34232,}},

{"Southfury","","Leveling (Cata)(Set 5)",68,39900.4,{27164,27173,27182,27191,27200,27209,27218,27227,}},
{"Starry Obelisk","","Leveling (Cata)(Set 5)",68,39900.4,{33190,33194,33210,33214,33233,33240,33246,}},
{"Twilight Finality","","Leveling (Cata)(Set 5)",68,39900.4,{32008,32015,32020,32039,32044,32052,32063,}},

--Leveling Leather
{"Clayridge","","Leveling (Cata)(Set 1)",3592,39900,{26233,32217,32236,32250,32284,32293,34205,34208,}},
{"Plainstalker","","Leveling (Cata)(Set 1)",3592,39900,{26253,26256,29605,29617,29620,29624,32288,34231,}},
{"Blazerunner","","Leveling (Cata)(Set 1)",3592,39900,{26240,26244,26252,29613,29629,32291,34209,34211,}},
{"Hot Spring","","Leveling (Cata)(Set 1)",3592,39900,{32291,32259,26227,32242,77840,34217,32232,32266,}},

{"Marshwarden's","","Leveling (Cata)(Set 2)",3592,39900.1,{4044,15296,15298,27983,27997,28565,31614,31905,}},
{"Dustwind","","Leveling (Cata)(Set 2)",3592,39900.1,{15299,27945,27951,28545,28548,31274,31713,}},
{"Duskwing","","Leveling (Cata)(Set 2)",3592,39900.1,{27955,27990,31629,31640,31762,31775,32870,}},
--{"Restraint","","Leveling (Cata)",3592,39900,{27967,31632,31635,31695,31703,}}, -- Missing Pants

{"Rivetproof","","Leveling (Cata)(Set 3)",3592,39900.2,{32010,32016,32137,32045,32058,32064,32090,32040}},
{"Unforgiving Tomb","","Leveling (Cata)(Set 3)",3592,39900.2,{33191,33195,33198,33201,33209,33217,33226,33257,}},

{"Highlord's","","Leveling (Cata)(Set 4)",3592,39900.3,{28557,32275,33303,45672,100763,}},
{"Warpwood Bark","","Leveling (Cata)(Set 4)",3592,39900.3,{29632,31983,33317,33320,33323,}},
{"Chillwind","","Leveling (Cata)(Set 4)",3592,39900.3,{40773,33320,40812,31659,31288,40830,45668}},

{"Mosshide","","Leveling (Cata)(Set 5)",3592,39900.4,{27238,27245,27254,27263,27272,27281,27290,27299,}},
{"Monastic","","Leveling (Cata)(Set 5)",3592,39900.4,{45895,45896,45894,45900,45899,45893,45897,45898,}},
{"Darkbrand","","Leveling (Cata)(Set 5)",3592,39900.4,{27760,27761,27768,27772,27776,27780,27784,27788,}},
{"Seafletcher","","Leveling (Cata)(Set 5)",3592,39900.4,{29821,29838,29846,29852,29870,{29890,29937},29928,29944,}},

{"Earthbound","","Leveling (Cata)(Set 6)",3592,39900.5,{26711,26044,26047,26734,30859,30866,31271,}},
{"Riptide","","Leveling (Cata)(Set 6)",3592,39900.5,{30867,15304,26707,26719,26725,30874,29518,}},
{"Spearhead","","Leveling (Cata)(Set 6)",3592,39900.5,{26062,27456,26037,15302,30889,15305,3333,}},
{"Honor's Stand","","Leveling (Cata)(Set 6)",3592,39900.5,{15301,26035,27495,26042,26066,26048,26077,}},

--Leveling Cloth
{"Tainted Blood","","Leveling (Cata)(Set 1)",400,39900,{26045,26053,26718,29508,30869,}},
{"Bloody Field","","Leveling (Cata)(Set 1)",400,39900,{1966,3334,26060,26091,26098,27447,28353,}},
{"Last Priestess","","Leveling (Cata)(Set 1)",400,39900,{29520,26692,27450,27462,31241,}},

{"Mischief","","Leveling (Cata)(Set 2)",400,39900.1,{27952,27996,31628,31767,32848,32851,32853,32854,}},
{"Flirtation","","Leveling (Cata)(Set 2)",400,39900.1,{15293,{27970,31869},31279,31589,31594,31601,31618,}},
{"Overload","","Leveling (Cata)(Set 2)",400,39900.1,{15291,15294,{31655,31909},31694,31702,31717,31725,31936,}},
{"Disgrace","","Leveling (Cata)(Set 2)",400,39900.1,{31639,31749,31952,31967,}},

{"Sparklight","","Leveling (Cata)(Set 3)",400,39900.2,{30797,30762,30767,30775,30781,30815,30818,30821,}},
{"Deathsilk","","Leveling (Cata)(Set 3)",400,39900.2,{26447,26448,26449,26450,26451,26452,26453,26454,}},
{"Mystral","","Leveling (Cata)(Set 3)",400,39900.2,{27313,27322,27331,27340,27349,27358,27367,27376,}},
{"Spiritmend","","Leveling (Cata)(Set 3)",400,39900.2,{26455,26456,26457,26458,26459,26460,26461,26462,}},

{"Obelisk","","Leveling (Cata)(Set 4)",400,39900.3,{33189,33211,33248,33238,33262,33265,33275,33230,}},
{"Dragonwing","","Leveling (Cata)(Set 4)",400,39900.3,{32006,32021,32035,32049,32065,32070,32091,}},

{"Infernal Nocturnal","","Leveling (Cata)(Set 5)",400,39900.4,{26243,26251,26258,34210,32287,34212,34213,34214,}},
{"Faux Warlock","","Leveling (Cata)(Set 5)",400,39900.4,{26232,32285,32249,32258,32265,32286,34200,32283,}},

--Worgen Starter Sets
--Plate
{"Gilnean Recruit's","Given when creating a Worgen Warrior.","Worgen",35,100000,{24274,24273,24272,24275,}},
--Mail
{"Gilnean Trapper's","Given when creating a Worgen Hunter.","Worgen",68,100000,{24266,24264,24265,24267,}},
--Leather
{"Gilnean Novice's","Given when creating a Worgen Druid.","Worgen",3592,100000,{24259,24262,24260,24261,}},
{"Gilnean Footpad's","Given when creating a Worgen Rogue.","Worgen",3592,100000,{24270,24268,24271,24269,}},
--Cloth
{"Gilnean Apprentice's","Given when creating a Worgen Mage.","Worgen",400,100000,{24120,24121,24122,}},
{"Gilnean Neophyte's","Given when creating a Worgen Priest.","Worgen",400,100000,{24124,24125,24122,}},
{"Gilnean Acolyte's","Given when creating a Worgen Warlock.","Worgen",400,100000,{24129,24130,24128,}},

--Goblin Starter Sets
--Plate
{"Goblin Brawler's","Given when creating a Goblin Warrior.","Goblin",35,100000,{24230,24233,24232,24234,}},
--Mail
{"Goblin Trapper's","Given when creating a Goblin Hunter.","Goblin",68,100000,{24208,24209,24210,}},
{"Primal","Given when creating a Goblin Shaman.","Goblin",68,100000,{25765,25766,25767,}},
--Leather
{"Goblin Thug's","Given when creating a Goblin Rogue.","Goblin",3592,100000,{24220,24221,24222,}},
--Priest
{"Goblin Apprentice's","Given when creating a Goblin Mage.","Goblin",400,100000,{24211,24215,24101,31,}},
{"Goblin Neophyte's","Given when creating a Goblin Priest.","Goblin",400,100000,{24216,24219,24101,34,}},
{"Goblin Acolyte's","Given when creating a Goblin Warlock.","Goblin",400,100000,{24226,24235,24101,34,}},

};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
{596,37761,45575}, --Cataclysmic Gladiator's Scaled Armor (season 11), Plate/Paladin, Chest/Robe (Gladiator)

{820,30012,47088}, --Bastion of Twilight, Leather/Druid, Chest/Robe (Normal)
{821,32758,27831}, --Bastion of Twilight, Leather/Druid, Chest/Robe (Normal)

{634,36781,36771}, --Firelands, Mail/Shaman, Pants/Kilt (Heroic)
{633,36576,36581}, --Firelands, Mail/Shaman, Pants/Kilt (Heroic)
}

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