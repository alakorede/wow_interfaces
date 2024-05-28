local app = select(2,...);

local expansionID = 1;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Classic Raid Recolors Plate
{"Purple Judgement","","Classic Raid Recolors (BC)",2,20000.1,{11907,11932,11967,11974,12037,12066,12137,12340,}},
{"Red Lawbringer","","Classic Raid Recolors (BC)",2,20000.1,{11898,11939,12044,12073,12102,12129,12136,12406,}},
{"Blue Lawbringer","","Classic Raid Recolors (BC)",2,20000.1,{9343,14337,14338,}},
{"Red Battlegear of Might","","Classic Raid Recolors (BC)",1,20000.1,{11905,11930,12064,12144,12155,12329,12398,12427,}},
{"Green Battlegear of Wrath","","Classic Raid Recolors (BC)",1,20000.1,{11909,11951,11957,11995,12081,12105,12360,12438,}},
--Classic Raid Recolors Mail
{"Red Dragonstalker","","Classic Raid Recolors (BC)",4,20000.1,{11936,11969,12034,12087,12132,12153,12338,12412,}},
{"Purple Dragonstalker","","Classic Raid Recolors (BC)",4,20000.1,{12604,13183,13184,13185,13882,}},
{"Orange Giantstalker","","Classic Raid Recolors (BC)",4,20000.1,{11901,11952,11953,12057,12309,12335,12382,}},
{"The Ten Pink Storms","","Classic Raid Recolors (BC)",64,20000.1,{11908,11975,12047,12080,12090,12094,12150,12316,}},
{"Dark Purple Earthfury","","Classic Raid Recolors (BC)",64,20000.1,{11904,12068,12103,12198,12363,12439,}},
--Classic Raid Recolors Leather
{"Blue Bloodfang","","Classic Raid Recolors (BC)",8,20000.1,{11946,12051,12063,12093,12114,12252,12328,12442,}},
{"Silver Bloodfang","","Classic Raid Recolors (BC)",8,20000.1,{12525,12544,12570,12575,12615,12739,13503,12761,}},
{"Blue Stormrage","","Classic Raid Recolors (BC)",1024,20000.1,{11927,11934,12062,12085,12152,12334,12339,12355,}},
{"Gold Nightslayer","","Classic Raid Recolors (BC)",8,20000.1,{11910,11915,11972,12089,12149,12164,12200,}},
{"Silver Nightslayer","","Classic Raid Recolors (BC)",8,20000.1,{12415,13101,13875,14322,}},
{"Yellow Cenarion","","Classic Raid Recolors (BC)",1024,20000.1,{11906,12049,12075,12091,12352,12365,12409,12444,}},
--Classic Raid Recolors Cloth
{"Orange Nemesis","","Classic Raid Recolors (BC)",256,20000.1,{11911,11935,12061,12070,12074,12086,12199,12407,}},
{"Purple Transcendence","","Classic Raid Recolors (BC)",16,20000.1,{11903,11940,11970,12113,12156,12337,12351,12380,}},
{"Red Netherwind","","Classic Raid Recolors (BC)",128,20000.1,{11914,11949,12053,12088,12141,12308,12393,12426,}},
{"Purple Prophecy","","Classic Raid Recolors (BC)",16,20000.1,{8650,8651,8652,9480,9483,}},
{"Gold Arcanist","","Classic Raid Recolors (BC)",128,20000.1,{9482,9485,12560,12726,13998,}},
{"Copper Arcanist","","Classic Raid Recolors (BC)",128,20000.1,{11931,12032,12035,12050,12083,12106,12332,12353,}},
{"Teal Arcanist","","Classic Raid Recolors (BC)",128,20000.1,{8647,8648,8649,11973,12515,}},

--BC Raid Recolors Plate
{"Wardancer","","Serpentshrine Cavern",1,20000,{13413,13438,13452,13496,13539,}},
--{"Glowing Truth","","Serpentshrine Cavern",2,20000,{13493,13505,13523,13547,16221,}}, --Missing Pants
{"Protectorate","","Gruul's Lair",2,20000,{13407,13399,15065,}},
--BC Raid Recolors Mail
{"Void Reaver","","Serpentshrine Cavern",4,20000,{13440,13490,13491,13497,13524,13530,}},
{"The Wavemender's","","Black Temple",64,20000,{13961,14872,15007,16553,}},
{"Fire Crest","","Serpentshrine Cavern",64,20000,{13385,13431,13446,13489,13492,13535,}},
--BC Raid Recolors Leather
--{"Immortal Nature","","Black Temple",1024,20000,{14871,14895,14909,15008,}},--Missing Chest
--BC Raid Recolors Cloth
{"Benevolence","","Black Temple",16,20000,{14897,14910,14919,14931,16200,}},
{"Shifting Nightmare","","Serpentshrine Cavern",256,20000,{13495,13499,13504,13519,}},
{"Grand Engineer","","Serpentshrine Cavern",128,20000,{13383,13427,13441,13442,13468,13470,13507,13544,}},

