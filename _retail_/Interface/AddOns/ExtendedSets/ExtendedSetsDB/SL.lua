local app = select(2,...);

local expansionID = 8;

--Name, Description, Label, classMask, patchID, sources, requiredFact, noLongerObtainable
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--69749

--Zereth Mortis Sets (Plate) --57140
{"Enduring Protector's","","Zereth Mortis",35,90200,{168135,168139,168129,168141,168137,168131,168143,168133,168116}},
{"Sandworn","","Zereth Mortis",35,90200,{168449,168454,168451,168456,168499,168455,168452,168450,168453}},
{"Harmonium","","Zereth Mortis",35,90200,{165422,165427,165423,165428,165426,165424,165429,165425,165445,}},
{"Numerus","","Zereth Mortis",35,90200,{168444,168446,168441,168447,168445,168442,168448,168443,169129}},
----Zereth Mortis Sets (Mail) --57197
{"Bound Guardian","","Zereth Mortis",68,90200,{168119,168123,168111,168125,168121,168113,168127,168117,168150,}},
{"Sandworn","","Zereth Mortis",68,90200,{168486,168488,168483,168489,168487,168484,168490,168485,169132,}},
{"Anthemic","","Zereth Mortis",68,90200,{165417,165419,165414,165420,165418,165415,165421,165416,}},
{"Enigmatic","","Zereth Mortis",68,90200,{168436,168438,168433,168439,168437,168434,168440,168435,168838,}},
----Zereth Mortis Sets (Leather) --56832
{"Boundless Chaos","","Zereth Mortis",3592,90200,{168101,168105,168095,168107,168103,168097,168109,168099,168149,}},
{"Sandworn","","Zereth Mortis",3592,90200,{168469,168474,168473,168471,168470,168467,168472,168468,169131,}},
{"Staccato","","Zereth Mortis",3592,90200,{165410,165431,165430,165412,165411,165408,165413,165409,}},
{"Cryptic","","Zereth Mortis",3592,90200,{168428,168430,168425,168431,168429,168426,168432,168427,169128,}},
----Zereth Mortis Sets (Cloth) --56674
{"Choral","","Zereth Mortis",400,90200,{165404,165432,165401,165406,165405,165402,165407,165403,}},
{"Hapless Traveler's","","Zereth Mortis",400,90200,{168085,168089,168079,168091,168087,168081,168093,168115,168083}},
{"Sandworn","","Zereth Mortis",400,90200,{168811,168815,168808,168813,168812,168809,168814,168810,169130,}},
{"Oracular","","Zereth Mortis",400,90200,{168420,168422,168417,168423,168421,168418,168424,168419,169127}},

--Old Night fae mail beta set.
--{"Ardenweald Covenant Mail 1","Old Shadowlands Beta Set that was never used.","Unused Night Fae Mail Set",68,90001,{112637,112635,112640,112634,112636,112639,112633,112638,112415,},nil,true},
--{"Ardenweald Covenant Mail 2","Old Shadowlands Beta Set that was never used.","Unused Night Fae Mail Set",68,90001,{112619,112624,112618,112620,112623,112617,112622,112413,112612},nil,true},
--{"Ardenweald Covenant Mail 3","Old Shadowlands Beta Set that was never used.","Unused Night Fae Mail Set",68,90001,{112629,112627,112632,112626,112628,112631,112630,112414,112625,},nil,true},
--{"Ardenweald Covenant Mail 4","Old Shadowlands Beta Set that was never used.","Unused Night Fae Mail Set",68,90001,{112612,112614,112609,112615,112613,112610,112616,112611,112404,},nil,true},

--9.1.5 New Starter (Non-Transmoggable) Sets (Plate)
{"Paladin's Starter","Given when creating a pre-Cata Race Paladin.","Starter",35,90105,{165330,165334,165331,165335,165333,165332,},nil,true},
{"Warrior's Starter","Given when creating a pre-Cata Race Warrior.","Starter",35,90105,{165341,165338,165337,165336,165340,165339,},nil,true},
--9.1.5 New Starter (Non-Transmoggable) Sets (Mail)
{"Shaman's Starter","Given when creating a pre-Cata Race Shaman.","Starter",68,90105,{165324,165329,165325,165328,165327,165326,},nil,true},
{"Hunter's Starter","Given when creating a pre-Cata Race Hunter.","Starter",68,90105,{165320,165321,165318,165319,165322,165323,},nil,true},
--9.1.5 New Starter (Non-Transmoggable) Sets (Leather)
{"Druid's Starter","Given when creating a pre-Cata Race Druid.","Starter",3592,90105,{165366,165365,165367,165369,165368,},nil,true},
{"Rogue's Starter","Given when creating a pre-Cata Race Rogue.","Starter",3592,90105,{165363,165362,165360,165361,165364,},nil,true},
--9.1.5 New Starter (Non-Transmoggable) Sets (Cloth)
{"Warlock's Starter","Given when creating a pre-Cata Race Warlock.","Starter",400,90105,{165342,165347,165343,165346,165345,165344,},nil,true},
{"Priest's Starter","Given when creating a pre-Cata Race Priest.","Starter",400,90105,{165358,165357,165355,165356,165354,165359,},nil,true},
{"Mage's Starter","Given when creating a pre-Cata Race Mage.","Starter",400,90105,{165352,165351,165349,165350,165348,165353,},nil,true},

