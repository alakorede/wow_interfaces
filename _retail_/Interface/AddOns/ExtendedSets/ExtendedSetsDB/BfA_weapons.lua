local app = select(2,...);

local expansionID = 7;

--Name, Label, Difficulty, patchID, sources, requiredFact, isPvP, noLongerObtainable
----sources(17):
--1) Axe
--2) 2hAxe
--3) Bow
--4) XBow
--5) Dagger
--6) Fist
--7) Gun
--8) Mace
--9) 2hMace
--10) Off-hand
--11) Polearm
--12) Shield
--13) Staff
--14) Sword
--15) 2hSword
--16) Wand
--17) Warglaive

local db = {
--island expedition recolor of mop weapons
{1,100385},--SoO
{1,100308},--ToT
{5,100349},
{8,100326},--ToT
{8,100396},--SoO
{8,100376},--HoF
{10,100379},--HoF
{10,100407},--SoO
{12,100309},--ToT
{12,100314},--ToT
{12,100325},--mogu'shan vaults
{14,100347},--HoF
{14,100405},--HoF
{14,100377},--mantid
{15,100322},--ToT
};

--bfa dungeon maces 19411

function AddToCollection()
  for i = 1, #db do
    local data = {};
    data.name = db[i][1];
    data.label = db[i][2];
    data.difficulty = db[i][3];
    data.patchID = db[i][4];
    data.sources = db[i][5];
    data.requiredFaction = db[i][6];
    data.isPvP = db[i][7];
    data.noLongerObtainable = db[i][8];
    data.favorite = false;
    data.expansionID = expansionID;
    
    data.setID = expansionID * 1000 + (#db - i);
    
    for j=1,#data.sources do
      local _,appID,_,icon = C_TransmogCollection.GetAppearanceSourceInfo(data.sources[j][2])
      local s = C_TransmogCollection.GetAllAppearanceSources(appID);
      local isCollected = false;
      for i=1,#s do
        if C_TransmogCollection.GetSourceInfo(s[i]).isCollected then
          isCollected = true;
          break;
        end
      end
      if not data.icon then data.icon = icon; end
      data.sources[j][3] = isCollected;
      data.sources[j][4] = appID;
    end
    
    app.AddWeaponSetToTables(data);
  end
end

app.WeaponCallbacks[expansionID] = AddToCollection;