--Vendor Plate
--Vendor Mail
--Vendor Leather
--Vendor Cloth

--Crafted Plate
--Crafted Mail
--Crafted Leather
--Crafted Cloth

--Dungeon Plate
{"Lightforge","","Dungeon (BC)(Set 1)",35,20000,{6853,6854,6855,6856,6857,6858,6859,6860,}},
{"Azureplate","","Dungeon (BC)(Set 1)",35,20000,{9420,9520,9571,9572,10654,11879,11888,}},

{"Doomplate","","Dungeon (BC)(Set 2)",35,20000,{11938,12055,12116,12194,12343,12394,12448,}},
{"Bold","","Dungeon (BC)(Set 2)",35,20000,{11923,12078,12191,12327,12418,13033,13034,}},
{"Courage","","Dungeon (BC)(Set 2)",35,20000,{12510,12522,12571,12573,12582,12594,12695,12194,}},

{"Righteous","","Dungeon (BC)(Set 3)",35,20000,{11963,12030,12098,12325,12369,13048,13049,}},
{"Crusader's Ornamented","","Dungeon (BC)(Set 3)",35,20000,{16472,16471,16473,16474,16475,17064,}},

{"Iron Guardian","","Dungeon (BC)(Set 4)",35,20000,{9429,9434,9519,9528,9570,9575,10667,}},
{"Wildguard","","Dungeon (BC)(Set 4)",35,20000,{14333,14335,14336,}},

--Dungeon Mail
{"Shamblehide","","Dungeon (BC)(Set 1)",68,20000,{9421,9433,9516,9522,9565,9577,10653,11884,}},
{"Netherstrike","","Dungeon (BC)(Set 1)",68,20000,{13187,13188,13189,13807,}},

{"Living Lightning","","Dungeon (BC)(Set 2)",68,20000,{9427,9514,9529,10659,10666,11893,}},

{"Beast Lord","","Dungeon (BC)(Set 3)",68,20000,{11922,12076,12119,{12345,16451},12367,13054,13055,13053,}},
{"Desolation","","Dungeon (BC)(Set 3)",68,20000,{11926,11958,12009,12162,12314,12434,12446,}},
{"Carnage","","Dungeon (BC)(Set 3)",68,20000,{12523,12574,12692,21305,21313,}},

{"Mistshroud","","Dungeon (BC)(Set 4)",68,20000,{14481,14482,14483,14484,14485,14486,}},
{"Felstalker","","Dungeon (BC)(Set 4)",68,20000,{10554,10555,10556,12296,35709,}},

{"Tidefury","","Dungeon (BC)(Set 5)",68,20000,{{11944,16135},12077,12147,12348,12417,13039,13040,13038}},
{"Seer's","","Dungeon (BC)(Set 5)",68,20000,{16462,{16461,12687},{16464,18047},16463,16465,}},

--Dungeon Leather
{"Assassination","","Dungeon (BC)(Set 1)",3592,20000,{11943,12059,12146,12326,12458,13042,13043,}},
{"Opportunist's","","Dungeon (BC)(Set 1)",3592,20000,{16444,16441,16442,16443,16445,21345,12408,}},

{"Wastewalker","","Dungeon (BC)(Set 2)",3592,20000,{11960,12048,12072,12096,12342,12362,12408,}},
{"Moonglade","","Dungeon (BC)(Set 2)",3592,20000,{11916,12028,12118,12324,12416,13057,13058,}},

{"Nightwatcher","","Dungeon (BC)(Set 3)",3592,20000,{9531,9566,9569,11880,11886,}},

--Dungeon Cloth
{"Divine Authority","","Dungeon (BC)(Set 1)",400,20000,{14303,9537,11881,11882,11896,}},

{"Mana-Etched","","Dungeon (BC)(Set 2)",400,20000,{11913,12071,12101,12145,12313,12315,12451,}},
{"Mooncloth","","Dungeon (BC)(Set 2)",400,20000,{16137,16416,16417,16418,16419,16420,}},
{"Hallowed","","Dungeon (BC)(Set 2)",400,20000,{11964,12058,12120,12347,12457,13045,13046,}},

{"Arcane Rage","","Dungeon (BC)(Set 3)",400,20000,{9423,9515,9532,9535,9564,9579,10668,}},

{"Oblivion","","Dungeon (BC)(Set 4)",400,20000,{11965,12060,12168,12349,12459,13036,13037,}},
{"Fel-Tinged","","Dungeon (BC)(Set 4)",400,20000,{76766,21329,}},

{"Incanter's","","Dungeon (BC)(Set 5)",400,20000,{11942,12029,12097,12346,12368,13051,13052,}},

--Leveling Plate
{"Bloodscale","","Leveling (BC)(Set 1)",35,19999,{9967,9968,9969,9970,9972,9974,}},

{"Warmaul","","Leveling (BC)(Set 2)",35,19999,{10015,10016,10017,10018,10020,10022,}},

{"Bloodfist","","Leveling (BC)(Set 3)",35,19999,{10023,10024,10025,10026,10028,10030,}},