--9.1.5 Mage Tower (Plate)(Paladin,DK,Warrior)
{"Radiant Lightbringer","","Mage Tower",2,90105,{165869,165871,165865,165872,165870,165867,165873,165868,165866,}},
{"Gravewarden","","Mage Tower",32,90105,{165827,165829,165823,165830,165828,165826,165943,165824,165825}},
{"Titanic Onslaught","","Mage Tower",1,90105,{165912,165914,165909,165915,165913,165910,165916,165911,165957}},
--9.1.5 Mage Tower (Mail)(Hunter,Shaman)
{"Wildstalker","","Mage Tower",4,90105,{165843,165845,165839,165846,165844,165841,165847,165842,165840,}},
{"Skybreaker","","Mage Tower",64,90105,{165897,165955,{165892,165893},165899,165898,165895,165900,165896,165894,}},
--9.1.5 Mage Tower (Leather)(Rogue,Druid,DH,Monk)
{"Fanged Slayer's","","Mage Tower",8,90105,{165887,165889,165883,165890,165888,165885,165891,165886,165884,}},
{"Stormheart","","Mage Tower",1024,90105,{165834,165836,{165831,165917},165837,165835,165832,165838,165833,165953}},
{"Demonbane","","Mage Tower",2048,90105,{165946,165948,165944,165950,165947,165951,165949,165945,165952,}},
{"Xuen's","","Mage Tower",512,90105,{165860,165862,165857,165863,165861,165858,165864,165859,165954,}},
--9.1.5 Mage Tower (Cloth)(Mage,Priest,Warlock)
{"Arcane Tempest","","Mage Tower",128,90105,{165851,165854,{165853,165918},165855,165852,165849,165856,165850,165848}},
{"Blind Absolution","","Mage Tower",16,90105,{165877,165880,{165879,165919},165881,165878,165875,165882,165876,165874,}},
{"Diabolic","","Mage Tower",256,90105,{165903,165906,{165905,165920},165907,165904,165901,165908,165902,165956}},

--9.1 Dungeon Recolor
{"Vault Guardian's","","Dungeon (SL)",35,90100,{116729,116734,116730,116735,116733,116731,116736,116732,116754,}},
{"Razorwing Scale","","Dungeon (SL)",68,90100,{116724,116726,116721,116727,116725,116722,116728,116723,146644,}},
{"Shardhide Leather","","Dungeon (SL)",3592,90100,{116717,116737,116719,116718,116715,116720,116716,146643,116738}},
{"Korthian Caretaker's","","Dungeon (SL)",400,90100,{116711,116739,116708,116713,116712,116709,116714,116710,146097,}},

