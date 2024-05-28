local app = select(2,...);

local expansionID = -1;

--Name, Description, Label, classMask, patchID, sources, xpac (only for Misc.lua), requiredFact, noLongerObtainable
----classMask:    (35=Plate, 68=Mail, 3592=Leather, 400=Cloth)
local db = {
--Explorer's
{"Excavator's","","Explorer's",0,100205,{194953,194955,194956,194957,194954,},9},
{"Renowned Explorer's","Recruit-A-Friend","Explorer's",0,80370,{105946,105944,105945,105951,105949,105950,105959,105953,},9,nil,nil,true},
{"Historian's","","Explorer's",0,100205,{194948,194950,194951,194952,194949,}},

--Holidays
--Midsummer Fire Festival
{"Vestments of Summer","Midsummer Fire Festival","Holiday",0,10000,{9207,16111,16110,38054}},
--Noblegarden
{"Tuxedo","Noblegarden","Holiday",0,10000,{2633,2634,2635,2636,}},
--Brewfest
{"Brewfest Dress","Brewfest","Holiday",0,10000,{15663,15711,}},
{"Brewfest Regalia","Brewfest","Holiday",0,10000,{15662,15665,{15664,15712,15713,15714}}},
--Winter Veil
{"Fine Winter Veil (Red)","Winter Veil","Holiday",0,10000,{80593,80587,80597,{80591,80589},80595,}},
{"Fine Winter Veil (Green)","Winter Veil","Holiday",0,10000,{80594,80588,80598,{80592,80590},80596,}},
{"Winter Veil (Green)","Winter Veil","Holiday",0,10000,{8510,15751,}},
{"Winter Veil (Red)","Winter Veil","Holiday",0,10000,{8509,15749,}},
--Pilgrim's Bounty
{"Pilgrim's Suit","Pilgrim's Bounty","Holiday",0,10000,{22458,22464,21595,}},
{"Pilgrim's Dress","Pilgrim's Bounty","Holiday",0,10000,{21595,21594,}},

--Mariachi themed outfit
{"Haliscan","","Mariachi",0,19999,{18356,18357,18358,2636,},2},
};

local altAppearancesDB = {

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
      data.requiredFaction = db[i][8];
      data.favorite = false;
      data.expansionID = db[i][7];
      if data.expansionID == nil then
        data.expansionID = -1;
      end
      
      if db[i][9] == true then
        data.noLongerObtainable = true;
      end
      
      if db[i][10] then
        data.shop = true;
      end
      
      if db[i][2] == "Trading Post" or db[i][3] == "Trading Post" then
        data.tp = true;
      end
      
      data.setID = (expansionID) * app.SetsFrame.ExpandedID + db[i][6][1];
      
      data.sources = {};
      for j=1,#db[i][6] do 
        if type(db[i][6][j]) == "table" then
          if not data.altSources then data.altSources = {}; data.altSourceNumbers = {}; end
          data.sources[db[i][6][j][1]] = false--C_TransmogCollection.GetSourceInfo(db[i][6][j][1]).isCollected;
          data.altSources[db[i][6][j][1]] = {}
          for k=1,#db[i][6][j] do
            tinsert(data.altSources[db[i][6][j][1]], db[i][6][j][k]);
          end
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

app.ExpandedCallbacks[-1] = AddToCollection;
app.altAppearancesDB[expansionID] = altAppearancesDB;

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