local app = select(2,...);

local expansionID = 2;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Misc
{"Acherus Knight's","","Death Knight Starter Armor",32,30000,{16086,16087,16088,16089,16090,16091,16092,16093,}},
--Raid Plate
{"Saronite War","","General Raid (WotLK)",35,30005,{18508,18509,18737,18512,18513,18514,18515,18516,}},
{"Diminished Pride","","General Raid (WotLK)",35,30005,{19038,19058,19083,19245,19250,19555,19619,21276,}},
{"Unnatural Death","","General Raid (WotLK)",35,30005,{17685,19039,19059,19090,19272,19554,19617,}},
--Raid Mail
{"Colossal Strides","","General Raid (WotLK)",68,30005,{19057,19243,19274,19324,19364,19517,19620,}},
{"Lost Pack","","General Raid (WotLK)",68,30005,{17791,17937,18080,18744,18778,18839,17634,}},
{"Audient Earth","","General Raid (WotLK)",68,30005,{17903,17956,18020,18066,18762,18834,18846,21281,}},
{"Undisturbed","","General Raid (WotLK)",68,30005,{19051,19225,19239,19267,19313,19621,21701,}},
--Raid Leather
{"Silence","","General Raid (WotLK)",3592,30005,{19060,19084,19302,19321,19330,}},
{"Monstrosity","","General Raid (WotLK)",3592,30005,{17920,18023,18731,18738,18752,18763,19492,}},
{"Resumed Battle","","General Raid (WotLK)",3592,30005,{17653,18783,17921,18736,18831,18841,}},
{"Perished","","General Raid (WotLK)",3592,30005,{18712,19080,19091,19227,19270,19533,}},
--Raid Cloth
{"Spellweave","","General Raid (WotLK)",400,30005,{19053,19064,20380,19311,{20383,19383},19525,19528,19624,}},
{"Ebonweave","","General Raid (WotLK)",400,30005,{19052,20382,19224,20379,19279,19625,}},
{"Sheet Lightning","","General Raid (WotLK)",400,30005,{17690,17750,{17902,18848},17991,{18029,18771},18740,18779,22844,}},
{"Glistening Runes","","General Raid (WotLK)",400,30005,{17636,17792,{18065,18701},18079,18695,18838,18849,}},

--Ulduar Plate
{"Steelbreaker's","","Ulduar Raid",35,30100,{21647,21663,21681,21722,21749,21791,21931,22010,}},
{"Dragonsteel","","Ulduar Raid",35,30100,{21773,21798,22038,22108,22160,22170,22192,22194,}},
{"Tempered Will","","Ulduar Raid",35,30100,{21778,21792,22041,22050,22119,22123,22158,22184,}},
{"Clinging Hope","","Ulduar Raid",35,30100,{21669,21687,21723,21741,21899,21912,21950,}},
{"Dragonslayer's","","Ulduar Raid",35,30100,{21651,21668,21686,21725,21740,21752,21802,21948,}},
{"Stonewarder","","Ulduar Raid",35,30100,{21762,21770,21777,21782,21971,22049,22122,22193,}},
--Ulduar Mail
{"Insidious Intent","","Ulduar Raid",68,30100,{21649,21672,21684,21724,21735,21914,21923,21961,}},
{"Tempered Mercury","","Ulduar Raid",68,30100,{21774,22040,22112,22128,22164,22180,21775,}},
--Ulduar Leather
{"Death-Warmed","","Ulduar Raid",3592,30100,{21776,21784,21794,21982,22039,22110,22127,}},
{"Wavering Shadow","","Ulduar Raid",3592,30100,{21648,21670,21682,21736,21795,21913,21939,21960,}},
{"Flamewrought","","Ulduar Raid",3592,30100,{21675,21702,{21729,21957},21747,21902,21932,21940,21953,}},
{"Glowing Crescent","","Ulduar Raid",3592,30100,{21768,21845,21915,22044,22095,22157,22172,22199,}},
--Ulduar Cloth
{"Icy Breaths","","Ulduar Raid",400,30100,{21767,21779,21922,21993,22096,22111,22159,22175,}},
{"Soot-Covered","","Ulduar Raid",400,30100,{21653,21676,21703,21730,21745,21951,84532,}},
{"Luminescence","","Ulduar Raid",400,30100,{21655,21664,21732,21742,21757,21924,21944,}},
{"Inconceivable Horror","","Ulduar Raid",400,30100,{21766,21888,22047,22073,22118,22174,22189,22200,}},

--Trial of the Champion Plate
{"Stouthearted Crusader","","Trial of the Champion",35,30200,{20052,21431,21551,22610,22626,22799,22813,22848,}},
{"Solemn Council","","Trial of the Champion",35,30200,{20051,21385,21350,21355,21410,21445,22216,23965,}},
{"Brilliant Titansteel","","Trial of the Champion",35,30200,{20053,21325,21407,21542,22215,22627,23964,}},