{"Conqueror's","","Leveling (BC)(Set 4)",35,19999,{10031,10032,10033,10034,10036,10038,}},

{"Khan'aish","","Leveling (BC)(Set 5)",35,19999,{9983,9984,9986,9988,9990,10041,10043,10045,}},
{"Grimscale","","Leveling (BC)(Set 5)",35,19999,{9943,9944,9945,9946,9948,9950,}},
{"Tarnished Plate","","Leveling (BC)(Set 5)",35,100000,{10381,10378,10384,10379,10380,10382,}},

{"Bogslayer","","Leveling (BC)(Set 6)",35,19999,{9975,9976,9977,9978,9979,9980,9981,9982,}},

{"Fel Iron","","Leveling (BC)(Set 7)",35,19999,{9301,9302,9303,9304,9305,}},
{"Bone-Plated","","Leveling (BC)(Set 7)",35,19999,{14582,18501,3026,18502,18503,4712,}},
{"Darksoul","","Leveling (BC)(Set 7)",35,19999,{7789,7787,14417,7788,}},
{"Flamebane","","Leveling (BC)(Set 7)",35,100000,{5810,9324,4717,9329,9326,9325,}},
{"Iron Tower","","Leveling (BC)(Set 7)",35,100000,{13514,8810,9340,}},
{"Heroic","","Leveling (BC)(Set 7)",35,100000,{5776,5770,5773,5775,14492,5777,5772,}},

{"Talonguard","","Leveling (BC)(Set 8)",35,19999,{9991,9992,9993,9994,9996,9998,}},

--Leveling Mail
{"Stormforged","","Leveling (BC)(Set 1)",68,19999,{10407,10436,13516,10461,10462,10484,}},

{"Talhide","","Leveling (BC)(Set 2)",68,19999,{9927,9928,9929,9930,9931,9932,9933,9934,}},

{"Inferno Forged","","Leveling (BC)(Set 3)",68,19999,{13907,14020,14025,14026,}},
{"Brigandine","","Leveling (BC)(Set 3)",68,19999,{789,790,791,792,793,794,}},
{"Augmented Chain","","Leveling (BC)(Set 3)",68,19999,{783,785,784,786,787,788,}},

{"Warder's","Vendor: Sana (Orgrimmar) or Aldric Moore (Stormwind)","Leveling (BC)(Set 4)",68,19999,{28826,8248,8249,}},

{"Scout's","Vendor: Sana (Orgrimmar) or Aldric Moore (Stormwind)","Leveling (BC)(Set 5)",68,19999,{28829,9210,9214,}},

--Leveling Leather
{"Wild Draenish","","Leveling (BC)(Set 1)",3592,19999,{10536,10537,10538,10539,}},
{"Muck","","Leveling (BC)(Set 2)",3592,19999,{10412,10423,10430,10456,10459,10470,}},

{"Expedition","","Leveling (BC)(Set 2)",3592,19999,{9815,9816,9817,9818,9819,9820,9821,9822,}},

{"Bonechewer","","Leveling (BC)(Set 3)",3592,19999,{9718,9719,9720,9721,9723,9725}},
{"Sun Cured","","Leveling (BC)(Set 3)",3592,19999,{8269,8264,8268,8247,8266,8267}},
{"Lookout's","","Leveling (BC)(Set 3)",3592,19999,{8246,8245,8247,9721,9719}},

--Leveling Cloth
{"Windchanneller's","","Leveling (BC)(Set 1)",400,19999,{14463,14464,14465,14466,14467,14468,14469,14470,}},

{"Vindicator","","Leveling (BC)(Set 2)",400,19999,{9638,9639,9640,9641,9642,9643,9644,9645,}},

{"Mistyreed","","Leveling (BC)(Set 3)",400,19999,{9662,9663,9664,9665,9666,9667,9668,9669,}},
{"Consortium","","Leveling (BC)(Set 3)",400,19999,{9678,9679,9680,9681,9682,9683,9684,9685,}},

{"Soul-Trader's","","Leveling (BC)(Set 4)",400,19999,{18283,8686,18280,18360,18282,18281,}},

--{"Fireheart","","Leveling (BC)(Set 4)",400,19999,{9614,9615,9616,9617,9619,9621,}},
--{"Laughing Skull","","Leveling (BC)(Set 4)",400,19999,{9633,9630,9631,9632,9634,9635,9637,}},
--{"Outlander's","","Leveling (BC)(Set 4)",400,19999,{9609,9608,9611,9602,9607,9613,}},
--{"Feralfen","","Leveling (BC)(Set 4)",400,19999,{9656,9659,9654,9655,9657,9661,}},

--{"Astralaan","","Leveling (BC)(Set -)",400,19999,{9670,9671,9673,9674,9675,9676,9677,}},--Missing Chest
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
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
    
    if type(db[i][6][1]) == "table" then
      data.setID = (expansionID + 1) * app.SetsFrame.ExpandedID + db[i][6][1][1];
    else
      data.setID = (expansionID + 1) * app.SetsFrame.ExpandedID + db[i][6][1];
    end
    
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