local app = select(2,...);

local expansionID = 6;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Argus Plate
{"World-Defiler's","","Argus",35,70300,{90698,90699,90700,90701,90702,90703,90704,90705,}},

{"Praetorium Guard's","","Argus",35,70300,{90594,90595,90596,90597,90598,90599,90600,90601,}},
{"Garothi","","Argus",35,70300,{89211,89214,89325,89212,89216,89215,89213,89210,89217,}},

{"Triumvirate High Guard's","","Argus",35,70300,{90916,90917,90918,90919,90920,90921,90922,90923,}},
{"Sha'tari Defense","","Argus",35,70300,{67082,67083,67084,67085,67086,67087,67088,67089,}},
{"Mac'Aree Lightseeker's","","Argus",35,70300,{90907,90908,90909,90910,90911,90912,90913,90914,}},

--Argus Mail
--Argus Leather
{"Stygian","","Argus",3592,70300,{89218,89219,89220,89221,89222,89223,89224,89225,}},

--Argus Cloth
{"Zealous Felslinger","","Argus",400,70300,{90687,90688,90689,90690,90691,90692,90693,90694,}},

{"Doomsinger","","Argus",400,70300,{89234,89235,89236,89237,89238,89239,89240,89241,}},

{"Augari Wakener's","","Argus",400,70300,{90817,90818,90819,90820,90821,90822,90823,90824,}},
{"Forgotten Conservatory","","Argus",400,70300,{90809,90810,90811,90812,90826,90814,90815,90816,}},

--Broken Shore (Plate)
{"Petrified Hust","","Broken Shore",35,70201,{84624,84626,84628,84630,84632,84634,84636,86448,}},
{"Xorothian","","Broken Shore",35,70201,{85971,85972,85973,85974,85975,85976,85977,85978,}},
{"Moonshatter","","Broken Shore",35,70201,{86013,86014,86015,86016,86017,86018,86019,86020,}},
--Broken Shore (Mail)
{"Burning Chain","","Broken Shore",68,70201,{84612,84614,84616,84618,84638,84620,84622,86450,}},
{"Ered'ruin","","Broken Shore",68,70201,{85988,85989,85990,85991,85992,85993,85994,85995,}},
{"Shinebreaker","","Broken Shore",68,70201,{86030,86031,86032,86033,86034,86035,86036,86037,}},
--Broken Shore (Leather)
{"Netherfiend","","Broken Shore",3592,70201,{85980,85981,85982,85983,85984,85985,85986,85987,}},
{"Lunarblight","","Broken Shore",3592,70201,{86022,86023,86024,86025,86026,86027,86028,86029,}},
{"Creeping Shadows","","Broken Shore",3592,70201,{84598,84600,84602,84604,84606,84608,84610,86452,}},
--Broken Shore (Cloth)
{"Inquisitor's","","Broken Shore",400,70201,{84582,84584,84586,84588,84590,84592,84594,86454,}},
{"Riven","","Broken Shore",400,70201,{86039,86038,86040,86041,86042,86043,86044,86045,}},
{"Vileweave","","Broken Shore",400,70201,{85996,85997,85998,85999,86000,86001,86002,86003,}},

--Illidari
{"Illidari","","Illidari",2048,70001,{76664,76665,76667,76668,76669,76670,76671,}},
{"Illidari","","Illidari",2048,70001,{60974,73967,60973,60970,60972,60971,60966,}},
{"Illidari Supremacy","","Illidari",2048,70001,{73775,73776,73777,73778,73779,73780,73781,80339,}},
{"Illidari Supremacy","","Illidari",2048,70001,{76657,76658,76659,76660,76661,76662,76663,82923,}},

--Dungeon Plate
{"Fallen Kings","","Dungeon (Legion)",35,70001,{76866,76867,76868,76869,76912,78915,78924,76870,}},
{"Duskwatch Guard","","Dungeon (Legion)",35,70001,{79936,79938,79942,79939,79935,79941,79937,79946,}},
--Dungeon Mail
{"Thunderfused Val'kyr","","Dungeon (Legion)",68,70001,{76860,76861,76863,76911,76928,78984,78937,79099,}},
{"Twisted Revelation","","Dungeon (Legion)",68,70001,{80130,80117,80114,80173,80127,80121,80120,80115,}},
--Dungeon Leather
{"Ashen Satyr","","Dungeon (Legion)",3592,70001,{76853,78922,76855,76856,76858,78909,78950,76859,}},
{"Vile Defiance","","Dungeon (Legion)",3592,70001,{80057,80059,80054,80060,80056,80080,80073,80062,}},
--Dungeon Cloth
{"Shadewalker","","Dungeon (Legion)",400,70001,{76846,76847,76848,{76849,78949},76851,78987,79031,76852,}},
{"Swirling Runes","","Dungeon (Legion)",400,70001,{80013,80018,{79997,80034},80000,79995,79999,79996,79994,}},

--Crafted Plate
{"Leystone","","Crafted (Legion)",35,70001,{80888,80890,80885,80892,80887,80891,80889,80886,}},
--Crafted Mail
{"Battlebound","","Crafted (Legion)",68,70001,{80880,80882,80877,80884,80879,80883,80881,80878,}},
--Crafted Leather
{"Warhide","","Crafted (Legion)",3592,70001,{80872,80874,80869,80876,80871,80875,80873,80870,}},
--Crafted Cloth
{"Silkweave","","Crafted (Legion)",400,70001,{80864,80866,80861,80868,80863,80867,80865,80862,}},