--Trial of the Champion Mail
{"Dark Exile","","Trial of the Champion",68,30200,{20899,21327,21348,21372,21376,22845,21520,22638,}},
{"Grim Visions","","Trial of the Champion",68,30200,{22612,21349,21444,22217,22663,}},

--Trial of the Champion Leather
{"Argent Fanatic","","Trial of the Champion",3592,30200,{21322,21369,21377,21621,22222,22611,22661,22800,}},
{"Snowy Bramable","","Trial of the Champion",3592,30200,{21371,{22662,21381},21619,22207,22637,22802,22807,21420,}},

--Crafted Plate
--Crafted Mail
--Crafted Leather
{"Overcast","","Crafted (WotLK)",3592,30000.3,{20936,{20935,17699},20931,{20933,17882},20939,20938,20932,20934,}},
{"Eviscerator's","","Crafted (WotLK)",3592,30000.3,{20975,{20978,16571},20930,20979,20980,20977,20981,{20976,20910}}},
{"Gorestained","","Crafted (WotLK)",3592,30000,{17643,20898,84536,{16516,17897},20884,17755,20705,}},
--Crafted Cloth

--Dungeon Plate
{"Frozen Granite","","Dungeon (WotLK)",35,30000.2,{24374,24375,24377,24391,24403,24417,24424,24426,}},
{"Lost Reliquary","","Dungeon (WotLK)",35,30000.2,{24364,24371,24385,24393,24428,}},

--Dungeon Mail
{"Spirit Shock","","Dungeon (WotLK)",68,30000.2,{24367,24378,24624,24388,24400,24411,103143,103144,}},
{"Spurned Val'kyr","","Dungeon (WotLK)",68,30000.2,{24387,24394,24398,24405,24410,24634,24675,24681,}},

--Dungeon Leather
{"Black Betrayal","","Dungeon (WotLK)",3592,30000.2,{24671,24617,24649,24654,24678,24683,103139,103140,}},
{"Cheating Heart","","Dungeon (WotLK)",3592,30000.2,{24366,24404,24622,24689,}},
{"Blackened Geist","","Dungeon (WotLK)",3592,30000.2,{24365,24383,24392,24412,24415,}},

--Dungeon Cloth
{"Remorse","","Dungeon (WotLK)",400,30000.2,{24368,24609,24651,24676,24687,}},
{"Palebone","","Dungeon (WotLK)",400,30000.2,{24376,24396,24399,24408,}},
--{"Salt and Fire","","Dungeon (WotLK)",400,30002,{24423,24402,24648,24427,24382,}},

--Leveling Plate
{"Coldrock","","Leveling (WotLK)(Set 1)",35,30000,{17066,17064,17065,17067,17068,17069,17070,17071,}},
{"Baleheim","","Leveling (WotLK)(Set 1)",35,30000,{17077,17074,17073,17079,17072,17075,17076,17078,}},
{"Westguard","","Leveling (WotLK)(Set 1)",35,30000,{17060,17057,17056,17059,17062,17058,17061,17063,}},

{"Forlorn","","Leveling (WotLK)(Set 2)",35,30000,{16525,16529,16537,16563,17573,17951,18032,18704,}},
{"Ornamented","","Leveling (WotLK)(Set 2)",35,30000,{16579,16595,17645,17720,17763,17780,18474,18480,}},
{"Reanimated","","Leveling (WotLK)(Set 2)",35,30000,{17570,16538,16539,16543,16561,16567,17503,17904,}},
{"Bonegrinder","","Leveling (WotLK)(Set 2)",35,30000,{16548,16574,16576,17893,17580,17670,17906,18025,}},

{"Magnataur","","Leveling (WotLK)(Set 3)",35,30000,{17128,17129,17130,17131,17132,17133,17134,17135,}},
{"Frostpaw","","Leveling (WotLK)(Set 3)",35,30000,{17122,17120,17121,17123,17124,17125,17126,17127,}},
{"Kraken","","Leveling (WotLK)(Set 3)",35,30000,{17141,17142,17136,17137,17138,17139,17140,17143,}},
{"Golem","","Leveling (WotLK)(Set 3)",35,30000,{17149,17144,17145,17146,17147,17148,17150,17151,}},

--Leveling Mail
{"Njord","","Leveling (WotLK)(Set 1)",68,30000,{16953,16956,16954,16952,{16955,17797},16957,16958,16959,}},
{"Garmaul","","Leveling (WotLK)(Set 1)",68,30000,{16949,16944,16946,16950,16945,16947,16948,16951,}},
{"Nerubian","","Leveling (WotLK)(Set 1)",68,30000,{18411,18410,18409,18408,18420,18407,18412,18416,}},
{"Tundrastrider","","Leveling (WotLK)(Set 1)",68,30000,{16534,17486,17796,17805,18010,18182,19098,19131,}},