--Leveling Sets (Plate)
{"Cruel Executioner's","","Leveling (SL)",35,8,{109106,109090,109095,109119,109092,109111,109114,109100,},nil},
{"Blackthorn","","Leveling (SL)",35,8,{109202,109186,109191,109215,109188,109207,109210,109196,},nil},
{"Ceremonious","","Leveling (SL)",35,8,{115026,115027,115024,115030,115023,115028,115029,115025},nil},
{"Stoneforged","","Leveling (SL)",35,8,{109074,109058,109127,109087,109060,109079,109082,109068,113014,},nil},
{"Judicious Aspirant's","","Leveling (SL)",35,8,{107440,107423,107424,107429,107453,107426,107445,107448,107434,},nil},
--Leveling Sets (Mail)
{"Eventide","","Leveling (SL)",68,8,{109204,109200,109193,109216,109189,109209,109212,109198,},nil},
{"Flesh Architect's","","Leveling (SL)",68,8,{109108,109104,109097,109120,109093,109113,109116,109102,},nil},
{"Soul Hunter's","","Leveling (SL)",68,8,{109076,109072,109129,109088,109061,109081,109084,109070,},nil},
{"Humble Aspirant's","","Leveling (SL)",68,8,{107442,107438,107431,107454,107427,107447,107450,107436,},nil},
{"Desolate Scale","","Leveling (SL)",68,8,{106657,106656,106654,106660,106653,106658,106659,106655,},nil},
--Leveling Sets (Leather)
{"Nightcloaked","","Leveling (SL)",3592,8,{109077,113012,107432,109089,109062,109078,109085,109067,},nil},
{"Deceitful Agent's","","Leveling (SL)",3592,8,{109105,109109,109098,109121,109094,109110,109117,109099,},nil},
{"Duskthistle","","Leveling (SL)",3592,8,{109201,109205,109194,109217,109190,109206,109213,109195,},nil},
{"Darkfeather","","Leveling (SL)",3592,8,{110283,110287,114242,110276,110272,110288,110295,110277,},nil},
{"Desolate","","Leveling (SL)",3592,8,{106608,106609,106588,106612,106739,106610,106611,106607,},nil},
--Leveling Sets (Cloth)
{"Epidemiologist's","","Leveling (SL)",400,8,{109107,109103,109349,109096,109118,109091,109112,109115,109101,},nil},
{"Shimmerbough","","Leveling (SL)",400,8,{109203,109199,109353,109296,109214,109187,109208,109211,109197,},nil},
{"Shrouded Cloth","","Leveling (SL)",400,8,{107362,107361,107358,107359,107365,107357,107363,107364,107360,},nil},
{"Pained Absolution","","Leveling (SL)",400,8,{109075,109071,109128,109086,{109059,112699},109080,109083,109069,110991},nil},
{"Pure Aspirant's","","Leveling (SL)",400,8,{107441,107437,107430,107452,107425,110290,107449,107435,114245},nil},

