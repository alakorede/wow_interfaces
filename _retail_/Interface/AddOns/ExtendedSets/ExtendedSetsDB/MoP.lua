local app = select(2,...);

local expansionID = 4;

--Name, Description, Label, classMask, patchID, sources, requiredFact
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth
local db = {
--MoP: Remix --start 91045
--{"test","test","test",0,50000,{55775}},

--Alt Dungeon Cloth Set
{"Koegler","","Dungeon Alt (MoP)",400,50002.5,{45671,45679,45694,45703,45708,45719,}},

--Cloth pandaren set
{"Trainee's","","Pandaren",400,50000,{36895,36894,39119,39104}},
};

--Used to add alternate appearances to blizzard sets
--SetID, OriginalSourceID, AlternateApperanceID
local altAppearancesDB = {
{421,52387,61896}, --Siege of Orgrimmar, Mail/Shaman, Chest/Robe (Normal)
{422,52632,61898}, --Siege of Orgrimmar, Mail/Shaman, Chest/Robe (Mythic)
{423,52273,61897}, --Siege of Orgrimmar, Mail/Shaman, Chest/Robe (LFR)

{557,52453,57092}, --Siege of Orgrimmar, Leather/Druid, Chest/Robe (Normal)

{425,51060,51055}, --Throne of Thunder, Mail/Shaman, Chest/Robe (Heroic)
{424,50062,50057}, --Throne of Thunder, Mail/Shaman, Chest/Robe (Normal)
{426,50436,50431}, --Throne of Thunder, Mail/Shaman, Chest/Robe (LFR)

{510,50015,49631}, --Throne of Thunder, Leather/Monk, Chest/Robe (Normal)
{512,50389,50218}, --Throne of Thunder, Leather/Monk, Chest/Robe (LFR)
{511,51013,50842}, --Throne of Thunder, Leather/Monk, Chest/Robe (Heroic)

{338,44975,44970}, --Heart of Fear, Mail/Shaman, Chest/Robe (Heroic)
{427,43647,46990}, --Heart of Fear, Mail/Shaman, Chest/Robe (Normal)
{428,44527,44697}, --Heart of Fear, Mail/Shaman, Chest/Robe (LFR)

{579,44556,46685}, --Heart of Fear, Plate/DK, Chest/Robe (LFR)
{578,43676,46992}, --Heart of Fear, Plate/DK, Chest/Robe (Normal)
{580,44780,46654}, --Heart of Fear, Plate/DK, Chest/Robe (Heroic)

{277,43265,47810}, --Season 12, Plate/Paladin, Chest/Robe (Gladiator)
{196,43002,48776}, --Season 12, Plate/Paladin, Chest/Robe (Honor)

{3372,41890,41825}, --MoP: World Cloth 1 (green)
{3365,62542,41841}, --MoP:Dungeon Cloth (original)
{3369,45298,41833}, --MoP:Dungeon Cloth (purple)
{3408,45528,42736}, --Mop:world mail 1 (green/kilt)
}

local altLabelDB = {

}

local altLabelAppendDB = {
[3413] = ' Cosmetic (1)', -- start Cosmetic sets
[3414] = ' Cosmetic (1)',
[3415] = ' Cosmetic (1)',
[3439] = ' Cosmetic (2)',
[3438] = ' Cosmetic (2)',
[3368] = ' Cosmetic (2)',
[3394] = ' Cosmetic (3)',
[3395] = ' Cosmetic (3)',
[3396] = ' Cosmetic (3)',
[3434] = ' Cosmetic (4)',
[3435] = ' Cosmetic (4)',
[3436] = ' Cosmetic (4)',
[3437] = ' Cosmetic (4)',
[3403] = ' Cosmetic (5)',
[3404] = ' Cosmetic (5)',
[3405] = ' Cosmetic (5)',
[3380] = ' Cosmetic (6)',
[3381] = ' Cosmetic (6)', -- end Cosmetic sets
[3423] = ' (1)', --start Plate World Sets
[3424] = ' (1)',
[3425] = ' (1)',
[3426] = ' (2)',
[3427] = ' (2)',
[3428] = ' (2)',
[3429] = ' (2)',
[3430] = ' (3)',
[3431] = ' (3)',
[3432] = ' (3)',
[3433] = ' (3)', --end Plate World sets
[3406] = ' (1)', --start Mail World Sets
[3407] = ' (1)',
[3408] = ' (1)',
[3409] = ' (1)',
[3410] = ' (2)',
[3411] = ' (2)',
[3412] = ' (2)',
[3416] = ' (3)',
[3417] = ' (3)',
[3418] = ' (3)',
[3419] = ' (3)', --end Mail World sets
[3386] = ' (1)', --start Leather World Sets
[3387] = ' (1)',
[3388] = ' (1)',
[3389] = ' (1)',
[3390] = ' (2)',
[3391] = ' (2)',
[3392] = ' (2)',
[3393] = ' (2)',
[3397] = ' (3)',
[3398] = ' (3)',
[3399] = ' (3)', --end Leather World sets
[3371] = ' (1)', --start Cloth World Sets
[3372] = ' (1)',
[3373] = ' (1)',
[3374] = ' (2)',
[3375] = ' (2)',
[3376] = ' (2)',
[3377] = ' (3)',
[3378] = ' (3)',
[3379] = ' (3)', --end Cloth World sets
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
app.altLabelDB[expansionID] = altLabelDB;
app.altLabelAppendDB[expansionID] = altLabelAppendDB;
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