{"Swiftarrow","","Leveling (WotLK)(Set 2)",68,30000,{20984,20982,20983,20986,20987,20989,20985,20988,}},
{"Forgotten Captain","","Leveling (WotLK)(Set 2)",68,30000,{16517,16645,16673,17521,17527,17599,18179,19018,}},
{"Mammoth","","Leveling (WotLK)(Set 2)",68,30000,{17008,17009,17010,{17011,18875},17012,17013,17014,17015,}},
{"Beastsoul","","Leveling (WotLK)(Set 2)",68,30000,{37378,37384,37382,37380,37381,37379,37383,37385,}},
{"Magdun","","Leveling (WotLK)(Set 2)",68,30000,{16680,17583,17601,17673,17815,18013,18879,19158,}},

--Leveling Leather
{"Geist","","Leveling (WotLK)(Set 1)",3592,30000,{16941,16936,16937,16938,16939,16940,16942,16943,}},
{"Wolverine","","Leveling (WotLK)(Set 1)",3592,30000,{16896,16897,16898,16899,16901,16902,16903,}},
{"Pygmy","","Leveling (WotLK)(Set 1)",3592,30000,{16912,16913,16914,16915,16917,16918,16919,16916,}},
{"Wendigo","","Leveling (WotLK)(Set 1)",3592,30000,{16920,16921,{16922,18158},16923,16925,16926,16927,16924,}},

{"Assailant","","Leveling (WotLK)(Set 2)",3592,30000,{16518,16583,18702,18708,21452,}},
{"Cosmos","","Leveling (WotLK)(Set 2)",3592,30000,{{16594,17672},17995,17999,18001,18057,18486,}},
{"Dark Iceborne","","Leveling (WotLK)(Set 2)",3592,30000,{{21510,17595},17609,{21511,17684},17969,}},

{"Riplash","","Leveling (WotLK)(Set 3)",3592,30000,{16852,16850,16848,16849,16851,16853,16854,16855,}},
{"Daggercap","","Leveling (WotLK)(Set 3)",3592,30000,{16835,16833,16836,16837,16838,16834,16832,16839,}},
{"Wildevar","","Leveling (WotLK)(Set 3)",3592,30000,{16858,16856,16857,16859,16860,16861,16862,16863,}},
{"Vileprey","","Leveling (WotLK)(Set 3)",3592,30000,{16872,16873,16874,16875,16876,16877,16878,16879,}},
{"Taunka","","Leveling (WotLK)(Set 3)",3592,30000,{16880,16881,16882,16883,16884,16885,16886,16887,}},

{"Footman","","Leveling (WotLK)(Set 4)",3592,30000,{2241,26784,696,191,25929,}},
{"Sailor's","","Leveling (WotLK)(Set 4)",3592,30000,{961,25935,25934,25931,25894,25897,}},
{"Scavenger","","Leveling (WotLK)(Set 4)",3592,30000,{4275,644,1158,25882,26124,26128,}},
{"Dwarven","","Leveling (WotLK)(Set 4)",3592,30000,{25879,25876,36,2275,2274,}},

--Leveling Cloth
{"Oracle","","Leveling (WotLK)(Set 1)",400,30000,{16793,16792,{16794,20160},16795,16796,16797,16798,16799,}},
{"Scholar","","Leveling (WotLK)(Set 1)",400,30000,{17505,16598,17501,17758,17916,17930,17950,21178,}},
{"Dreadsoul","","Leveling (WotLK)(Set 1)",400,30000,{37214,21192,37215,37217,37219,37218,37216,37213,}},
{"Seraphic","","Leveling (WotLK)(Set 1)",400,30000,{37230,37232,37233,37228,37229,37231,37234,37235,}},
{"Vizier","","Leveling (WotLK)(Set 1)",400,30000,{16816,16817,16818,16819,16820,16821,16822,16823,}},

{"Farshire","","Leveling (WotLK)(Set 2)",400,30000,{16724,16723,{16722,16653},16725,16721,16720,16727,16726,}},
{"Frostwoven","","Leveling (WotLK)(Set 2)",400,30000,{{20059,16664},20062,20064,20061,17481,17513,21394,20057,}},
{"Bloodspore","","Leveling (WotLK)(Set 2)",400,30000,{{16733,17716},16734,16728,16729,{16730,18123},16731,16732,16735,}},
{"Sweltering","","Leveling (WotLK)(Set 2)",400,30000,{17676,17667,17675,{17678,17532},17680,17705,18095,20069,}},

--Wrath Pre-Patch
{"Undead Slaying","","Pre-Patch (WotLK)",35,29999,{20840,20841,20843,20842,}},
{"Undead Slaying","","Pre-Patch (WotLK)",68,29999,{12009,20852,20843,11958,}},
{"Undead Slaying","","Pre-Patch (WotLK)",3592,29999,{20849,20848,20843,20850,}},
{"Undead Cleansing","","Pre-Patch (WotLK)",400,29999,{12071,20844,20847,20845,}},
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
{720,25034,24955}, --25man Normal ICC Mage alt robe texture
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