--Dungeon Sets (Plate)
{"Shadowsteel","","Dungeon (SL)",35,8,{106010,106009,106007,106013,106006,106011,106012,106008,},nil},
{"Rushing Juggernaut","","Dungeon (SL)",35,8,{111522,111516,111536,111545,111518,111524,111542,111540,},nil},
{"Unholy Frenzy","","Dungeon (SL)",35,8,{111464,111494,112878,112890,112876,111472,111460,112881,},nil},
{"Galvanized Oxxein","","Dungeon (SL)",35,8,{111508,111490,111491,111515,111501,111510,111586,111492,},nil},
{"Fogweaver","","Dungeon (SL)",35,8,{111449,111657,111670,111663,111448,111647,111450,116656},nil},
--Dungeon Sets (Mail)
{"Shadowscale","","Dungeon (SL)",68,8,{106673,106672,106670,106676,106669,106674,106675,106671,},nil},
{"Tortured Assistant's","","Dungeon (SL)",68,8,{111484,111507,111504,111488,111502,111486,106675,111506,},nil},
{"Soaring Decimator's","","Dungeon (SL)",68,8,{111539,111520,111530,111546,111519,111525,111543,111541,},nil},
{"Rattling Deadeye","","Dungeon (SL)",68,8,{111495,111463,111469,112891,112877,111459,112887,112882,},nil},
{"Waning Shadow","","Dungeon (SL)",68,8,{111656,111662,111446,111669,111444,111445,111646,113597,},nil},
--Dungeon Sets (Leather)
{"Primeval Soul's","","Dungeon (SL)",3592,8,{111645,111579,111668,111582,111580,111661,111581,111655,},nil},
{"Dark Devotion","","Dungeon (SL)",3592,8,{111523,111521,111537,111547,111535,111555,111527,111532,},nil},
{"Shadebound","","Dungeon (SL)",3592,8,{106625,106624,106622,106628,106621,106626,106627,106623,},nil},
{"Obscure Rituals","","Dungeon (SL)",3592,8,{111509,111482,111505,111588,111503,111485,111513,111479,},nil},
{"Undying Chill","","Dungeon (SL)",3592,8,{112885,112883,111457,111466,111468,111496,112888,112880,},nil},
--Dungeon Sets (Cloth)
{"Shadowlace","","Dungeon (SL)",400,8,{107380,107379,107376,107377,107383,107375,107381,107382,107378,},nil},
{"Devoted General","","Dungeon (SL)",400,8,{111538,111557,111531,111544,111517,111556,111526,111533,146642},nil},
{"Exquisite Acquisitions","","Dungeon (SL)",400,8,{111667,111439,111643,111441,111654,111440,111660,111442,111666},nil},
{"Erudite Scholar","","Dungeon (SL)",400,8,{111483,111481,111478,111514,111500,111511,111512,111585,},nil},
--Pre-patch Plate
{"Argent Conscript's","","Pre-Patch (SL)",35,7.9,{114722,114839,114830,114824,114836,114833,114827,114842,114683,},"Horde"},
{"Argent Conscript's","","Pre-Patch (SL)",35,7.9,{114710,114773,114764,114758,114770,114767,114761,114776,114755,},"Alliance"},
--Pre-patch Mail
{"Argent Conscript's","","Pre-Patch (SL)",68,7.9,{114719,114818,114812,114806,114665,114815,114810,114821,114686,},"Horde"},
{"Argent Conscript's","","Pre-Patch (SL)",68,7.9,{114707,114749,114740,114737,114746,114743,114647,114752,114656,},"Alliance"},
--Pre-patch Leather
{"Argent Conscript's","","Pre-Patch (SL)",3592,7.9,{114716,114800,114794,114791,114668,114797,114677,114803,114689,},"Horde"},
{"Argent Conscript's","","Pre-Patch (SL)",3592,7.9,{114704,114731,114728,114725,114635,114641,114650,114734,114659,},"Alliance"},
--Pre-patch Cloth
{"Argent Conscript's","","Pre-Patch (SL)",400,7.9,{114713,114785,114674,114779,114671,114782,114662,114788,114680,},"Horde"},
{"Argent Conscript's","","Pre-Patch (SL)",400,7.9,{114629,114698,114644,114692,114638,114695,114632,114701,114653,},"Alliance"},
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
{2391,166170,167953}, --Sepulcher of the First Ones, Priest, Chest/Robe (LFR)
{2390,166169,167952}, --Sepulcher of the First Ones, Priest, Chest/Robe (Normal)
{2392,166171,167954}, --Sepulcher of the First Ones, Priest, Chest/Robe (Heroic) --Heroic chest missing :(
{2393,166172,167955}, --Sepulcher of the First Ones, Priest, Chest/Robe (Mythic)

--44268
{2209,115998,115990}, --Kyrian, Devoted Aspirant's Chest/Robe
{2208,115999,115982}, --Kyrian, Aspiring Aspirant's Chest/Robe
{2207,116000,115974}, --Kyrian, Forsworn Aspirant's Chest/Robe
{2206,115966,116001}, --Kyrian, Battlefield Aspirant's Chest/Robe

{2159,115105,115109}, --Castle Nathria, Cloth, Depraved Beguiler's Chest/Robe (RF)
{2158,114499,114511}, --Castle Nathria, Cloth, Depraved Beguiler's Chest/Robe (Normal)
{2160,115106,115110}, --Castle Nathria, Cloth, Depraved Beguiler's Chest/Robe (Heroic)
{2161,115131,115133}, --Castle Nathria, Cloth, Depraved Beguiler's Chest/Robe (Mythic)

{2058,113820,113839}, --Night Fae, Mail, Winterborn Chest/Robe
{2057,113828,113837}, --Night Fae, Mail, Night Courtier's Chest/Robe
{2056,113836,113840}, --Night Fae, Mail, Conservator's Chest/Robe
{2055,113805,113841}, --Night Fae, Mail, Runewarden's Chest/Robe

{2050,112438,112442}, --Night Fae, Cloth, Winterborn Chest/Robe
{2048,112436,112440}, --Night Fae, Cloth, Night Courtier's Chest/Robe
{2049,112437,112441}, --Night Fae, Cloth, Conservator's Chest/Robe
{2047,109219,112439}, --Night Fae, Cloth, Faewoven Chest/Robe

{2053,112575,112557}, --Night Fae, Leather, Winterborn Chest/Robe
{2054,112574,112556}, --Night Fae, Leather, Night Courtier's Chest/Robe
{2052,112573,112555}, --Night Fae, Leather, Conservator's Chest/Robe
{2051,112554,112545}, --Night Fae, Leather, Oakheart Chest/Robe

{2482, 169680, 169689},--Fireplume legs
{2482, 169680, 169778},--Fireplume legs
{2482, 169680, 169779},--Fireplume legs
{2482, 169679, 169688},--Fireplume Chest
{2482, 169679, 169782},--Fireplume Chest
{2482, 169681, 169777},--Fireplume Gloves
}

function AddToCollection()
  for i = 1, #db do
    --if (C_TransmogCollection.GetSourceInfo(db[i][6][1])) then --checks if this is an actual set. Only needed for checking sets that are only viewable on the ptr but not yet live.
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
    --end
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