--Leveling Plate
{"Demonsteel","","Leveling (Legion)(Set 1)",35,70000.5,{80856,80858,80853,80860,80855,80859,80857,80854,}},
{"Jandvik","","Leveling (Legion)(Set 1)",35,70000.5,{68376,68377,68378,68379,68380,68381,68382,68383,}},
{"Wardbreaker","","Leveling (Legion)(Set 1)",35,70000.5,{78592,78593,78594,78595,78596,78597,78598,78599,}},
{"Obligation","","Leveling (Legion)(Set 1)",35,70001,{83049,83050,83051,83052,83053,83054,83055,83056,}},

{"Ettinbone","","Leveling (Legion)(Set 2)",35,70000.5,{68217,68218,68219,68220,68221,68222,68223,68224,}},
{"Kal'delar","","Leveling (Legion)(Set 2)",35,70000.5,{68323,68324,68325,68326,68327,68328,68329,68330,}},
{"Valarsmidd","","Leveling (Legion)(Set 2)",35,70000.5,{68270,68271,68272,68273,68274,68275,68276,68277,}},
{"Rhut'van","","Leveling (Legion)(Set 2)",35,70000.5,{68164,68165,68166,68167,68168,68169,68170,68171,}},

--Leveling Mail
{"Warpwind","","Leveling (Legion)(Set 1)",68,70000.5,{68413,68414,68415,68416,68417,68418,68419,68420,}},
{"Gravenscale","","Leveling (Legion)(Set 1)",68,70000.5,{80848,80850,80845,80852,80847,80851,80849,80846,}},
{"Vilescale","","Leveling (Legion)(Set 1)",68,70000.5,{68466,68467,68468,68469,68470,68471,68472,68473,}},
{"Warped Intuition","","Leveling (Legion)(Set 1)",68,70001,{83082,83042,83043,83044,83045,83046,83047,83048,}},

{"Dreadroot","","Leveling (Legion)(Set 2)",68,70000.5,{68360,68361,68362,68363,68364,68365,68366,68367,}},
{"Hillstride","","Leveling (Legion)(Set 2)",68,70000.5,{68254,68255,68256,68257,68258,68259,68260,68261,}},
{"Faronaar Chain","","Leveling (Legion)(Set 2)",68,70000.5,{68201,68202,68203,68204,68205,68206,68207,68208,}},
{"Valdisdall","","Leveling (Legion)(Set 2)",68,70000.5,{68307,68308,68309,68310,68311,68312,68313,68314,}},

--Leveling Leather
{"Tranquil Bough","","Leveling (Legion)(Set 1)",3592,70000.5,{80411,80412,80413,80414,80415,80416,80417,80418,}},
{"Ambervale","","Leveling (Legion)(Set 1)",3592,70000.5,{68390,68391,68392,68393,68394,{68395,81347},68396,68397,}},
{"Dreadleather","","Leveling (Legion)(Set 1)",3592,70000.5,{80840,80842,80837,80844,80839,80843,80841,80838,}},

{"Llothien","","Leveling (Legion)(Set 2)",3592,70000.5,{68179,68180,68181,68182,68183,68184,68185,68178,}},
{"Smolderhide","","Leveling (Legion)(Set 2)",3592,70000.5,{68338,68339,68340,68341,68342,68343,68344,68337,}},
{"Icepine","","Leveling (Legion)(Set 2)",3592,70000.5,{68231,68232,68233,68234,68235,68236,68237,68238,}},
{"Haustvelt","","Leveling (Legion)(Set 2)",3592,70000.5,{68284,68285,68286,68287,68288,68289,68290,68291,}},

--Leveling Cloth
{"Imbued Silkweave","","Leveling (Legion)(Set 1)",400,70000.5,{80832,80834,80829,80836,80831,80835,80833,80830,}},
{"Moonfall","","Leveling (Legion)(Set 1)",400,70000.5,{68421,68422,68423,68424,68425,68426,68427,68428,}},
{"Terrorweave","","Leveling (Legion)(Set 1)",400,70000.5,{68474,68475,68476,68477,68478,68479,68480,68481,}},
{"Wicked Modesty","","Leveling (Legion)(Set 1)",400,70001,{83025,83026,83027,83028,83029,83030,83031,83032,}},

{"Temporal Scholar's","","Leveling (Legion)(Set 2)",400,70000.5,{68209,68210,68211,68212,68213,68214,68215,68216,}},
{"Hagfeather","","Leveling (Legion)(Set 2)",400,70000.5,{68262,68263,68264,68265,68266,68267,68268,68269,}},
{"Hrydshal","","Leveling (Legion)(Set 2)",400,70000.5,{68315,68316,68317,68318,68319,68320,68321,68322,}},
{"Crescent Vale","","Leveling (Legion)(Set 2)",400,70000.5,{68368,68369,68370,68371,68372,68373,68374,68375,}},
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
{1469,89366,89232}, --Seat of the Triumvirate, Mail, Chest/Robe

{936,81072,81901}, --Nighthold, Mail/Shaman, Chest/Robe (LFR)
{935,79882,81900}, --Nighthold, Mail/Shaman, Chest/Robe (Mythic)
{933,79880,81898}, --Nighthold, Mail/Shaman, Chest/Robe (Normal)
{934,79881,81899}, --Nighthold, Mail/Shaman, Chest/Robe (Heroic)

{978,79892,113019}, --Nighthold, Plate/Paladin, Chest/Robe (Normal)


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