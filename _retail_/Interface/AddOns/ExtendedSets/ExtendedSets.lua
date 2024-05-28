local app = select(2, ...);
local SetsFrame;

local LDD = LibStub('LibDropDown');
local testSources = false;

local ModelFrame;
local setStats = { numberSets = 0, numberCollected = 0 };
local alreadyFilled = false;
local maxGarbage = 4;

--displayFemale = 1
--local displayBools = {displayFemale = 1};
--local defaultSex;
local currentRaceID = 0;
local ExpansionCount = GetClientDisplayExpansionLevel() + 1;

local BaseSets = {};
local BaseSetsPvPFlag = {};
local BaseSetsData = {};
local BaseList = {};
local VariantSets = {};
local VariantSetsIDs = {};
local NotUsedSets = {};
local SetIDForSource = {};
local SetsForTransmogrify = nil;
local SetsForTransmogrifyIndex = nil;
local PendingSetsForTransmogrify = {};
local BaseListLabels = {}

local factionNames = { playerFaction = "", opposingFaction = "" };

local ClassName;
local ClassIndex = nil;
local ClassMaskMap = {
    [1] = {1, 2, 32, 35, 0}, -- Plate Wearer
    [2] = {1, 2, 32, 35, 0}, -- Plate Wearer
    [3] = {4, 64, 68, 0, 4096, 4164},    -- Mail Wearer
    [4] = {8, 512, 1024, 2048, 3592, 0}, -- Leather Wearer
    [5] = {16, 128, 256, 400, 0}, -- Cloth Wearer
    [6] = {1, 2, 32, 35, 0}, -- Plate Wearer
    [7] = {4, 64, 68, 0, 4096, 4164},    -- Mail Wearer
    [8] = {16, 128, 256, 400, 0}, -- Cloth Wearer
    [9] = {16, 128, 256, 400, 0}, -- Cloth Wearer
    [10] = {8, 512, 1024, 2048, 3592, 0}, -- Leather Wearer
    [11] = {8, 512, 1024, 2048, 3592, 0}, -- Leather Wearer
    [12] = {8, 512, 1024, 2048, 3592, 0}, -- Leather Wearer
    [13] = {4, 64, 68, 0, 4096, 4164},    -- Mail Wearer
}
local ClassNameMask = {
    [1] = "Warrior",
    [2] = "Paladin",
    [4] = "Hunter",
    [8] = "Rogue",
    [16] = "Priest",
    [32] = "Death Knight",
    [64] = "Shaman",
    [128] = "Mage",
    [256] = "Warlock",
    [512]  = "Monk",
    [1024] = "Druid",
    [2048] = "Demon Hunter",
    [4096] = "Evoker",
}
local ClassNameLookupMask = {
    [1] = "WARRIOR",
    [2] = "PALADIN",
    [4] = "HUNTER",
    [8] = "ROGUE",
    [16] = "PRIEST",
    [32] = "DEATHKNIGHT",
    [64] = "SHAMAN",
    [128] = "MAGE",
    [256] = "WARLOCK",
    [512] = "MONK",
    [1024] = "DRUID",
    [2048] = "DEMONHUNTER",
    [4096] = "EVOKER",
}
local ClassToMask = {
    [1] = 1,
    [2] = 2,
    [3] = 4,
    [4] = 8,
    [5] = 16,
    [6] = 32,
    [7] = 64,
    [8] = 128,
    [9] = 256,
    [10] = 512,
    [11] = 1024,
    [12] = 2048,
    [13] = 4096,
}
local ClassArmorType = {
    [1]  = 4, --[1]  = 1, --[1] =    
    [2]  = 4, --[2]  = 1, --[2] =    
    [3]  = 3, --[3]  = 2, --[4] =    
    [4]  = 2, --[4]  = 3, --[8] =    
    [5]  = 1, --[5]  = 4, --[16] =   
    [6]  = 4, --[6]  = 1, --[32] =   
    [7]  = 3, --[7]  = 2, --[64] =   
    [8]  = 1, --[8]  = 4, --[128] =  
    [9]  = 1, --[9]  = 4, --[256] =  
    [10] = 2, --[10] = 3, --[512] =  
    [11] = 2, --[11] = 3, --[1024] = 
    [12] = 2, --[12] = 3, --[2048] = 
    [13] = 3,
}
local ClassArmorMask = {
    [1]  = {0, 1, 35},
    [2]  = {0, 2, 35},
    [3]  = {0, 4, 68, 4164},
    [4]  = {0, 8, 3592},
    [5]  = {0, 16, 400},
    [6]  = {0, 32, 35},
    [7]  = {0, 64, 68, 4164},
    [8]  = {0, 128, 400},
    [9]  = {0, 256, 400},
    [10] = {0, 512, 3592},
    [11] = {0, 1024, 3592},
    [12] = {0, 2048, 3592},
    [13] = {0, 4096, 68, 4164},
}
local ArmorTypeRadio = {};
local pvpDescriptions = {
    ["Honor"] = true,
    ["Gladiator"] = true,
    ["Elite"] = true,
    ["Warfront"] = true,
    ["Aspirant"] = true,
    ["Combatant"] = true,
    ["Combatant I"] = true,
}
--local raceIDs = {
--    1,2,3,4,5,6,7,8,9,
--    10,11,22,24,27,28,29,30,
--    31,32,34,36
--}
--local raceList = {};
local heritageSets = {
    [1522] = 28, --Highmountain
    [1523] = 27, --Nightborne
    [1524] = 29, --Void Elves
    [1525] = 30, --Lightforged Draenei
    [1679] = 34, --Dark Iron Dwarves
    [1680] = 36, --Warsong (Mag'har)
    [1681] = 36, --BlackRock (Mag'har)
    [1682] = 36, --Frostwolves (Mag'har)
    [1741] = 32, --Kul Tirans
    [1742] = 31, --Zandalari
    [1803] = 3, --Dwarves
    [1804] = 10, --Blood Elves
    [1828] = 7, --Gnome
    [1829] = 6, --Tauren
    [1980] = 37, --Mechagnome
    [1981] = 35, --Vulpera
    [1976] = 22, --Worgen
    [1977] = 9, --Goblin
    [3121] = 4, -- Night Elf
    [3130] = 4, -- Night Elf
    [3086] = 5, -- Forsaken
    [2831] = 1, -- Human
    [2832] = 1, -- Human
    [2830] = 1, -- Human
    [2833] = 2, -- Orc
    [2834] = 2, -- Orc
    [2835] = 2, -- Orc
    [3515] = 8, -- Troll
    [3350] = 8, -- Troll
    [3346] = 11, -- Draenei
    [3347] = 11, -- Draenei
}
local hiddenVisuals = {
    [1] = {77344,134110},
    [2] = {0},--0,
    [3] = {77343,134112},
    [4] = {83202,142503},
    [5] = {104602,168659},
    [6] = {84223,143539},
    [7] = {0},--0,
    [8] = {104603,168664},
    [9] = {104604,168665},
    [10] = {94331,158329},
    [11] = {0},--0,
    [12] = {0},--0,
    [13] = {0},--0,
    [14] = {0},--0,
    [15] = {77345,134111},
    [16] = {0},--0,
    [17] = {0},--0,
    [18] = {0},--0,
    [19] = {83203,142504},
}

local ScrollFrameUpdate;
local ExS_ScrollFrame = nil;
local _FavoriteDropDown = nil;
local _ButtonHeight = nil;
local _ButtonsInFrame = nil;
local ArmorTypeRadioIsChecked = { false, false, false, false };
local CurrArmorType = 1;

local BASE_SET_BUTTON_HEIGHT = 46;
local VARIANT_SET_BUTTON_HEIGHT = 20;
local SET_PROGRESS_BAR_MAX_WIDTH = 204;
local LINK_PIPE = "\124";

local colors = {  IN_PROGRESS_FONT_COLOR = CreateColor(0.251, 0.753, 0.251),
                  IN_PROGRESS_FONT_COLOR_CODE = "|cff40c040",
                  LOW_PROGRESS_COLOR = CreateColor(0.8, 0.2, 0.08),
                  TRANSMOG_PINK = "cffff80ff",
                  SYSTEM_YELLOW = "cffFFFC01",
                };

local ExpandedID = 1000000;

local ExpandedCallbacks = {};
app.ExpandedCallbacks = ExpandedCallbacks;
app.altAppearancesDB = {};
app.altLabelDB = {};
app.altLabelAppendDB = {};
--local ExpandedAltAppearances = {};
--app.ExpandedAltAppearances = ExpandedAltAppearances;

-----------------------------------------------------------------------------------------------------------
  --Debug--
-----------------------------------------------------------------------------------------------------------
local function SilentError(...)
  local arg = {...};
  local dstack = debugstack(2);
  local line = strmatch(dstack,":(%d+):")
  local _,func = strmatch(strsub(dstack,1,string.find(dstack,"\n")),"(%a+)'");
  local str = "Extended Transmog Sets Warning:"..line;
  if func then 
    str = str.." in function "..func;
  end
  str = str.."\n";
  for i=1,#arg do
    str = str..(arg[i] or "nil");
  end
  HandleLuaWarning(1, str)
end

-----------------------------------------------------------------------------------------------------------
  --Outfit Linking--
-----------------------------------------------------------------------------------------------------------
--Function for creating a link in chat for sharing a set as an outfit.
local function LinkSetInChat(setID)
  local itemTransmogInfoList = TransmogUtil.GetEmptyItemTransmogInfoList();

  for i=1,19 do
    itemTransmogInfoList[i].secondaryAppearanceID = 0;
    itemTransmogInfoList[i].appearanceID = hiddenVisuals[i][1];
    itemTransmogInfoList[i].illusionID = 0;
  end
  
  local sortedSources = SetsFrame.GetSortedSetSources(setID);
  
  for i=1,#sortedSources do
  
    local invType = sortedSources[i].invType -1;
    if invType == 2 then invType = 1; 
    elseif invType == 13 then invType = 16; 
    elseif invType == 14 then invType = 17; 
    elseif invType == 15 then invType = 16; 
    elseif invType == 16 then invType = 15; 
    elseif invType == 17 then invType = 16; 
    elseif invType == 20 then invType = 5; 
    elseif invType == 21 then invType = 16; 
    elseif invType == 22 then invType = 17; 
    elseif invType == 23 then invType = 17; end
    
    itemTransmogInfoList[invType].appearanceID = sortedSources[i].sourceID;
  end

  local hyperlink = C_TransmogCollection.GetOutfitHyperlinkFromItemTransmogInfoList(itemTransmogInfoList);
  if not ChatEdit_InsertLink(hyperlink) then
    ChatFrame_OpenChat(hyperlink);
  end
end

--Function to create a personal toast to the player if they completed a set.
local function LinkCompletedSetInChat(setID)
  local set = SetsFrame.GetSetByID(setID);
  local setLink = LINK_PIPE..colors.TRANSMOG_PINK..LINK_PIPE.."Htransmogset:"..setID..LINK_PIPE.."h["..set.name.."]"..LINK_PIPE.."h"..LINK_PIPE.."r";
  print(LINK_PIPE..colors.SYSTEM_YELLOW.."You've completed the set "..setLink.."."..LINK_PIPE.."r");
end

-----------------------------------------------------------------------------------------------------------
  --Gettors--
-----------------------------------------------------------------------------------------------------------

--Get the set data by its ID.
local function GetSetByID(SetID)
  if (BaseSets[SetID] ~= nil) then
    return BaseSets[SetID];
  end
  
  if (VariantSetsIDs[SetID] ~= nil) then
    local baseSet = VariantSetsIDs[SetID];
    
    for i=1,#VariantSets[baseSet] do
      if VariantSets[baseSet][i].setID == SetID then
        return VariantSets[baseSet][i];
      end
    end
  end
  
  if (NotUsedSets[SetID] ~= nil) then
    return NotUsedSets[SetID];
  end
  
  if (SetsForTransmogrifyIndex and SetsForTransmogrifyIndex[SetID] ~= nil) then
    return SetsForTransmogrify[SetsForTransmogrifyIndex[SetID]];
  end
  
	return nil;
end

local function GetAlternateBaseSourceID(set, sourceID)
  if not set.altSources then return nil; end
  if set.altSources[sourceID] then
    return sourceID;
  else
    for a,b in pairs(set.altSources) do
      for i=1,#b do
        if b[i] == sourceID then
          return a;
        end
      end
    end
  end
end

local function SwapToNextSourceCombo(set)--GetNextAltBaseSourceIDForSet(set)
  --local firstSID;
  --local i = 1;
  --for a,b in pairs(set.altSources) do
  --  if not firstSID then firstSID = a end
  --  
  --  if i == set.altNumber then
  --    if #b == set.altSourceNumbers[a] then
  --      set.altSourceNumbers[a] = 1;
  --      set.altNumber = set.altNumber + 1;
  --    else
  --      --set.altSourceNumbers[a] = set.altSourceNumbers[a] + 1;
  --      return a;
  --    end
  --  end
  --  
  --  i = i + 1;
  --  --if not sID and #b == set.altSourceNumbers[a] then
  --  --  sID = a;
  --  --elseif #b < set.altSourceNumbers[a] then
  --  --  set.altSourceNumbers[a] = set.altSourceNumbers[a] + 1;
  --  --  sID = a;
  --  --  break;
  --  --end
  --end
  --if set.altNumber == i then set.altNumber = 1; end
  --return firstSID;
  
  
  local altSourceBaseIDs = {}
  for a,b in pairs(set.altSources) do
    tinsert(altSourceBaseIDs, a);
  end
  local i = 1;
  while true do
    if set.altSourceNumbers[altSourceBaseIDs[i]] == #set.altSources[altSourceBaseIDs[i]] then
      local baseSourceID = altSourceBaseIDs[i];
      local num = set.altSourceNumbers[altSourceBaseIDs[i]];
      set.sources[set.altSources[baseSourceID][num]] = nil;
      set.sources[set.altSources[baseSourceID][1]] = C_TransmogCollection.GetSourceInfo(set.altSources[baseSourceID][1]).isCollected;
      
      set.altSourceNumbers[altSourceBaseIDs[i]] = 1;
      if i ~= #altSourceBaseIDs then
        i = i + 1;
      else
        set.altNumber = 1;
        break;
      end
    else
      set.altNumber = set.altNumber + 1;
      local baseSourceID = altSourceBaseIDs[i];
      local num = set.altSourceNumbers[altSourceBaseIDs[i]];
      set.sources[set.altSources[baseSourceID][num]] = nil;
      set.sources[set.altSources[baseSourceID][num + 1]] = C_TransmogCollection.GetSourceInfo(set.altSources[baseSourceID][num + 1]).isCollected;
      
      set.altSourceNumbers[altSourceBaseIDs[i]] = set.altSourceNumbers[altSourceBaseIDs[i]] + 1;
      break;
    end
  end
  
end

local function HasAlternateSources(setID, sourceID)
  return GetAlternateBaseSourceID(GetSetByID(setID), sourceID) ~= nil;
end

local function GetAlternateSourceID(set, sourceID)
  if set and set.altSources ~= nil then
    local baseSourceID = GetAlternateBaseSourceID(set, sourceID);
    if baseSourceID then
      local oldSourceID = set.altSources[baseSourceID][set.altSourceNumbers[baseSourceID]]
      if set.altSourceNumbers[baseSourceID] == #set.altSources[baseSourceID] then
        set.altSourceNumbers[baseSourceID] = 1;
      else
        set.altSourceNumbers[baseSourceID] = set.altSourceNumbers[baseSourceID] + 1;
      end
    
      return oldSourceID, set.altSources[baseSourceID][set.altSourceNumbers[baseSourceID]];
    end
  end
  return nil;
end

local function SwapAlternateSourceID(setID, sourceID, givenSet)
  local set;
  if givenSet then
    set = givenSet;
  else
    set = GetSetByID(setID);
  end
  if set.altSources ~= nil then
    local oldSourceID, newSourceID = GetAlternateSourceID(set, sourceID);
    if oldSourceID then
      set.sources[oldSourceID] = nil;
      set.sources[newSourceID] = C_TransmogCollection.GetSourceInfo(newSourceID).isCollected;
      if not C_Transmog.IsAtTransmogNPC() then WardrobeCollectionFrame.SetsCollectionFrame:DisplaySet(nil, setID, true); end
    end
  end
end

--Get the ID of this set's Base Set.
local function GetBaseSetID(SetID)
  if (NotUsedSets[SetID] ~= nil) then
    return SetID;
  end
  
  if (BaseSets[SetID] ~= nil) then
    return SetID;
  end
  
  --else get from the var set
  return VariantSetsIDs[SetID];
  ----else, get the variable set and return its baseSetID
  --local varSet = VariantSets[VariantSetsIDs[SetID]];
  --
  ----If filters are set that would hide the set, then it won't be found.
  --if varSet then
  --  return varSet.baseSetID;
  --else
  --  return nil;
  --end
end

--Returns a string with the name of the class colored with its class color.
local function GetColoredClassNameString(classMask)
  if type(classMask) == "string" then
    for a,b in pairs(ClassNameMask) do
      if b == classMask then
        classMask = a;
        break;
      end
    end
    if type(classMask) == "string" then return "" end
  end
  
  if ClassNameLookupMask[classMask] == nil then return "" end
  local classColorRet = C_ClassColor.GetClassColor(ClassNameLookupMask[classMask]);
  return classColorRet:WrapTextInColorCode(ClassNameMask[classMask]);
end
app.GetColoredClassNameString = GetColoredClassNameString;

--Returns a string colored based on the required faction.
local function GetFactionColoredString(stringToColor, faction)
  if (faction == "Horde") then
    return "|cFFB02626"..stringToColor.."|r"; --8C1616
  else
    return "|cFF0E50D0"..stringToColor.."|r"; --2150AA
  end
end

--Returns a string that is a colorized version of the given string.
--If it fails to color, it will return the given string.
local function ColorStringByClass(toColor,classMask)
  if type(classMask) == "string" then
    for a,b in pairs(ClassNameMask) do
      if b == classMask then
        classMask = a;
        break;
      end
    end
    if type(classMask) == "string" then return toColor; end
  end
  
  if ClassNameLookupMask[classMask] == nil then return toColor; end
  local classColorRet = C_ClassColor.GetClassColor(ClassNameLookupMask[classMask]);
  return classColorRet:WrapTextInColorCode(toColor);
end
app.ColorStringByClass = ColorStringByClass;

--Returns a string that is a colorized version of the given string.
--Inputs: String, Red value, Green value, Blue value
local function ColorString(toColor,r,g,b)
  local color = string.format("%02X%02X%02X",r*256,g*256,b*256);
  return "|cFF"..color..toColor.."|r";
end

local function GetPlayerClassArmorType()
  return ClassArmorType[select(3,UnitClass('player'))];
end

--Check if the Set has new sources
local function SetHasNewSources(setID, givenSources)
  if setID and setID >= ExpandedID then
    local sources = givenSources or SetsFrame.GetSetSources(setID);
    for sourceID,_ in pairs(sources) do
      local visID = C_TransmogCollection.GetSourceInfo(sourceID).visualID;
      for i=1,#SetsFrame.NewVisualIDs do
        if visID == SetsFrame.NewVisualIDs[i] then
          return true;
        end
      end
    end
    return false;
  elseif setID then
    return C_TransmogSets.SetHasNewSources(setID);
  end
end

--Find if Base Set is New
local function IsBaseSetNew(baseSetID)
	local baseSetData = SetsFrame.GetBaseSetData(baseSetID);
	if ( not baseSetData.newStatus ) then
		local newStatus = SetHasNewSources(baseSetID);--C_TransmogSets.SetHasNewSources(baseSetID);
		if ( not newStatus ) then
			-- check variants
			local variantSets = SetsFrame.GetVariantSets(baseSetID);
			for i, variantSet in ipairs(variantSets) do
				if(variantSet.setID ~= nil) then
					if ( SetHasNewSources(variantSet.setID) ) then
						newStatus = true;
						break;
					end
				end
			end
		end
		baseSetData.newStatus = newStatus;
	end
	return baseSetData.newStatus;
end

--Reset the new status on the base set.
local function ResetBaseSetNewStatus(baseSetID)
	local baseSetData = SetsFrame.GetBaseSetData(baseSetID);
  local isNew = false;
  
  if SetHasNewSources(baseSetID) then
    isNew = true;
  else
    local varSets = SetsFrame.GetVariantSets(baseSetID);
    for i = 1, #varSets do
      if SetHasNewSources(varSets[i].setID) then
        isNew = true;
        break;
      end
    end
  end
	
	baseSetData.newStatus = isNew;
  return isNew;
end

--Returns if the set is complete.
--Used for determining if a new source should create a set link for the custom sets.
local function IsSetCompleted(setID, givenSet)
  local sources = SetsFrame.GetSetSources(setID, givenSet);
  for sourceID,collected in pairs(sources) do
    local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
    if sourceInfo then
      local appearanceID = sourceInfo.visualID;
      
      local thisCollected = false;
      if sourceInfo.isCollected then
        thisCollected = true;
      elseif appearanceID then
        local appSources = C_TransmogCollection.GetAllAppearanceSources(appearanceID);
        
        for _,sourceID2 in pairs(appSources) do
          
          local sourceInfos = C_TransmogCollection.GetSourceInfo(sourceID2);
          if sourceInfos ~= nil then
            if sourceInfos.isCollected then
              thisCollected = true;
              break;
            end
          end
        end
      end
      if not thisCollected then 
        return false;
      end
    end
  end
  return true;
end

--Trying to apply a sourceID in the transmog window. If it doesn't apply it isn't a valid source, gg.
local tmogLocation, pendInfo;
local function TransmogrifySourceTest(sourceInfo) 
  local slot = C_Transmog.GetSlotForInventoryType(sourceInfo.invType)
  local tmogLocation = TransmogUtil.CreateTransmogLocation(slot, Enum.TransmogType.Appearance, Enum.TransmogModification.Main);
  local slotSources = C_TransmogCollection.GetAppearanceSources(sourceInfo.visualID, sourceInfo.categoryID, tmogLocation);
  if slotSources == nil then return false; end
  CollectionWardrobeUtil.SortSources(slotSources, sourceInfo.visualID);
  local index = CollectionWardrobeUtil.GetDefaultSourceIndex(slotSources, sourceID);
  if slotSources[index].isCollected and C_TransmogCollection.GetAppearanceInfoBySource(slotSources[index].sourceID).appearanceIsUsable then
    return true;
  else return false; end
end

--Returns if the set is complete and usable.
--Used for determining if a new source should create a set link for the custom sets.
local function IsSetCompletedAndUsable(setID, givenSet)
  local sources = SetsFrame.GetSetSources(setID, givenSet);
  local set = givenSet;
  if not givenSet then set = SetsForTransmogrify[SetsForTransmogrifyIndex[setID]] end
  --local sourcesToRemove = {};
  --local sourcesToAdd = {};
  if not set.altSources and set.expansionID ~= -1 then
    for i=1,#app.altAppearancesDB[set.expansionID] do
      if app.altAppearancesDB[set.expansionID][i][1] == setID then
        set.altNumber = 1;
        if not set.altSources then
          set.altSources = {};
          set.altSourceNumbers = {};
        end
        local sID = app.altAppearancesDB[set.expansionID][i][2];
        if not set.altSources[sID] then
          set.altSources[sID] = { sID, app.altAppearancesDB[set.expansionID][i][3] };
          set.altSourceNumbers[sID] = 1;
        else
          tinsert(set.altSources[sID], app.altAppearancesDB[set.expansionID][i][3]);
        end
      end
    end
  end
  
  
  for sourceID,collected in pairs(sources) do
    local usableSource = false;
    if not set.altSources or not set.altSources[sourceID] then
      local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
      if sourceInfo and TransmogrifySourceTest(sourceInfo) then
        usableSource = true;
      end
    else
      for i=#set.altSources[sourceID],1,-1 do
        local sourceInfo = C_TransmogCollection.GetSourceInfo(set.altSources[sourceID][i]);
        if sourceInfo and TransmogrifySourceTest(sourceInfo) then
          usableSource = true;
        else
          table.remove(set.altSources[sourceID], i);
        end
      end
      
      if #set.altSources[sourceID] == 0 then 
        set.altSources[sourceID] = nil;
      elseif #set.altSources[sourceID] < set.altSourceNumbers[sourceID] then
        set.altSourceNumbers[sourceID] = #set.altSources[sourceID];
      end
    end
    
    ---- test alt appearances for expanded sets
    --if set.altSources and set.altSources[sourceID] then
    --  sourceInfo = C_TransmogCollection.GetSourceInfo(set.altSources[sourceID]);
    --  if sourceInfo and TransmogrifySourceTest(sourceInfo) then
    --    if not usableSource then
    --      usableSource = true;
    --      --sources[sourceID] = nil
    --      --sources[ExpandedAltAppearances[setID][2]] = true;
    --      table.insert(sourcesToRemove, sourceID);
    --      table.insert(sourcesToAdd, set.altSources[sourceID]);
    --    end
    --  else
    --    set.altSources[set.altSources[sourceID]] = nil;
    --    set.altSources[sourceID] = nil;
    --    
    --    local i = 0;
    --    for a,b in pairs(set.altSources) do i = i + 1; end
    --    if i == 0 then set.altSources = nil end
    --  end
    --end
    ---- testing alt appearances for built-in setSet
    --if ExpandedAltAppearances[setID] and ExpandedAltAppearances[setID][1] == sourceID then
    --  sourceInfo = C_TransmogCollection.GetSourceInfo(ExpandedAltAppearances[setID][2]);
    --  if sourceInfo and TransmogrifySourceTest(sourceInfo) then
    --    if not usableSource then
    --      usableSource = true;
    --      --sources[sourceID] = nil
    --      --sources[ExpandedAltAppearances[setID][2]] = true;
    --      table.insert(sourcesToRemove, sourceID);
    --      table.insert(sourcesToAdd, ExpandedAltAppearances[setID][2]);
    --    else
    --      if givenSet.altSources == nil then givenSet.altSources = {} end
    --      givenSet.altSources[sourceID] = ExpandedAltAppearances[setID][2];
    --      givenSet.altSources[ExpandedAltAppearances[setID][2]] = sourceID;
    --      givenSet.altNumber = 1;
    --    end
    --  end
    --end
    
    if not usableSource then
      return false;
    end
  end
  
  --for i=1,#sourcesToRemove do
  --  sources[sourcesToRemove[i]]=nil;
  --end
  --for i=1,#sourcesToAdd do
  --  sources[sourcesToAdd[i]]=true;
  --end
  return true;
end

--Check to see if this is giving a new source for an already obtained appearance.
local function IsNewSourceOnlyObtainedSource(sourceID)
  local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
  if sourceInfo then
    local appearanceID = sourceInfo.visualID;
    
    if appearanceID then
      local appSources = C_TransmogCollection.GetAllAppearanceSources(appearanceID);
      
      for _,sourceID2 in pairs(appSources) do
        if sourceID2 ~= sourceID then
          local sourceInfos = C_TransmogCollection.GetSourceInfo(sourceID2);
          if sourceInfos ~= nil then
            if sourceInfos.isCollected then
              return false;
            end
          end
        end
      end
    end
    return true;
  end
end

--Helper for filling in the SourceID to SetID map.
local function AddSourcesToSetsMap(setID, sources)
  for sourceID,_ in pairs(sources) do
    local visID = C_TransmogCollection.GetSourceInfo(sourceID).visualID;
    if SetIDForSource[visID] ~= nil then
      table.insert(SetIDForSource[visID], setID);
    else
      SetIDForSource[visID] = {setID};
    end
  end
end

--Helper for getting a SetId from the given SourceID.
--Returns a table of all Sets with the given Source, or nil if no sets for source exist.
local function GetSetIDsBySourceID(sourceID)
  local visID = C_TransmogCollection.GetSourceInfo(sourceID).visualID;
  return SetIDForSource[visID];
end

--Get the default set to be displayed when a set is opened.
local function GetDefaultSetIDForBaseSet(setID)
  local baseSetID = setID;
  if type(baseSetID) ~= "number" then
    baseSetID = baseSetID.selectedSetID;
  end
  baseSetID = GetBaseSetID(baseSetID);
  
	if ( IsBaseSetNew(baseSetID) ) then
		if ( SetHasNewSources(baseSetID) ) then
			return baseSetID;
		else
			local variantSets = SetsFrame.GetVariantSets(baseSetID);
			for i, variantSet in ipairs(variantSets) do
				if ( SetHasNewSources(variantSet.setID) ) then
					return variantSet.setID;
				end
			end
		end
	end

	local baseSet = BaseSets[baseSetID];
	if ( baseSet and baseSet.favoriteSetID ) then
		return baseSet.favoriteSetID;
	end
	-- pick the one with most collected
  -- In ties the higher difficulty wins ties, unless the tie is across classes
  -- In which case the first class wins (which puts the player's current class in favor)
	local highestCount = 0;
	local highestCountSetID = baseSetID;
  local highestCountClassMask = 0;
	local variantSets = SetsFrame.GetVariantSets(baseSetID, true);
	for i = 1, #variantSets do
		local variantSetID = variantSets[i].setID
		local numCollected = SetsFrame.GetSetSourceCounts(variantSetID);
		if (numCollected > highestCount) or (numCollected == highestCount and ((variantSets[i].classMask == ClassToMask[ClassIndex]) or (highestCountClassMask ~= ClassToMask[ClassIndex]))) then
			highestCount = numCollected;
			highestCountSetID = variantSetID;
      highestCountClassMask = variantSets[i].classMask;
		end
	end
	return highestCountSetID;
end

--Gets the Variant Sets for the specified baseSetID.
--Gets them from the VarSets map.
local function GetVariantSets(setID, sort)
  local variantSetsAll = VariantSets[VariantSetsIDs[setID]];
  if not variantSetsAll then
    variantSetsAll = {NotUsedSets[setID]};
  end
  local anyHidden = false;
  
  local variantSets = {};
  for i=1,#variantSetsAll do
    if ExS_HiddenSets[CurrArmorType][variantSetsAll[i].setID] then
      if ExS_Settings.showHiddenSets then
        tinsert(variantSets,variantSetsAll[i]);
      end
      anyHidden = true;
    else
      tinsert(variantSets,variantSetsAll[i]);
    end
  end
  
  
  if sort == true then
    local comparison = function (set1, set2)
      if ( set1.requiredFaction ~= set2.requiredFaction) then
        if (set1.requiredFaction == factionNames.playerFaction) then
          return true;
        elseif (set2.requiredFaction == factionNames.playerFaction) then
          return false;
        elseif (set1.requiredFaction == nil) then
          return true;
        else
          return false;
        end
      end
      if set1.classMask ~= set2.classMask then
        if ClassNameMask[set1.classMask] == nil and ClassNameMask[set2.classMask] ~= nil then return true;  end
        if ClassNameMask[set2.classMask] == nil and ClassNameMask[set1.classMask] ~= nil then return false; end
        if set1.classMask == ClassToMask[ClassIndex] then return true; end
        if set2.classMask == ClassToMask[ClassIndex] then return false; end
        return set1.classMask < set2.classMask;
      end
      return set1.uiOrder < set2.uiOrder;
    end
    table.sort(variantSets, comparison);
  end
  
  return variantSets, anyHidden;
end

--Get the data for the items in the set.
local function GetSetSourceData(setID, givenSources, quick, forceUpdate)
	if ( not SetsFrame.sourceData ) then
		SetsFrame.sourceData = { };
	end
  
	local sourceData = SetsFrame.sourceData[setID];
	if ( forceUpdate or not sourceData or sourceData.needsRefresh or (not quick and sourceData.numCollected == nil) or SetHasNewSources(setID, givenSources) or sourceData.numTotal == 0) then --need to check new for expanded sets.
		local sources;
    if givenSources ~= nil then
      sources = givenSources;
    --elseif sourceData and sourceData.sources then
    --  sources = sourceData.sources;
    else
      sources = SetsFrame.GetSetSources(setID);
    end
    
    local numCollected = 0;
		local numTotal = 0;
    local numUsable = 0;
		for sourceID,collected in pairs(sources) do
      local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
      if sourceInfo then
        local appearanceID = sourceInfo.visualID;
        
        local thisCollected = false;
        --if sourceInfo.isCollected then
        --  numCollected = numCollected + 1;
        --  thisCollected = true;
        --  if TransmogrifySourceTest(sourceInfo) then
        --    numUsable = numUsable + 1;
        --  end
        --else
        if appearanceID then
          local appSources = C_TransmogCollection.GetAllAppearanceSources(appearanceID);
          
          local isCollectedChecked, isTransmogrifyChecked = false, false;
          for _,sourceID2 in pairs(appSources) do
            
            local sourceInfos = C_TransmogCollection.GetSourceInfo(sourceID2);
            if sourceInfos ~= nil then
              if not isCollectedChecked and sourceInfos.isCollected then
                numCollected = numCollected + 1;
                thisCollected = true;
                isCollectedChecked = true;
              end
              if not isTransmogrifyChecked and TransmogrifySourceTest(sourceInfos) then
                numUsable = numUsable + 1;
                isTransmogrifyChecked = true;
              end
              if isCollectedChecked and isTransmogrifyChecked then
                break;
              end
            end
          end
        end
        if not thisCollected and quick then 
          sourceData = { numCollected = nil, numTotal = nil, sources = sources, collected = false };
          SetsFrame.sourceData[setID] = sourceData;
          return sourceData;
        end
      end
      numTotal = numTotal + 1;
		end
		sourceData = { numCollected = numCollected, numUsable = numUsable, numTotal = numTotal, sources = sources, collected = numCollected == numTotal, needsRefresh = numTotal == 0 };
		SetsFrame.sourceData[setID] = sourceData;
	end
	return sourceData;
end

--Get the number of sets and the number of completed sets
local function CalculateCount()
	setStats.numberSets = 0;
	setStats.numberCollected = 0;
  
  if(not alreadyFilled) then
    SetsFrame.InitializeSets();
  end
  
  --  -- look through the base sets
	--for _, baseSet in pairs(BaseSets) do
  --  local quickSet = GetSetSourceData(baseSet.setID, {}, true);
  --  setStats.numberSets = setStats.numberSets + 1;
  --  if quickSet.collected then setStats.numberCollected = setStats.numberCollected + 1; end
	--end
  
    -- look through all the variantSets
	for _, varSet in pairs(VariantSets) do
    for i=1,#varSet do
      local quickSet = GetSetSourceData(varSet[i].setID, nil, true);
      setStats.numberSets = setStats.numberSets + 1;
      if quickSet.collected then setStats.numberCollected = setStats.numberCollected + 1; end
    end
	end
end

--Get the Number collected and total number of items in the set.
local function GetSetSourceCounts(setID, givenSources, forceUpdate)
	local sourceData = GetSetSourceData(setID, givenSources, false, forceUpdate);
	return sourceData.numCollected, sourceData.numTotal, sourceData.numUsable;
end

--Get the data for the selected set (used for left list).
local function GetBaseSetData(setID, forceUpdate)
  if NotUsedSets[setID] ~= nil then
    local hasNew = SetHasNewSources(setID);
    local topCollected, topTotal = GetSetSourceCounts(setID, NotUsedSets[setID].sources);
    local numFinishedSets = 0;
    if topCollected == topTotal then numFinishedSets = 1; end
    return { topCollected = topCollected, topTotal = topTotal, completed = (topCollected == topTotal), numSets = 1, numFinishedSets = numFinishedSets, allCompleted = numSets == numFinishedSets, isPvP = false };
  end
  local baseSetID = GetBaseSetID(setID);
  local variantSets = GetVariantSets(baseSetID);
  
  local hasNew = SetHasNewSources(baseSetID);
  if not hasNew then
    for i = 1, #variantSets do
      if SetHasNewSources(variantSets[i].setID) then
        hasNew = true;
        break;
      end
    end
  end
  
	if ( not BaseSetsData[setID] or hasNew or forceUpdate) then
		--local baseSetID = GetBaseSetID(setID);
    
		local topCollected, topTotal, topUsable = GetSetSourceCounts(baseSetID, nil, forceUpdate);
    local numSets = 0;
    local numFinishedSets = 0;
    local numUsableSets = 0;
      
		--local variantSets = GetVariantSets(baseSetID);
		for i = 1, #variantSets do
			local numCollected, numTotal, numUsable = GetSetSourceCounts(variantSets[i].setID, nil, forceUpdate);
      
      numSets = numSets + 1;
      if (numCollected == numTotal) then
        numFinishedSets = numFinishedSets + 1;
      end
      if (numUsable == numTotal) then
        numUsableSets = numUsableSets + 1;
      end
      
			if ( numCollected > topCollected ) then
				topCollected = numCollected;
				topTotal = numTotal;
			end
		end
    
		local setInfo = { topCollected = topCollected, topTotal = topTotal, completed = (topCollected == topTotal), numSets = numSets, numFinishedSets = numFinishedSets, numUsableSets = numUsableSets, allCompleted = (numSets == numFinishedSets), isPvP = BaseSetsPvPFlag[baseSetID] };
		BaseSetsData[setID] = setInfo;
	end
	return BaseSetsData[setID];
end

--CreateFrame( "GameTooltip", "ExS_GameTooltip", nil, "GameTooltipTemplate" );
--ExS_GameTooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
---- Allow tooltip SetX() methods to dynamically add new lines based on these
--ExS_GameTooltip:AddFontStrings(
--    ExS_GameTooltip:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" ),
--    ExS_GameTooltip:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );
    
--Helper function. Makes an invisible tooltip for the item and parses it to see if it has 
--red error text related to class requirements.
local function IsForClass(itemLink)
  --ExS_GameTooltip:ClearLines();
  --ExS_GameTooltip:SetHyperlink(itemLink);
  local tooltipInfo = C_TooltipInfo.GetHyperlink(itemLink);
  TooltipUtil.SurfaceArgs(tooltipInfo);
  for _, line in ipairs(tooltipInfo.lines) do
      TooltipUtil.SurfaceArgs(line)
  end
  
  if tooltipInfo.lines[1].leftText == "Retrieving item information" then return nil; end
  
  for i=1,#tooltipInfo.lines do  
    local text = tooltipInfo.lines[i].leftText
    
    if text then
      if string.find(text, "Classes:") then
        local r,g,b = tooltipInfo.lines[i].leftColor.r,tooltipInfo.lines[i].leftColor.g,tooltipInfo.lines[i].leftColor.b;
        if math.floor(r*255) == 255 and math.floor(g*255) == 32 and math.floor(b*255) == 32 then
          return false;
        else
          return true, true;
        end
      end
    end
  end
  return true;
end

local function testSourceInfos(setID)
  local sources = SetsFrame.GetSetSources(setID);
  for sourceID,_ in pairs(sources) do
    local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
    if sourceInfo == nil then
      local set = GetSetByID(setID);
      SilentError("Failed to get setInfo\n Set: ",set.name,"\n Label: ",set.label,"\n sourceID:",sourceID)
    end
  end
end

--Get the items in the set, sorted.
local function GetSortedSetSources(setID, givenSet)
	local returnTable = { };
 
  local sources = SetsFrame.GetSetSources(setID, givenSet);
  
  local set = givenSet; if set == nil then set = GetSetByID(setID) end
  local factionCheck = false;
  if not set.requiredFaction or set.requiredFaction == factionNames.playerFaction then factionCheck = true; end
  
  for sourceID,_ in pairs(sources) do
    local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
    if sourceInfo == nil then
      SilentError("Failed to get setInfo\n Set: ",WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Name:GetText(),"\n Label: ",WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Label:GetText(),"\n sourceID:",sourceID);
    else
      local sortOrder = EJ_GetInvTypeSortOrder(sourceInfo.invType);
      --local appearanceID = sourceInfo.visualID;
      
      --local itemArmorType = select(7,GetItemInfoInstant(sourceInfo.itemID));
      --local isPlayerArmorWeight = (sourceInfo.invType == 17) or (itemArmorType == 0) or (itemArmorType == 5) or (ClassArmorType[select(3,UnitClass('player'))] == itemArmorType);
      
      ----Interesting shortcut, but wouldn't work for other armor types. Also doesn't work with HiddenUntilCollected items.
      --local canCharUse = C_TransmogCollection.GetAppearanceInfoBySource(sourceID);
      --local canCharCollectItNew;
      --local isCollectedCharNew;
      --local isCollectedAccountNew = false;
      --if canCharUse == nil then
      --  canCharCollectItNew = false;
      --  isCollectedCharNew = false;
      --else
      --  isCollectedAccountNew = canCharUse.appearanceIsCollected
      --  canCharCollectItNew = true;
      --  isCollectedCharNew = canCharUse.appearanceIsUsable;
      --end
      --
      --if not appearanceID then
      --  appearanceID = sourceInfo.visualID;
      --end
      
      
      --GetAppearanceSources will only return sources that the character could use (so nil for other weight classes,
      --but also nil for cases such as a source being from a quest given to the other faction).
      --GetAllAppearanceSources will return all the sources regardless of ability to use.
      local appSources = C_TransmogCollection.GetAllAppearanceSources(sourceInfo.visualID);
      local tmogLocation = TransmogUtil.CreateTransmogLocation(C_Transmog.GetSlotForInventoryType(sourceInfo.invType), Enum.TransmogType.Appearance, Enum.TransmogModification.Main);
      local appSources2 = C_TransmogCollection.GetAppearanceSources(sourceInfo.visualID, sourceInfo.categoryID, tmogLocation);
      
      
      local sourceCollectPairs = {}
      if appSources2 then
        for _,appInfo in pairs(appSources2) do
          sourceCollectPairs[appInfo.sourceID] = { appInfo.isCollected, appInfo.isCollected};
        end
      end
      for i=1,#appSources do
        local appInfo = C_TransmogCollection.GetSourceInfo(appSources[i]);
        if sourceCollectPairs[appInfo.sourceID] then
          if not sourceCollectPairs[appInfo.sourceID][1] then
            sourceCollectPairs[appInfo.sourceID][2] = appInfo.isCollected;
          end
        else
          sourceCollectPairs[appInfo.sourceID] = {false, appInfo.isCollected};
        end
      end
      
        
      local isCollectedAccount = false;
      local canCharCollectIt = nil;
      if not factionCheck then
        canCharCollectIt = false
      end
      local isCollectedChar = false;
      local updatePending = false;
      local anyNotPending = false;
      local otherClassCanCollect = 0;
      
      for source,CollectInfo in pairs(sourceCollectPairs) do
        if CollectInfo[2] then
          isCollectedAccount = true;
        end
        if CollectInfo[1] then
          isCollectedChar = true;
        end
        if canCharCollectIt == nil then
          local link = select(6, C_TransmogCollection.GetAppearanceSourceInfo(source));
          --if isPlayerArmorWeight and IsForClass(link) then
          --  canCharCollectIt = true;
          --end
          local sourceInfo2 = C_TransmogCollection.GetSourceInfo(source);
          local itemArmorType = select(7,GetItemInfoInstant(sourceInfo2.itemID));
          
          local isPlayerArmorWeight = (sourceInfo2.invType == 17) or (itemArmorType == 0) or (itemArmorType == 5) or (ClassArmorType[select(3,UnitClass('player'))] == itemArmorType);
          
          
          if isPlayerArmorWeight then
            local isForClass, hasClassRestriction = IsForClass(link);
            if isForClass == nil then
              updatePending = true;
            else
              anyNotPending = true;
              if isForClass then
                canCharCollectIt = true;
              end
            end
          end
        end
        if otherClassCanCollect < 2 then
          local link = select(6, C_TransmogCollection.GetAppearanceSourceInfo(source));
          
          local sourceInfo2 = C_TransmogCollection.GetSourceInfo(source);
          local itemArmorType = select(7,GetItemInfoInstant(sourceInfo2.itemID));
          local isPlayerArmorWeight = (sourceInfo2.invType == 17) or (itemArmorType == 0) or (itemArmorType == 5) or (ClassArmorType[select(3,UnitClass('player'))] == itemArmorType);
          
          if isPlayerArmorWeight then
            local isForClass, hasClassRestriction = IsForClass(link);
            if isForClass == nil then
              updatePending = true;
            else
              anyNotPending = true;
              if isForClass and not hasClassRestriction then
                if CollectInfo[1] then
                  otherClassCanCollect = 2;
                else
                  otherClassCanCollect = 1;
                end
              end
            end
          end
        end
        
        if isCollectedAccount and canCharCollectIt and isCollectedChar and (otherClassCanCollect == 2) then
          break;
        end
      end
      
      if anyNotPending then updatePending = false; end
      
      tinsert(returnTable, { sourceID = sourceID, collected = isCollectedAccount, sortOrder = sortOrder, itemID = sourceInfo.itemID,
                             invType = sourceInfo.invType, isCollectedChar = isCollectedChar, canCharCollectIt = canCharCollectIt,
                             otherClassCanCollect = otherClassCanCollect == 1, updatePending = updatePending });
    end
  end

	local comparison = function(entry1, entry2)
		if ( entry1.sortOrder == entry2.sortOrder ) then
			return entry1.itemID < entry2.itemID;
		else
			return entry1.sortOrder < entry2.sortOrder;
		end
	end
	table.sort(returnTable, comparison);
	return returnTable;
end

--Get Table of Sources for a given slot (helmet, shoulder, etc.). Used for tooltips.
local function GetSetSourcesForSlot(setID, slot, givenSources, firstAppID)  
  if slot == 16 then slot = 13; end
  --Because for some reasons the cloaks all have the wrong slot.
  if slot == 15 then slot = 16; end
  local sources = givenSources;
  if not sources then sources = SetsFrame.GetSetSources(setID); end
  
  for sourceID,_ in pairs(sources) do
    local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
    
    local sourceInvType = sourceInfo.invType - 1;
    if (sourceInvType == 20) then sourceInvType = 5; end
    if (sourceInvType == 14) or (sourceInvType == 15) or (sourceInvType == 17) or (sourceInvType == 21) or (sourceInvType == 22) then sourceInvType = 13; end
    
    
    if (slot == sourceInvType) then
      if not firstAppID then
        local appSourcesIDs = C_TransmogCollection.GetAllAppearanceSources(sourceInfo.visualID);
        
        local appSources = {};
        for i=1,#appSourcesIDs do
          table.insert(appSources, C_TransmogCollection.GetSourceInfo(appSourcesIDs[i]));
        end
        
        if #appSources == 0 then
          table.insert(appSources, sourceInfo);
        end
        
        return appSources;
      else
        return sourceInfo.visualID
      end
    end
  end
end

--Get icon for the set.
local function GetIconForSet(setID)
	local sourceData = GetSetSourceData(setID, nil, true);
	if ( not sourceData.icon or sourceData.icon == QUESTION_MARK_ICON ) then
    for i=1,10 do
      local source = GetSetSourcesForSlot(setID, i);
      if source then
        sourceData.icon = select(5,GetItemInfoInstant(source[1].itemID));
        break;
      end
    end
    if not sourceData.icon then
      sourceData.icon = QUESTION_MARK_ICON
    end
	end
	return sourceData.icon;
end

--Gets a table of the items in the set. Returns a map with the sourceID as the key.
local function GetSetSources(setID, givenSet)
  local set;
  if givenSet ~= nil then
    set = givenSet;
  else
    set = GetSetByID(setID);
  end
  if set == nil then SilentError("Failed to find set for setID of ",setID); set = {} end
  
  if set.sources == nil then
    set.sources = {};
		local setAppearances = C_TransmogSets.GetSetPrimaryAppearances(setID);
		for i, appearanceInfo in ipairs(setAppearances) do
			set.sources[appearanceInfo.appearanceID] = appearanceInfo.collected;
		end
  end
  
  return set.sources;
end

--Loops through the baseList and checks all of their variants to find the set that contains the source item.
local function GetSetContainingSourceID(sourceID)
  local visualID = C_TransmogCollection.GetSourceInfo(sourceID).visualID;
  
  for i = 1, #BaseList do
    local variantSets = GetVariantSets(BaseList[i].setID, false);
  
    for id,set in pairs(variantSets) do
      if set.sources == nil then
        GetSetSources(set.setID);
      end
      for sourceID2,_ in pairs(set.sources) do
        local visID = C_TransmogCollection.GetSourceInfo(sourceID2).visualID;
        if visualID == visID then
          return set.setID;
        end
      end
    end
  end
end

-----------------------------------------------------------------------------------------------------------
  --Events--
-----------------------------------------------------------------------------------------------------------
local isCollectionSetup = false;
local function OnShow()
	--WardrobeCollectionFrame.SetsCollectionFrame:RegisterEvent("GET_ITEM_INFO_RECEIVED");
	WardrobeCollectionFrame.SetsCollectionFrame:RegisterEvent("TRANSMOG_COLLECTION_ITEM_UPDATE");
	WardrobeCollectionFrame.SetsCollectionFrame:RegisterEvent("TRANSMOG_COLLECTION_UPDATED");
	WardrobeCollectionFrame.SetsCollectionFrame:RegisterEvent("UNIT_FORM_CHANGED");
	
  WardrobeCollectionFrame.SetsCollectionFrame.Model.inAlternateForm = select(2,C_PlayerInfo.GetAlternateFormInfo())
  WardrobeCollectionFrame.SetsCollectionFrame.Model:SetUnit("player", false, not WardrobeCollectionFrame.SetsCollectionFrame.Model.inAlternateForm);
  
  if not isCollectionSetup then
		SetsFrame.CreateScrollbar(frame);
    isCollectionSetup = true;
  end
  
  if(not alreadyFilled) then
    SetsFrame.InitializeSets();
  end
  -- select the first set if not init
	if ( not WardrobeCollectionFrame.SetsCollectionFrame.init ) then
		WardrobeCollectionFrame.SetsCollectionFrame.init = true;
		if ( BaseList and BaseList[1] ) then
      local defaultID = GetDefaultSetIDForBaseSet(BaseList[1].setID);
			WardrobeCollectionFrame.SetsCollectionFrame:SelectSet(defaultID);
		end
	else
		WardrobeCollectionFrame.SetsCollectionFrame:Refresh();
    SetsFrame.DisplaySet(nil, nil, true);
	end

	local latestSource = SetsFrame.LatestSource;
  if latestSource == nil then
    latestSource = C_TransmogSets.GetLatestSource();
  end
	if ( latestSource ~= NO_TRANSMOG_SOURCE_ID and latestSource ~= 0) then
    if GetSetIDsBySourceID(latestSource) then
      local setID = GetSetIDsBySourceID(latestSource)[1];
      if ( setID ) then
        SetsFrame.ScrollToSet(setID);
      end
    end
		WardrobeCollectionFrame.SetsCollectionFrame:ClearLatestSource();
    SetsFrame.LatestSource = nil;
	end

	WardrobeCollectionFrame.progressBar:Show();
	WardrobeCollectionFrame.SetsCollectionFrame:UpdateProgressBar();
	WardrobeCollectionFrame.SetsCollectionFrame:RefreshCameras();
  
  if ExS_Settings.showHiddenSets then
    WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetTexCoord(.5,1,0,1);
  else
    WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetTexCoord(0,.5,0,1);
  end

  HelpTip:Hide(WardrobeCollectionFrame, TRANSMOG_SETS_TAB_TUTORIAL);
  SetCVarBitfield("closedInfoFrames", LE_FRAME_TUTORIAL_TRANSMOG_SETS_TAB, true);
  
  if #BaseList == 0 then
    SetsFrame.DisplaySet();
  end
  
  WardrobeCollectionFrame.FilterButton:Hide();
end

local function OnHide()
	--WardrobeCollectionFrame.SetsCollectionFrame:UnregisterEvent("GET_ITEM_INFO_RECEIVED");
	WardrobeCollectionFrame.SetsCollectionFrame:UnregisterEvent("TRANSMOG_COLLECTION_ITEM_UPDATE");
	WardrobeCollectionFrame.SetsCollectionFrame:UnregisterEvent("TRANSMOG_COLLECTION_UPDATED");
	WardrobeCollectionFrame.SetsCollectionFrame:UnregisterEvent("UNIT_FORM_CHANGED");
	WardrobeCollectionFrame:ClearSearch(Enum.TransmogSearchType.BaseSets);
  
  WardrobeCollectionFrame.FilterButton:Show();
end

--Callback for Updating Item Frames. Used to limit refreshing/multiple false refreshes as loading in a set
--could cause the update event to trigger up to 9 times.
local alreadyADelayedItemUpdateCallback = false;
local repeater;
local function UpdateItemCallback()
  for itemFrame in WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.itemFramesPool:EnumerateActive() do
    SetsFrame.HandleItemFrames(itemFrame, false);
  end
  if WardrobeCollectionFrame.SetsCollectionFrame:GetSelectedSetID() ~= nil then --Can happen if you set filters in a way to make an empty list.
    SetsFrame.DisplaySet(nil,nil,true);
  end
  
  alreadyADelayedItemUpdateCallback = false;
end

local lastTime = 0;
local thisTime = 0;
local function DelayItemCallback()
  if thisTime ~= lastTime then
    thisTime = lastTime;
  else
    repeater:Cancel();
    lastTime = 0;
    thisTime = 0;
    UpdateItemCallback();
  end
end


local function OnEvent(self, event, ...)
	--if ( event == "GET_ITEM_INFO_RECEIVED" ) then
		--local itemID = ...;
		--for itemFrame in WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.itemFramesPool:EnumerateActive() do
		--	if ( itemFrame.itemID == itemID ) then
		--		WardrobeCollectionFrame.SetsCollectionFrame:SetItemFrameQuality(itemFrame);
		--		break;
		--	end
		--end
	if ( event == "TRANSMOG_COLLECTION_ITEM_UPDATE" ) then
    lastTime = lastTime + 1;
    if not alreadyADelayedItemUpdateCallback then
      alreadyADelayedItemUpdateCallback = true;
      repeater = C_Timer.NewTicker(0.5, DelayItemCallback);
    end
	elseif ( event == "TRANSMOG_COLLECTION_UPDATED" ) then
    SetsFrame.InitializeSets();
    
		WardrobeCollectionFrame.SetsCollectionFrame:Refresh();
		WardrobeCollectionFrame.SetsCollectionFrame:UpdateProgressBar();
		WardrobeCollectionFrame.SetsCollectionFrame:ClearLatestSource();
  elseif ( event == "TRANSMOG_COLLECTION_SOURCE_ADDED" ) then
    local visID = C_TransmogCollection.GetSourceInfo(...).visualID;
    --If the item is part of an exisiting set, can skip needing to load everything.
    if C_TransmogSets.GetSetsContainingSourceID(...) ~= nil then
      table.insert(SetsFrame.NewVisualIDs, visID);
      SetsFrame.LatestSource = ...;
    else
      --Load everything if it isn't already loaded.
      if(not alreadyFilled) then
        SetsFrame.InitializeSets();
      end
      --So we can find the corresponding set (if it exists).
      local setID = SetIDForSource[visID];
      if setID then
        table.insert(SetsFrame.NewVisualIDs, visID);
        SetsFrame.LatestSource = ...;
        --If this isn't obtaining a new source for an appearance already collected,
        --check if it completes the set and link it if it does.
        if IsNewSourceOnlyObtainedSource(...) then
          for i=1,#setID do
            if setID[i] >= ExpandedID and IsSetCompleted(setID[i]) then
              LinkCompletedSetInChat(setID[i]);
            end
          end
        end
      end
    end
  elseif ( event == "TRANSMOG_COLLECTION_SOURCE_REMOVED" ) then
    local visID = C_TransmogCollection.GetSourceInfo(...).visualID;
    --If the removed visualId was in the list of new visual ids, then remove it from that list.
    for i=0,#SetsFrame.NewVisualIDs do
      if SetsFrame.NewVisualIDs[i] == visID then
        table.remove(SetsFrame.NewVisualIDs, i);
        break;
      end
    end
    --If we are set up, see if the removed item is part of a set.
    --If it is, update that set.
    --Then see if any of the current buttons in the sets window is for that set and update it too.
    if alreadyFilled then
      local setIDs = SetIDForSource[visID];
      if setIDs then
        for i=1,#setIDs do
          GetBaseSetData(setIDs[i], true)
          local baseSetID = GetBaseSetID(setIDs[i])
          for j=1,#ExS_ScrollFrame.buttons do
            if ExS_ScrollFrame.buttons[j].setID == baseSetID then
              SetsFrame.SetButtonData(ExS_ScrollFrame.buttons[j], GetSetByID(baseSetID));
            end
          end
        end
      end
    end
    if SetsFrame.LatestSource == ... then
      SetsFrame.LatestSource = SetsFrame.NewVisualIDs[1];
    end
  elseif ( event == "UNIT_FORM_CHANGED" and ... == "player" ) then
    --WardrobeCollectionFrame.SetsCollectionFrame.Model:SetUnit("player")
    WardrobeCollectionFrame.SetsCollectionFrame.Model:SetUnit("player", false, not WardrobeCollectionFrame.SetsCollectionFrame.Model.inAlternateForm);
    local sources = GetSetSources(ExS_ScrollFrame.selectedSetID);
    for a,b in pairs(sources) do
      WardrobeCollectionFrame.SetsCollectionFrame.Model:TryOn(a);
    end
	end
end

local function GetDisplaySetInfo(setID)
  local setinfo = GetSetByID(setID);
  
  return setinfo.name, setinfo.label, setinfo.limitedTimeSet, setinfo.description, setinfo.requiredFaction, setinfo.note, setinfo.noLongerObtainable;
end

--Handles Setting or Refreshing the collection based appearances for the row of ItemFrames.
local function HandleItemFrames(itemFrame, forceItemFrameDataUpdate)
  if (forceItemFrameDataUpdate) then
    SetsFrame.DisplaySet(nil,nil,true);
    return;
  end
  
  local itemFrameType = itemFrame.itemFrameType;
  if not ExS_Settings.showCharCollectionIcons then
    if itemFrameType == "CollectedCharCantUse" or itemFrameType == "CollectedCharCantGet" or itemFrameType == "OtherClassCanCollect" or itemFrameType == "CollectedUpdatePending" then
      itemFrameType = "Collected";
    elseif itemFrameType == "NotCollectedCharCantGet" or itemFrameType == "NotCollectedUpdatePending" then
      itemFrameType = "NotCollected";
    end
  end
  
  if itemFrameType == "Collected" or itemFrameType == "OtherClassCanCollect"  or itemFrameType == "CollectedCharCantUse" or itemFrameType == "CollectedCharCantGet" or itemFrameType == "CollectedUpdatePending" then
    itemFrame.Icon:SetDesaturated(false);
    itemFrame.IconBorder:Show();
    itemFrame.IconBorder:SetDesaturation(0);
    WardrobeCollectionFrame.SetsCollectionFrame:SetItemFrameQuality(itemFrame);
    
    if itemFrameType == "OtherClassCanCollect" or itemFrameType == "Collected" or itemFrameType == "CollectedUpdatePending" then
      if itemFrameType == "OtherClassCanCollect" then
        itemFrame.CollectionIcon.Icon:SetVertexColor(1,1,1);
        itemFrame.CollectionIcon.Icon:SetAtlas("UI-QuestIcon-TurnIn-Normal");
        itemFrame.CollectionIcon.Text = "An appearance source usable by other classes can still be collected.";
      elseif itemFrameType == "CollectedUpdatePending" then
        itemFrame.CollectionIcon.Icon:SetVertexColor(.9,.9,.9);
        itemFrame.CollectionIcon.Icon:SetAtlas("unitframeicon-chromietime");
        itemFrame.CollectionIcon.Text = "Retrieving Item Info...";
      else
        itemFrame.CollectionIcon.Icon:SetAtlas(nil);
        itemFrame.CollectionIcon.Text = "";
      end
      
      itemFrame.Icon:SetAlpha(1);
      itemFrame.IconBorder:SetAlpha(1);
    else
      if itemFrameType == "CollectedCharCantUse" then
        itemFrame.CollectionIcon.Icon:SetVertexColor(1,0.8,0);
        itemFrame.CollectionIcon.Text = "An appearance source usable by this character can still be collected.";
      else
        itemFrame.CollectionIcon.Icon:SetVertexColor(1,0,0);
        itemFrame.CollectionIcon.Text = "This appearance cannot be used by this character.";
      end
      itemFrame.CollectionIcon.Icon:SetAtlas("PlayerRaidBlip");
      
      itemFrame.Icon:SetAlpha(0.6);
      itemFrame.IconBorder:SetAlpha(0.5);
    end
    
    
    local transmogSlot = C_Transmog.GetSlotForInventoryType(itemFrame.invType);
    if ( C_TransmogSets.SetHasNewSourcesForSlot(itemFrame.setID, transmogSlot) ) then
      itemFrame.New:Show();
      itemFrame.New.Anim:Play();
    elseif #SetsFrame.NewVisualIDs > 0 then
      local itemFrameVisID = C_TransmogCollection.GetSourceInfo(itemFrame.sourceID).visualID;
      local setNew = false;
      for i = 1,#SetsFrame.NewVisualIDs do
        if SetsFrame.NewVisualIDs[i] == itemFrameVisID then
          setNew = true;
          itemFrame.New:Show();
          itemFrame.New.Anim:Play();
          break;
        end
      end
      if not setNew then
        itemFrame.New:Hide();
        itemFrame.New.Anim:Stop();
      end;
    else
      itemFrame.New:Hide();
      itemFrame.New.Anim:Stop();
    end
  else
    itemFrame.Icon:SetDesaturated(true);
    itemFrame.Icon:SetAlpha(0.3);
    itemFrame.IconBorder:Hide();
    itemFrame.New:Hide();
    if itemFrame.Icon.backdrop then
      itemFrame.Icon.backdrop:Hide();
    end
    
    if itemFrameType == "NotCollectedCharCantGet" then
      itemFrame.CollectionIcon.Icon:SetVertexColor(1,0,0);
      itemFrame.CollectionIcon.Icon:SetAtlas("islands-markedarea");
      itemFrame.CollectionIcon.Text = "Cannot collect or use this appearance on this character.";
    elseif itemFrameType == "NotCollectedUpdatePending" then
      itemFrame.CollectionIcon.Icon:SetVertexColor(.9,.9,.9);
      itemFrame.CollectionIcon.Icon:SetAtlas("unitframeicon-chromietime");
      itemFrame.CollectionIcon.Text = "Retrieving Item Info...";
    else
      itemFrame.CollectionIcon.Icon:SetAtlas(nil);
      itemFrame.CollectionIcon.Text = "";
    end
  end
end

local function DisplaySet(self, givenSetID, force)
  local setID;
  if givenSetID then
    setID = givenSetID
  else
    setID = WardrobeCollectionFrame.SetsCollectionFrame:GetSelectedSetID();
  end
  
  if not force and (setID == WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.setID) then return; end
  
  WardrobeCollectionFrame.SetsCollectionFrame.selectedSetID = setID;
	ExS_ScrollFrame.selectedSetID = setID;

  local name, label, limitedTimeSet, description, requiredFaction, note, noLongerObtainable = GetDisplaySetInfo(setID);
  
	WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame:Show();
	WardrobeCollectionFrame.SetsCollectionFrame.Model:Show();

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.setID = setID;
	WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Name:SetText(name);
	if ( WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Name:IsTruncated() ) then
		WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Name:Hide();
		WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LongName:SetText(name);
		WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LongName:Show();
	else
		WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Name:Show();
		WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LongName:Hide();
	end
  if note then
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Label:SetText(note);
  else
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.Label:SetText(label);
  end
  
  --Set HiddenSetIcon based on hidden status
  if ExS_HiddenSets[CurrArmorType][setID] then
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetTexCoord(0,.5,0,1);
  else
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetTexCoord(.5,1,0,1);
  end
  
  --Set FavoriteSetIcon based on favorite status
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton.backgroundTexture:SetDesaturated(not ExS_Favorites[setID]);
  
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet:Show();
  if (requiredFaction ~= nil and requiredFaction ~= factionNames.playerFaction) then
    local atlas;
    if (requiredFaction == "Horde") then
      atlas = "worldquest-icon-horde";
      WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet.Text:SetText(ITEM_REQ_HORDE);
    else
      atlas = "worldquest-icon-alliance";
      WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet.Text:SetText(ITEM_REQ_ALLIANCE);
    end
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet.Icon:SetAtlas(atlas);
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet:SetScript("OnEnter", function(self) return; end);
  elseif limitedTimeSet then
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet.Text:SetText(TRANSMOG_SET_LIMITED_TIME_SET);
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
        GameTooltip_SetTitle(GameTooltip, TRANSMOG_SET_LIMITED_TIME_SET_TOOLTIP, NORMAL_FONT_COLOR, true);
        GameTooltip:Show();
      end);
  elseif noLongerObtainable then
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet.Icon:SetAtlas("transmog-icon-remove");
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet.Text:SetText("No longer obtainable.");
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet:SetScript("OnEnter", function(self) return; end);
  else
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LimitedSet:Hide();
  end
	
	--local newSourceIDs = C_TransmogSets.GetSetNewSources(setID);

	WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.itemFramesPool:ReleaseAll();
	local sortedSources = GetSortedSetSources(setID);
  local buttonSizing = { 37, -floor((#sortedSources - 1) * 37 / 2) };
  
  
    --WardrobeCollectionFrame.SetsCollectionFrame.Model:SetCustomRace(4, 1);
  WardrobeCollectionFrame.SetsCollectionFrame.Model:Undress()

	for i = 1, #sortedSources do
		local itemFrame = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.itemFramesPool:Acquire();
    
    itemFrame:SetScript("OnEnter",SetsFrame.AppearanceTooltipOnEnter);
  
    itemFrame.sourceID = sortedSources[i].sourceID;
    --itemFrame.altSourceID = GetAlternateSourceID(setID, itemFrame.sourceID);
		itemFrame.itemID = sortedSources[i].itemID;
    itemFrame.setID = setID;
		itemFrame.collected = sortedSources[i].collected;
		itemFrame.invType = sortedSources[i].invType;
		itemFrame.Icon:SetTexture(C_TransmogCollection.GetSourceIcon(itemFrame.sourceID));
    itemFrame.IconBorder:Hide();
    
    if itemFrame.CollectionIcon == nil then
      itemFrame.CollectionIcon = CreateFrame("frame", nil, itemFrame);
      itemFrame.CollectionIcon:SetPoint("CENTER",itemFrame,"TOP",0,2);
      itemFrame.CollectionIcon:SetSize(25,25);
      itemFrame.CollectionIcon.Icon = itemFrame.CollectionIcon:CreateTexture(nil, "OVERLAY");
      itemFrame.CollectionIcon.Icon:SetAllPoints();
      itemFrame.CollectionIcon.Icon:SetDrawLayer("OVERLAY", 2);
      itemFrame.CollectionIcon.Text = "";
      
      itemFrame.CollectionIcon:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
                GameTooltip_SetTitle(GameTooltip, self.Text, NORMAL_FONT_COLOR, true);
                GameTooltip:Show();
          end);
      itemFrame.CollectionIcon:SetScript("OnLeave", function(self)
                GameTooltip:Hide();
          end);
    end
    
    
    if HasAlternateSources(setID, itemFrame.sourceID) then
      if itemFrame.AltAppBorder == nil then
        itemFrame.AltAppBorder = itemFrame:CreateTexture(nil, "OVERLAY");
        itemFrame.AltAppBorder:SetPoint("BOTTOMLEFT", itemFrame, "BOTTOMLEFT", 0, 0);
        itemFrame.AltAppBorder:SetSize(33,36);
        itemFrame.AltAppBorder:SetDrawLayer("OVERLAY", 2);
        itemFrame.AltAppBorder:SetTexture([[Interface\Addons\ExtendedSets\textures\alt_vers_border.tga]]);
        itemFrame.AltAppBorder:SetTexCoord(0,130/256,0,175/256);
      end
      
      itemFrame.AltAppBorder:Show();
    elseif itemFrame.AltAppBorder then
      itemFrame.AltAppBorder:Hide();
    end
    
    if sortedSources[i].updatePending then
      if sortedSources[i].collected then
        itemFrame.itemFrameType = "CollectedUpdatePending";
      else
        itemFrame.itemFrameType = "NotCollectedUpdatePending";
      end
    elseif ( sortedSources[i].collected ) then
      if sortedSources[i].isCollectedChar then
        if sortedSources[i].otherClassCanCollect then
          itemFrame.itemFrameType = "OtherClassCanCollect";
        else
          itemFrame.itemFrameType = "Collected";
        end
      else
        if sortedSources[i].canCharCollectIt then
          itemFrame.itemFrameType = "CollectedCharCantUse";
        else
          itemFrame.itemFrameType = "CollectedCharCantGet";
        end
      end
		else
      if (not sortedSources[i].canCharCollectIt) then
        itemFrame.itemFrameType = "NotCollectedCharCantGet";
      else
        itemFrame.itemFrameType = "NotCollected";
      end
    end
    HandleItemFrames(itemFrame, false);
    
    itemFrame:SetScript("OnMouseDown", SetsFrame.ExS_SetSources_OnMouseDown);
		itemFrame:SetPoint("TOP", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame, "TOP", buttonSizing[2] + (i - 1) * buttonSizing[1], -94);
		itemFrame:Show();
    
		WardrobeCollectionFrame.SetsCollectionFrame.Model:TryOn(itemFrame.sourceID);
	end

	-- variant sets
	local variantSets = GetVariantSets(setID)--GetBaseSetID(setID));
	if ( #variantSets <= 1 )  then
		WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton:Hide();
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:ClearAllPoints();
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:SetPoint("TOPRIGHT", WardrobeSetsCollectionVariantSetsButton, "TOPRIGHT", 0, 0);
	else
		WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton:Show();
    if description == nil then
      WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton:SetText(name);
    else
      WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton:SetText(description);
    end
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:ClearAllPoints();
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:SetPoint("RIGHT", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton, "LEFT", -4, 0);
	end
end

--Helper function for checking if the search value is related to the given set.
local function SearchValueFound(set, searchValue)
  local start, _ = string.find(string.lower(set.name), searchValue);
  if start ~= nil then return true; end
  
  if set.label then
    start, _ = string.find(string.lower(set.label), searchValue);
    if start ~= nil then return true; end
  end
  
  local varSets = GetVariantSets(set.setID, false);
  
  for id,varSet in pairs(varSets) do
    start, _ = string.find(string.lower(varSet.name), searchValue);
    if start ~= nil then return true; end
  end
  
  return false;
end

local ignoreSearch = true;--don't update search when it first loads
local oldSearchValue = "";
--Update the list of sets based on the current search parameter (searching the name and source of the set).
local function OnSearchUpdate()
  if ignoreSearch then ignoreSearch = false; return; end --don't update search when it first loads

  local searchValue = string.lower(WardrobeCollectionFrameSearchBox:GetText());
  
  local updateSearchValueStart = string.find(searchValue, oldSearchValue);
  
  if    (updateSearchValueStart == 1 and strlen(oldSearchValue) < strlen(searchValue)) then
    for i = #BaseList, 1, -1 do
      if not SearchValueFound(BaseList[i], searchValue) then
        table.remove(BaseList, i);
      end
    end
    
  else
    wipe(BaseList);
    
    for _, baseSet in pairs(BaseSets) do
      if SearchValueFound(baseSet, searchValue) then
        table.insert(BaseList, baseSet);
      end
    end
    
    SetsFrame.SortSets(BaseList, false);
  end
  
  oldSearchValue = searchValue;
  
  SetsFrame.ExS_ScrollFrame_Update();
  
  if #BaseList > 0 then --Can happen if you set filters in a way to make an empty list.
    SetsFrame.ScrollToOffset(1, true, true, true);
    WardrobeCollectionFrame.SetsCollectionFrame:Refresh();
  end
end

-- Hide the current set if it is set to hidden (and show hidden sets option isn't checked)
local function HideSet(setID)
  if ExS_Settings.showHiddenSets then
    --if show sets, update the hide button to show its current show/hide state
    --note: not is because we are updating the button before updating the save show/hide state of the set
    if not ExS_HiddenSets[CurrArmorType][setID] then
      WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetTexCoord(0,.5,0,1);
      GameTooltip_SetTitle(GameTooltip, "Show Set", NORMAL_FONT_COLOR, true);
    else
      WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetTexCoord(.5,1,0,1);
      GameTooltip_SetTitle(GameTooltip, "Hide Set", NORMAL_FONT_COLOR, true);
    end
  else
    ExS_Settings.showHiddenSets = true;
    --else we are hiding sets, find the next best set to show
    local variants = GetVariantSets(GetBaseSetID(setID), true);
    local nextInBaseList = false;
    --if there is another variant, 
    if #variants > 1 then
      for i = 1, #variants do
        if variants[i].setID == setID then
          --after the variant is found, look down the list for a new variant to show
          local foundSet = false;
          if i < #variants then 
            for j = i + 1, #variants do
              if not ExS_HiddenSets[CurrArmorType][variants[j].setID] then
                foundSet = true;
                DisplaySet(nil, variants[j].setID);
                break;
              end
            end
          end
          --if still not found then look up the list for a new variant to show
          if not foundSet and i > 1 then
            for j = i - 1, 1, -1 do
              if not ExS_HiddenSets[CurrArmorType][variants[j].setID] then
                foundSet = true;
                DisplaySet(nil, variants[j].setID);
                break;
              end
            end
          end
          
          --if still no variant is found, then we need to move to a different set
          if not foundSet then
            nextInBaseList = true;
          end
          break;
        end
      end
    else
      nextInBaseList = true;
    end
    
    --get the next best set from the baselist
    if nextInBaseList and #BaseList > 1 then
      local baseSetID = GetBaseSetID(setID);
      for i = 1, #BaseList do
        if BaseList[i].setID == baseSetID then
          --once found, if we are not at the end of the list, use next set, otherwise the previous set.
          if i < #BaseList then
            DisplaySet(nil, BaseList[i+1].setID);
          else
            DisplaySet(nil, BaseList[i-1].setID);
          end
          table.remove(BaseList, i);
          SetsFrame.ExS_ScrollFrame_Update();
          break;
        end
      end
    end
    ExS_Settings.showHiddenSets = false;
  end
end

--Update Heritage Armors when the selected race is changed.
--local function UpdateBaseListHeritageArmors(oldRace, newRace)
--  local heritageToRemove = nil;
--  local heritageToAdd = nil;
--  for heritageID,raceID in pairs(heritageSets) do
--    if raceID == oldRace then
--      heritageToRemove = heritageID;
--    end
--    if raceID == newRace then
--      heritageToAdd = heritageID;
--    end
--  end
--  if heritageToRemove then
--    for i = 1, #BaseList do
--      if BaseList[i].setID == heritageToRemove then
--        table.remove(BaseList, i);
--        break;
--      end
--    end
--  end
--  if heritageToAdd ~= nil then
--    table.insert(BaseList, BaseSets[heritageToAdd]);
--    SetsFrame.SortSets(BaseList, false);
--  end
--end

--Create a drop down to select the variants of the selected set.
local function OpenVariantSetsDropDown()
	local selectedSetID = WardrobeCollectionFrame.SetsCollectionFrame:GetSelectedSetID();
  
	if ( not selectedSetID ) then
		return;
	end
  
  local dropdown = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown;
  dropdown:ClearLines();
  
	local info = {}
	local baseSetID = GetBaseSetID(selectedSetID);
  
  local prevClass = 0;
	local variantSets = GetVariantSets(baseSetID, true);
  
	for i = 1, #variantSets do
		local variantSet = variantSets[i];
    
    if (prevClass ~= variantSet.classMask and GetColoredClassNameString(variantSet.classMask) ~= "") then
      info.text = GetColoredClassNameString(variantSet.classMask);

      info.isRadio = false;
      info.checked = nil;
      info.isTitle = true;
      info.func = function() WardrobeCollectionFrame.SetsCollectionFrame.SelectSet(variantSet.setID, true); end;
      
      dropdown:AddLine(info);
      
      prevClass = variantSet.classMask;
      info.isTitle = false;
    end
    
    local variantID = variantSet.setID;
      
		local numSourcesCollected, numSourcesTotal, numUsable = GetSetSourceCounts(variantID);
		local colorCode = colors.IN_PROGRESS_FONT_COLOR_CODE;
    
    if numUsable < numSourcesCollected then
      colorCode = "|cffc8520f";
		elseif ( numSourcesCollected == numSourcesTotal ) then
			colorCode = NORMAL_FONT_COLOR_CODE;
		elseif ( numSourcesCollected == 0 ) then
			colorCode = GRAY_FONT_COLOR_CODE;
		end
    
    local desc = variantSet.description;
    if desc == nil then
      desc = variantSet.name;
    end
    if variantSet.requiredFaction ~= nil then
      desc = GetFactionColoredString(desc, variantSet.requiredFaction)
    end
    
		info.text = format(ITEM_SET_NAME, desc..colorCode, numSourcesCollected, numSourcesTotal);
    
		info.checked = (variantSet.setID == selectedSetID);
    info.isRadio = true;
		info.func = function() WardrobeCollectionFrame.SetsCollectionFrame.SelectSet(variantSet.setID, true); end;
    
    dropdown:AddLine(info);
	end
end

--Interpolate between two colors.
local function MergeColors(color1, color2, t)
  if t == 1 then
    return color2;
  elseif t == 0 then
    return color1;
  end

  local Cmax = max(color1.r, color1.g, color1.b);
  local Cmin = min(color1.r, color1.g, color1.b);
  local delta = Cmax - Cmin;
  
  local hue1;
  if delta == 0 then hue1 = 0;
  elseif Cmax == color1.r then
    hue1 = (((color1.g - color1.b) / delta));
  elseif Cmax == color1.g then
    hue1 = (((color1.b - color1.r) / delta) + 2);
  elseif Cmax == color1.b then
    hue1 = (((color1.r - color1.g) / delta) + 4);
  end
  if hue1 < 0 then hue1 = hue1 + 6; end
  local sat1 = 0;
  if Cmax ~= 0 then sat1 = delta / Cmax; end
  local val1 = Cmax;
  
  Cmax = max(color2.r, color2.g, color2.b);
  Cmin = min(color2.r, color2.g, color2.b);
  delta = Cmax - Cmin;
  
  local hue2;
  if delta == 0 then hue1 = 0;
  elseif Cmax == color2.r then
    hue2 = (((color2.g - color2.b) / delta));
  elseif Cmax == color2.g then
    hue2 = (((color2.b - color2.r) / delta) + 2);
  elseif Cmax == color2.b then
    hue2 = (((color2.r - color2.g) / delta) + 4);
  end
  if hue2 < 0 then hue2 = hue2 + 6; end
  local sat2 = 0;
  if Cmax ~= 0 then sat2 = delta / Cmax; end
  local val2 = Cmax;
    
  local angle = ((hue2 - hue1) + 3) % 6 - 3;
  
  local hue = hue1 + (angle * t) % 6;
  local sat = sat1 * (1.0 - t) + sat2 * t;
  local val = val1 * (1.0 - t) + val2 * t;
  
  local i = floor(hue);
  local f = hue - i;
  local p = val * (1 - sat);
  local q = val * (1 - sat * f);
  local t = val * (1 - sat * (1 - f));
  
  local retColor = {};
  if i == 0 then
    retColor.r = val;
    retColor.g = t;
    retColor.b = p;
  elseif i == 1 then
    retColor.r = q;
    retColor.g = val;
    retColor.b = p;
  elseif i == 2 then
    retColor.r = p;
    retColor.g = val;
    retColor.b = t;
  elseif i == 3 then
    retColor.r = p;
    retColor.g = q;
    retColor.b = val;
  elseif i == 4 then
    retColor.r = t;
    retColor.g = p;
    retColor.b = val;
  else
    retColor.r = val;
    retColor.g = p;
    retColor.b = q;
  end
  return retColor;
end

--Sets the Progress Bar at the top of the sets window.
local function UpdateProgressBar()
  CalculateCount();
	
	WardrobeCollectionFrame.progressBar:SetMinMaxValues(46, setStats.numberSets);
  WardrobeCollectionFrame.progressBar:SetValue(setStats.numberCollected);
	WardrobeCollectionFrame.progressBar.text:SetFormattedText(HEIRLOOMS_PROGRESS_FORMAT, setStats.numberCollected, setStats.numberSets);
  local percent = setStats.numberCollected / setStats.numberSets;
  
  local color = MergeColors(colors.LOW_PROGRESS_COLOR, colors.IN_PROGRESS_FONT_COLOR, percent);
  WardrobeCollectionFrame.progressBar:SetStatusBarColor(color.r, color.g, color.b);
end

-----------------------------------------------------------------------------------------------------------
  --Set Map/List/Hash Creation/Management--
-----------------------------------------------------------------------------------------------------------
----Fills in a list of Race IDs and localized Names.
--local function InitRaceIDs()
--  for _,id in pairs(raceIDs) do
--    table.insert(raceList, {raceID = id, raceName = C_CreatureInfo.GetRaceInfo(id).raceName});
--  end
--  
--  local comparison = function(race1,race2)
--                      if race1.raceName < race2.raceName then return true; end
--                      return false;
--                     end
--	table.sort(raceList, comparison);
--end

--Fills in the Class Name (localized) and the Index (for reading into the class masks map).
local function SetClassIDs(armorType)
	local localizedClass, _, classInd = UnitClass('player');
  if armorType then
    ArmorTypeRadio[armorType] = true;
    if armorType == ClassArmorType[classInd] then
      ClassName = localizedClass;
      ClassIndex = classInd;
      return;
    end
  
    for i,j in pairs(ClassArmorType) do
      if j == armorType then ClassName, _, ClassIndex = GetClassInfo(i); break; end
    end
    
  else
    ClassName = localizedClass;
    ClassIndex = classInd;
    _,_,currentRaceID = UnitRace('player');
    --defaultSex = UnitSex('player') - 2;
    --InitRaceIDs();
  end
end

local garbageCount = 0;
local function CollectTheGarbage()
  garbageCount = garbageCount + 1;
  if garbageCount == maxGarbage then
    collectgarbage();
    garbageCount = 0;
  end
end

local function ClearSets()
  alreadyFilled = false;
  wipe(BaseList);
  BaseList = {};
  wipe(BaseSets);
  BaseSets = {};
  wipe(BaseSetsPvPFlag);
  BaseSetsPvPFlag = {};
  wipe(BaseSetsData);
  BaseSetsData = {};
  wipe(VariantSets);
  VariantSets = {};
  wipe(VariantSetsIDs);
  VariantSetsIDs = {};
  wipe(NotUsedSets);
  NotUsedSets = {};
  wipe(BaseListLabels);
  BaseListLabels = {};
  
  CollectTheGarbage();
end

--local prevTime = 0;
--local function timeTest(doPrint, outputName)
--  local newTime = debugprofilestop();
--  if doPrint then
--    print(outputName,": ",newTime - prevTime);
--  end
--  local diff = newTime - prevTime;
--  prevTime = newTime;
--  return diff;
--end

local function InitializeSets(armorType, force, keepLabel)
  if (force == false) and armorType and ArmorTypeRadioIsChecked[armorType] then return; end
  
  local label;
  if keepLabel then
    label = VariantSets[VariantSetsIDs[ExS_ScrollFrame.selectedSetID]][1].label;
  end
  ExS_ScrollFrame.selectedSetID = nil;

  ClearSets();
  SetClassIDs(armorType);
  SetsFrame.FillSetMaps();
  alreadyFilled = true;
  
	--local firstSet = nil;
	--for _,set in pairs(BaseList) do
	--	firstSet = set;
	--	break;
	--end
  --if firstSet ~= nil then
  --  ExS_ScrollFrame.selectedSetID = firstSet.setID;
  --  WardrobeCollectionFrame.SetsCollectionFrame.selectedSetID = firstSet.setID;
  --end
  
  if not armorType then
    armorType = ClassArmorType[ClassIndex];
  end
  
  for i=1,4 do
    ArmorTypeRadioIsChecked[i] = false;
    if i == armorType then
      ArmorTypeRadioIsChecked[i] = true;
      CurrArmorType = i;
    end
  end
  
  
  local offset = 1;
  if keepLabel then
    for i=1,#BaseList do
      if BaseList[i].label == label then
        offset = i;
        break;
      end
    end
  end
  
  SetsFrame.ScrollToOffset(offset, true, true, true);
  UpdateProgressBar();
  
  local hiddenCount = 0;
  for a,b in pairs(ExS_HiddenSets[CurrArmorType]) do
    hiddenCount = hiddenCount + 1;
  end
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:SetText(hiddenCount);
  
  C_TransmogCollection.ClearSearch(1);
  C_TransmogCollection.ClearSearch(2);
  C_TransmogCollection.ClearSearch(3);
	WardrobeCollectionFrame.SetsCollectionFrame:Refresh();
  WardrobeCollectionFrame.FilterButton:Hide();
end

local function AddToVarSets(set, baseSetID)
  if not VariantSets[baseSetID] then
    VariantSets[baseSetID] = {};
  end
  
  set.baseSetID = baseSetID;
  tinsert(VariantSets[baseSetID], set)
  VariantSetsIDs[set.setID] = baseSetID;
end
local function MoveVarSetsIntoNewBase(set, newBaseID)
  if not VariantSets[newBaseID] then
    VariantSets[newBaseID] = {};
  end
  
  local baseID = set.baseSetID;
  --if not baseID then baseID = set.setID; end
  
  if VariantSets[baseID] then
    for i=1,#VariantSets[baseID] do
      tinsert(VariantSets[newBaseID], VariantSets[baseID][i]);
      VariantSetsIDs[VariantSets[baseID][i].setID] = newBaseID;
      VariantSets[baseID][i].baseSetID = newBaseID;
    end
  end
  if VariantSets[set.setID] then
    for i=1,#VariantSets[set.setID] do
      tinsert(VariantSets[newBaseID], VariantSets[set.setID][i]);
      VariantSetsIDs[VariantSets[set.setID][i].setID] = newBaseID;
      VariantSets[set.setID][i].baseSetID = newBaseID;
    end
  end
  
  set.baseSetID = newBaseID;
  VariantSets[baseID] = nil;
  VariantSets[set.setID] = nil;
end

--Sort the given set.
local function SortSets(sets, reverseUIOrder)
	local comparison = function(set1, set2)
		local groupFavorite1 = set1.favoriteSetID and true;
		local groupFavorite2 = set2.favoriteSetID and true;
		if ( groupFavorite1 ~= groupFavorite2 ) then
			return groupFavorite1;
		end
    
    if heritageSets[set1.setID] ~= nil and heritageSets[set2.setID] == nil then return true; end
    if heritageSets[set2.setID] ~= nil and heritageSets[set1.setID] == nil then return false; end
    if set1.label ~= set2.label then
      if set1.label == "Special" then return true; end
      if set2.label == "Special" then return false; end
      if set1.label == "Trading Post" then return true; end
      if set2.label == "Trading Post" then return false; end
      if set1.label == "Holiday" then return true; end
      if set2.label == "Holiday" then return false; end
    end
		if ( set1.expansionID ~= set2.expansionID ) then
			return set1.expansionID > set2.expansionID;
		end
		if ( set1.patchID ~= set2.patchID ) then
			return set1.patchID > set2.patchID;
		end
		if ( set1.uiOrder ~= set2.uiOrder ) then
			if ( reverseUIOrder ) then
				return set1.uiOrder < set2.uiOrder;
			else
				return set1.uiOrder > set2.uiOrder;
			end
		end
		return set1.setID > set2.setID;
	end

	table.sort(sets, comparison);
end

--Removes sets from baselist if they and all their varients are flagged to be hidden
local function RemoveHiddenSetsFromBaseList()
  for i=#BaseList, 1, -1 do
    if ExS_HiddenSets[CurrArmorType][BaseList[i].setID] then
      local variantSets = GetVariantSets(BaseList[i].setID);
      local removeFromList = true;
      for j = 1, #variantSets do
        if not ExS_HiddenSets[CurrArmorType][variantSets[j].setID] then
          removeFromList = false;
          break;
        end
      end
      if removeFromList then
        table.remove(BaseList, i);
      end
    end
  end
  SetsFrame.ScrollToSet(ExS_ScrollFrame.selectedSetID);
  --SetsFrame.ExS_ScrollFrame_Update();
end

--Check for if the set shouldn't be used in the collections window.
local function HideBlizzardSets(setID)
  local setsToHide = {[1822] = true, -- BfA Brawler's Garb (horde and alliance versions)
                      [1823] = true, -- BfA Brawler's Garb (horde and alliance versions)
                      [1902] = true, -- Renowned Explorer's Attire
                      [2485] = true, -- The extra Dracthyr Battlegear that showed for all armor weights
                      [2742] = true, --DF dup Primal Elements green set(cloth)
                      [2746] = true, --DF dup Primal Elements green set(leather)
                      [2744] = true, --DF dup Primal Elements green set(mail)
                      [2748] = true, --DF dup Primal Elements green set(plate)
    };
  
  --for i = 1, #setsToHide do
  --  if setID == setsToHide[i] then
  --    return true;
  --  end
  --end
  --return false;
  return setsToHide[setID];
end

--Check for if the set shouldn't be used in the transmogrify window.
local function HideSetsFromTransmogrify(setID)
  local setsToHide = {[1822] = true, -- BfA Brawler's Garb (horde and alliance versions)
                      [1823] = true, -- BfA Brawler's Garb (horde and alliance versions)
                      [1902] = true, -- Renowned Explorer's Attire
                      
                      [2748] = true, --DF dup Primal Elements green set(plate)
                      [2249] = true, --SL Season 2 Aspirant (Same as SL Dungeon Set)(Plate)
                      [2177] = true, --SL Season 1 Aspirant (Same as SL Dungeon Set)(Plate)
                      [1775] = true, --BfA Deathguard dup (Darkshore)(Plate)(Alliance)
                      [1665] = true, --BfA Honorbound dup (Arathi)(Plate)(Alliance)
                      [1745] = true, --BfA Deathguard dup (Darkshore)(Plate)(Horde)
                      [1677] = true, --BfA Honorbound dup (Arathi)(Plate)(Horde)
                      [1349] = true, --Legion Season 5/6, Plate dup (Horde)
                      [1379] = true, --Legion Season 5/6, Plate dup (Horde)
                      [1368] = true, --Legion Season 5/6, Plate dup (Alliance)
                      [1348] = true, --Legion Season 5/6, Plate dup (Alliance)
                      [1291] = true, --Legion Season 3/4, Plate dup (Horde)
                      [1269] = true, --Legion Season 3/4, Plate dup (Horde)
                      [1280] = true, --Legion Season 3/4, Plate dup (Alliance)
                      [1292] = true, --Legion Season 3/4, Plate dup (Alliance)
                      [1165] = true, --Legion Season 1/2, Plate dup (Horde)
                      [1069] = true, --Legion Season 1/2, Plate dup (Horde)
                      [1164] = true, --Legion Season 1/2, Plate dup (Alliance)
                      [1163] = true, --Legion Season 1/2, Plate dup (Alliance)
                      [46] = true, --WoD Season 3, Plate dup (Horde)
                      [49] = true, --WoD Season 3, Plate dup (Horde)
                      [48] = true, --WoD Season 3, Plate dup (Alliance)
                      [45] = true, --WoD Season 3, Plate dup (Alliance)
                      [18] = true, --WoD Season 2, Plate dup (Horde)
                      [21] = true, --WoD Season 2, Plate dup (Horde)
                      [19] = true, --WoD Season 2, Plate dup (Alliance)
                      [17] = true, --WoD Season 2, Plate dup (Alliance)
                      [67] = true, --WoD Season 1, Plate dup (Horde)
                      [71] = true, --WoD Season 1, Plate dup (Horde)
                      [70] = true, --WoD Season 1, Plate dup (Alliance)
                      [68] = true, --WoD Season 1, Plate dup (Alliance)
                      
                      [2744] = true, --DF dup Primal Elements green set(mail)
                      [2248] = true, --SL Season 2 Aspirant (Same as SL Dungeon Set)(Mail)
                      [2176] = true, --SL Season 1 Aspirant (Same as SL Dungeon Set)(Mail)
                      [1782] = true, --BfA Blightguard dup (Darkshore)(Mail)(Alliance)
                      [1662] = true, --BfA Honorbound dup (Arathi)(Mail)(Alliance)
                      [1752] = true, --BfA Blightguard dup (Darkshore)(Mail)(Horde)
                      [1674] = true, --BfA Honorbound dup (Arathi)(Mail)(Horde)
                      [1285] = true, --Legion Season 3/4, Mail Shaman/Hunter dup (Horde)
                      [1286] = true, --Legion Season 3/4, Mail Shaman/Hunter dup (Alliance)
                      [38] = true, --WoD Season 3, Mail Shaman/Hunter dup (Horde)
                      [37] = true, --WoD Season 3, Mail Shaman/Hunter dup (Alliance)
                      [16] = true, --WoD Season 2, Mail Shaman/Hunter dup (Horde)
                      [15] = true, --WoD Season 2, Mail Shaman/Hunter dup (Alliance)
                      [59] = true, --WoD Season 1, Mail Shaman/Hunter dup (Horde)
                      [58] = true, --WoD Season 1, Mail Shaman/Hunter dup (Alliance)
                      
                      [2746] = true, --DF dup Primal Elements green set(leather)
                      [2247] = true, --SL Season 2 Aspirant (Same as SL Dungeon Set)(leather)
                      [2175] = true, --SL Season 1 Aspirant (Same as SL Dungeon Set)(leather)
                      [1789] = true, --BfA Deathguard dup (Darkshore)(leather)(Alliance)
                      [1659] = true, --BfA Honorbound dup (Arathi)(leather)(Alliance)
                      [1759] = true, --BfA Deathguard dup (Darkshore)(leather)(Horde)
                      [1671] = true, --BfA Honorbound dup (Arathi)(leather)(Horde)
                      [1355] = true, --Legion Season 5/6, leather dup (Horde)
                      [1361] = true, --Legion Season 5/6, leather dup (Horde)
                      [1367] = true, --Legion Season 5/6, leather dup (Horde)
                      [1289] = true, --Legion Season 3/4, leather dup (Horde)
                      [1287] = true, --Legion Season 3/4, leather dup (Horde)
                      [1281] = true, --Legion Season 3/4, leather dup (Horde)
                      [1170] = true, --Legion Season 1/2, leather dup (Horde)
                      [1171] = true, --Legion Season 1/2, leather dup (Horde)
                      [1172] = true, --Legion Season 1/2, leather dup (Horde)
                      [1366] = true, --Legion Season 5/6, leather dup (Alliance)
                      [1360] = true, --Legion Season 5/6, leather dup (Alliance)
                      [1354] = true, --Legion Season 5/6, leather dup (Alliance)
                      [1282] = true, --Legion Season 3/4, leather dup (Alliance)
                      [1288] = true, --Legion Season 3/4, leather dup (Alliance)
                      [1290] = true, --Legion Season 3/4, leather dup (Alliance)
                      [1169] = true, --Legion Season 1/2, leather dup (Alliance)
                      [1168] = true, --Legion Season 1/2, leather dup (Alliance)
                      [1167] = true, --Legion Season 1/2, leather dup (Alliance)
                      [40] = true, --WoD Season 3, leather dup (Horde)
                      [43] = true, --WoD Season 3, leather dup (Horde)
                      [44] = true, --WoD Season 3, leather dup (Alliance)
                      [39] = true, --WoD Season 3, leather dup (Alliance)
                      [25] = true, --WoD Season 2, leather dup (Horde)
                      [27] = true, --WoD Season 2, leather dup (Horde)
                      [26] = true, --WoD Season 2, leather dup (Alliance)
                      [28] = true, --WoD Season 2, leather dup (Alliance)
                      [65] = true, --WoD Season 1, leather dup (Horde)
                      [61] = true, --WoD Season 1, leather dup (Horde)
                      [66] = true, --WoD Season 1, leather dup (Alliance)
                      [62] = true, --WoD Season 1, leather dup (Alliance)
                      
                      [2742] = true, --DF dup Primal Elements green set(cloth)
                      [2246] = true, --SL Season 2 Aspirant (Same as SL Dungeon Set)(cloth)
                      [2174] = true, --SL Season 1 Aspirant (Same as SL Dungeon Set)(cloth)
                      [1796] = true, --BfA Deathguard dup (Darkshore)(cloth)(Alliance)
                      [1656] = true, --BfA Honorbound dup (Arathi)(cloth)(Alliance)
                      [1766] = true, --BfA Deathguard dup (Darkshore)(cloth)(Horde)
                      [1668] = true, --BfA Honorbound dup (Arathi)(cloth)(Horde)
                      [1377] = true, --Legion Season 5/6, cloth dup (Horde)
                      [1371] = true, --Legion Season 5/6, cloth dup (Horde)
                      [1277] = true, --Legion Season 3/4, cloth dup (Horde)
                      [1271] = true, --Legion Season 3/4, cloth dup (Horde)
                      [1072] = true, --Legion Season 1/2, cloth dup (Horde)
                      [1160] = true, --Legion Season 1/2, cloth dup (Horde)
                      [1364] = true, --Legion Season 5/6, cloth dup (Alliance)
                      [1376] = true, --Legion Season 5/6, cloth dup (Alliance)
                      [1284] = true, --Legion Season 3/4, cloth dup (Alliance)
                      [1272] = true, --Legion Season 3/4, cloth dup (Alliance)
                      [1137] = true, --Legion Season 1/2, cloth dup (Alliance)
                      [1158] = true, --Legion Season 1/2, cloth dup (Alliance)
                      [51] = true, --WoD Season 3, cloth dup (Horde)
                      [55] = true, --WoD Season 3, cloth dup (Horde)
                      [53] = true, --WoD Season 3, cloth dup (Alliance)
                      [56] = true, --WoD Season 3, cloth dup (Alliance)
                      [32] = true, --WoD Season 2, cloth dup (Horde)
                      [33] = true, --WoD Season 2, cloth dup (Horde)
                      [29] = true, --WoD Season 2, cloth dup (Alliance)
                      [34] = true, --WoD Season 2, cloth dup (Alliance)
                      [75] = true, --WoD Season 1, cloth dup (Horde)
                      [73] = true, --WoD Season 1, cloth dup (Horde)
                      [78] = true, --WoD Season 1, cloth dup (Alliance)
                      [74] = true, --WoD Season 1, cloth dup (Alliance)
                      
                      [2305] = true, --Mage Tower Dup (Warrior)
                      [2300] = true, --Mage Tower Dup (Paladin)
                      [2294] = true, --Mage Tower Dup (DK)
                      [2303] = true, --Mage Tower Dup (Shaman)
                      [2297] = true, --Mage Tower Dup (Hunter)
                      [2296] = true, --Mage Tower Dup (Druid)
                      [2299] = true, --Mage Tower Dup (Monk)
                      [2295] = true, --Mage Tower Dup (DH)
                      [2302] = true, --Mage Tower Dup (Rogue)
                      [2298] = true, --Mage Tower Dup (Mage)
                      [2301] = true, --Mage Tower Dup (Priest)
                      [2304] = true, --Mage Tower Dup (Warlock)
    };
  
  --for i = 1, #setsToHide do
  --  if setID == setsToHide[i] then
  --    return true;
  --  end
  --end
  --return false;
  return setsToHide[setID];
end

local transmogrifyLevel = UnitLevel('player');
local _,_,transmogrifyRace = UnitRace('player');
local _,_,transmogrifyClass = UnitClass('player');
local transmogrifyFaction = UnitFactionGroup('player');
--Adds a set to the transmogrify list if it is usable.
local function UseSetForTransmogrify(data)
  if data.name == "PH" then return; end
  -- If this is a set to hide, don't use it. This check done first as it is super cheap.
  if HideSetsFromTransmogrify(data.setID) then return; end
  
  -- If it is a Heritage set, use if for current race.
  if heritageSets[data.setID] ~= nil then
    if heritageSets[data.setID] ~= transmogrifyRace then
      return;
    end
  end
  
  -- If this is for the other faction, don't use it.
  if (data.requiredFaction ~= nil) and not (data.requiredFaction == transmogrifyFaction) then return; end
  -- If this is from an expansion that is hidden by a filter setting, don't use it.
  -- For possible future use.
  --if data.expansionID > -1 and not ExS_Settings.expansionToggles[data.expansionID + 1] then return; end
  
  -- Check for correct class. (Or corect weight if displayOnlyMyClass is not checked).
  local ClassArmors = ClassMaskMap[transmogrifyClass];
  ----This would be if putting in a filter for not including class specific armors for the other classes in the player's weight.
  --if ExS_Settings.displayOnlyMyClass then
  --  if ClassIndex == nil or ClassIndex == select(3,UnitClass('player')) then
  --    ClassArmors = ClassArmorMask[transmogrifyClass];
  --  end
  --end
  local classCorrect = false;
  for i = 1, #ClassArmors do
    if data.classMask == ClassArmors[i] then
      classCorrect = true;
      break;
    end
  end
  if not classCorrect then return; end
  
  data.sources = GetSetSources(data.setID, data);
  -- If we are here and the set is complete, it can be added to the transmogrify list.
  if IsSetCompletedAndUsable(data.setID, data) then
    if SetsFrame.CombineIntoSpecial(data.setID) then data.label = "Special" end

    table.insert(SetsForTransmogrify, data);
  end
end

local transmogrifyOnlyCallback = false;
--Gettor for the transmogrify sets. Will Fill in the transmogrify table if it hasn't be filled yet.
local function GetUsableSets(force)
  if force then wipe(SetsForTransmogrify); SetsForTransmogrify = nil; wipe(SetsForTransmogrifyIndex); SetsForTransmogrifyIndex = nil; end
  if SetsForTransmogrify == nil then
    SetsForTransmogrify = {}
    SetsForTransmogrifyIndex = {}
    
    local sets = C_TransmogSets.GetAllSets();
    for _,data in pairs(sets) do
      UseSetForTransmogrify(data);
    end
    transmogrifyOnlyCallback = true;
    for _,callback in pairs(ExpandedCallbacks) do
      callback();
    end
    transmogrifyOnlyCallback = false;
    
    --sort list
    SortSets(SetsForTransmogrify);
    
    for i=1,#SetsForTransmogrify do
      SetsForTransmogrifyIndex[SetsForTransmogrify[i].setID] = i;
    end
  end
  
  return SetsForTransmogrify;
end

--Function to check if the set can be displayed with the current class and filters.
local function UseSet(data)
  -- If this is a set to hide, don't display it.
  if HideBlizzardSets(data.setID) then return false; end
  -- If it is a Heritage set, show/hide if for current race.
  if heritageSets[data.setID] ~= nil then
    if heritageSets[data.setID] == currentRaceID then
      if data.label == nil then data.label = "Heritage Set" end
      return true;
    else
      return false;
    end
  end
  -- If this the other faction and we are not showing other faction, don't display it.
  if (data.requiredFaction ~= nil and data.requiredFaction ~= factionNames.playerFaction) and (ExS_Settings.displayOtherFaction == false) then return false; end
  -- If this is from an expansion that is hidden, don't show it.
  if data.expansionID > -1 and not ExS_Settings.expansionToggles[data.expansionID + 1] then return false; end
  -- If we are hiding no longer obtainable and this set applies, don't show it.
  if (data.noLongerObtainable and ExS_Settings.hideNoLongerObtainable) then return false; end
  -- If we are hiding trading post sets, don't show it.
  if (data.tp and ExS_Settings.hideTradingPost) then return false; end
  -- If we are shop sets, don't show it.
  if (data.shop and ExS_Settings.hideShopsets) then return false; end
  
  -- Show/Hide based on PvP/PvE filters.
  if data.description ~= nil then
    local dataDescription = data.description;
    if (string.sub(data.description,1,1) == "|") then
      dataDescription = string.sub(data.description, 12, -3)
    end
    local isPvP = pvpDescriptions[dataDescription] or false;    
    
    if not ((isPvP and C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVP)) or
       (not isPvP and C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVE))) then
        return false;
    end
  elseif not C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVE) then
    return false;
  end
  
  -- Check for correct class. (Or corect weight if displayOnlyMyClass is not checked).
  local ClassArmors = ClassMaskMap[ClassIndex];
  if ExS_Settings.displayOnlyMyClass then
    if ClassIndex == nil or ClassIndex == select(3,UnitClass('player')) then
      ClassArmors = ClassArmorMask[ClassIndex];
    end
  end
  
  local classCorrect = false;
  for i = 1, #ClassArmors do
    if data.classMask == ClassArmors[i] then
      classCorrect = true;
      break;
    end
  end
  if not classCorrect then return false; end
  
  -- Show/Hide based on collection filters.
  local setSourceData = GetSetSourceData(data.setID, GetSetSources(data.setID, data), true)--GetSetSourceCounts(data.setID)
  
  if not ((setSourceData.collected and C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_COLLECTED)) or
     (not setSourceData.collected and C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_UNCOLLECTED))) then
     return false;
  end
  
  return true;
end

local function CombineIntoSpecial(setID)
  local setsToCombine = {
        1903, -- Wendigo Woolies
        1913, -- Vestments of the Eternal Traveler
        1914, -- Sprite Darter's Wings
        2200, -- Celestial Observer's Ensemble
        2482, -- Fireplume Regalia
        3085, -- High Scholar's Arcana
        2857, -- Waveborne Diplomat's Regalia
    };
    
  for i = 1, #setsToCombine do
    if setID == setsToCombine[i] then
      return true;
    end
  end
  return false;
end

--table for adding labels to sets that blizzard left without a label.
local setsCustomLabels = {
  [2481] = "Blood Elf Paladin",
  [2292] = "Timewalking (Legion)",
  [2484] = "Dark Ranger",
  [891] = "Naxxramas (Classic)",
  [924] = "Naxxramas (Classic)",
  [907] = "Naxxramas (Classic)",
  [355] = "Naxxramas (Classic)",
  [865] = "Naxxramas (Classic)",
  [873] = "Naxxramas (Classic)",
  [914] = "Naxxramas (Classic)",
  [850] = "Naxxramas (Classic)",
  [899] = "Naxxramas (Classic)",
  [3306] = "Trading Post",
}
local setsFlagTP = {
  [3487] = true,
  [2346] = true,
  [2340] = true,
  [3362] = true, --dark ranger general's kit
  [3649] = true, --deep diver
  [3650] = true, --deep diver
  [3651] = true, --deep diver
  [3652] = true, --deep diver
  [3644] = true, --swimwear
  [3645] = true, --swimwear
  [3646] = true, --swimwear
  [3647] = true, --swimwear
  [3636] = true, --swimwear (shorts)
  [3637] = true, --swimwear (shorts)
  [3638] = true, --swimwear (shorts)
  [3639] = true, --swimwear (shorts)
}
local setsFlagShop = {
  [1903] = true, -- wendigo woolies
  [2482] = true, -- fireplume regalia
  [2857] = true, -- waveborne diplomat's
  [2200] = true, -- celestial observer's
  [1913] = true, -- eternal traveler
  [1914] = true, -- sprite darter's
  [3085] = true, -- high scholar's
  [3355] = true, -- dreadlord's venombane
  [3634] = true, -- green murloc romper
  [3635] = true, -- purple murloc romper
}
local setsFlagNoLongerObtainable = {
  [3443] = true,
}

local function IsFavorite(setID)
  return ExS_Favorites[setID];
end

--Fills the Set Maps.
local function FillSetMaps()
  local sets = C_TransmogSets.GetAllSets();

  factionNames.playerFaction, _ = UnitFactionGroup('player');
  if factionNames.playerFaction == "Alliance" then
    factionNames.opposingFaction = "Horde";
  else
    factionNames.opposingFaction = "Alliance";
  end
  
  local firstSpecialSet = nil;
  local firstTradingPostSet = nil;

  for index, data in ipairs(sets) do
    if data.name ~= "PH" then
    if IsFavorite(data.setID) then
      data.favorite = true;
      data.favoriteSetID = data.setID;
    else
      data.favorite = false;
      data.favoriteSetID = nil;
    end
    
    if setsFlagNoLongerObtainable[data.setID] then
      data.noLongerObtainable = true;
    --If it was an old Rated armor set, flag it as no longer obtainable.
    elseif (data.description == "Elite") and not data.limitedTimeSet then
      data.noLongerObtainable = true;
    --Flag the Pandaria Challenge Mode Dungeons as no longer obtainable.
    elseif data.label == "Pandaria Challenge Dungeons" then
      data.noLongerObtainable = true;
    end
    --Check if there is an updated label.
    --This is either Blizz didn't give it a label or to seperate the 2 Naxxramas raids.
    if setsCustomLabels[data.setID] then
      data.label = setsCustomLabels[data.setID];
    end
    if app.altLabelDB[data.expansionID] and app.altLabelDB[data.expansionID][data.setID] then
      data.label = app.altLabelDB[data.expansionID][data.setID];
    elseif app.altLabelAppendDB[data.expansionID] and app.altLabelAppendDB[data.expansionID][data.setID] then
      data.label = data.label..app.altLabelAppendDB[data.expansionID][data.setID];
    end
    --Added trading post flag
    if data.label == "Trading Post" or setsFlagTP[data.setID] or (data.description and string.find(data.description, "Trading Post")) then
      data.tp = true;
    else
      data.tp = false;
    end
    --Added shop flag
    if data.description == "In-Game Shop" or setsFlagShop[data.setID] then
      data.shop = true;
    else
      data.shop = false;
    end
    if data.classMask == 16383 then data.classMask = 0 end
    
    local sources = GetSetSources(data.setID, data);
    AddSourcesToSetsMap(data.setID, sources)
    
    if data.classMask == 0 and CombineIntoSpecial(data.setID) then
            --updating some info for wendigo woolies
          if data.setID == 1903 then
            data.label = "Blizzcon 2019";
            data.noLongerObtainable = true;
            data.expansionID = -1;
          end
          
          if CombineIntoSpecial(data.setID) then
            data.note = data.label;
            data.label = "Special";
            data.expansionID = -1;
          end
          
          if UseSet(data) then            
            if data.label == "Special" then
              data.expansionID = -1;
              if firstSpecialSet == nil then
                firstSpecialSet = data.setID;
                BaseSets[data.setID] = data;
                if data.label then
                BaseListLabels[data.label] = data.setID; end
                table.insert(BaseList,data);
                AddToVarSets(data, data.setID);
              else
                data.baseSetID = firstSpecialSet;
                --AddSetToHash(data, firstSpecialSet);
                AddToVarSets(data, firstSpecialSet);
                if data.favorite then
                  local baseSet = GetSetByID(firstSpecialSet);
                  if not baseSet.favoriteSetID then
                    baseSet.favoriteSetID = data.setID;
                  end
                end
              end
            else
              BaseSets[data.setID] = data;
              table.insert(BaseList,data);
              if data.label then
              BaseListLabels[data.label] = data.setID; end
              AddToVarSets(data, data.setID);
            end
          else
            NotUsedSets[data.setID] = data;
          end
    elseif data.label == "Trading Post" then
      if UseSet(data) then
        if firstTradingPostSet == nil then
          firstTradingPostSet = data.setID;
          BaseSets[data.setID] = data;
          BaseListLabels[data.label] = data.setID;
          table.insert(BaseList,data);
          AddToVarSets(data, data.setID);
        else
          data.baseSetID = firstTradingPostSet;
          AddToVarSets(data, firstTradingPostSet);
          if data.favorite then
            local baseSet = GetSetByID(firstTradingPostSet);
            if not baseSet.favoriteSetID then
              baseSet.favoriteSetID = data.setID;
            end
          end
        end
      end
    elseif UseSet(data) then
      BaseSetsPvPFlag[data.setID] = pvpDescriptions[data.description] or false;
      
      
      --For Legion Class Hall Variants Dropdown
      if (data.description == nil) then
        if ClassNameMask[data.classMask] ~= nil then
          data.description = ClassNameMask[data.classMask];
        else
          data.description = data.name;
        end
      end
      
      
      if ClassNameMask[data.classMask] ~= nil then
        data.description = ColorStringByClass(data.description,data.classMask);
      end
      
      --add to either base or var sets
      --if (data.baseSetID == nil) then
        local combineWithOtherBaseSet = false;
        local otherBaseID;
        --for _, baseSet in pairs(BaseSets) do
        --  if (data.label == baseSet.label) then
        --    combineWithOtherBaseSet = true;
        --    otherBaseID = baseSet.setID;
        --    break;
        --  end
        --end
        if data.label and BaseListLabels[data.label] then
          combineWithOtherBaseSet = true;
          otherBaseID = BaseListLabels[data.label]
        end
        
        if not combineWithOtherBaseSet then --This is the first set, defaulting to base set.
          BaseSets[data.setID] = data;
          if data.label then
            BaseListLabels[data.label] = data.setID;
          end
          table.insert(BaseList,data);
          AddToVarSets(data, data.setID);--new
        else
          --if data.classMask == ClassToMask[ClassIndex] and BaseSets[otherBaseID].class ~= ClassToMask[ClassIndex] then --Making this the new base set.
          --  local otherBase = BaseSets[otherBaseID];
          --  
          --  if otherBase and otherBase.favoriteSetID and not data.favoriteSetID then
          --    data.favoriteSetID = otherBase.favoriteSetID;
          --  end
          --  if otherBase.tp then data.tp = true; end
          --  --otherBase.favoriteSetID = otherBase.favorite;--????
          --  
          --  AddToVarSets(data, data.setID);--new
          --  MoveVarSetsIntoNewBase(otherBase, data.setID);--new
          --  
          --  for j = #BaseList, 0, -1 do
          --    if (BaseList[j] == otherBase) then
          --      table.remove(BaseList, j);
          --      break;
          --    end
          --  end
          --  
          --  table.insert(BaseList, data);
          --  --if data.label then
          --    BaseListLabels[data.label] = data.setID;
          --  --end
          --  BaseSets[otherBase.setID] = nil;
          --  BaseSets[data.setID] = data;
          --else --Adding this set into an existing base set.
            if data.favorite then
              if not BaseSets[otherBaseID].favoriteSetID then
                BaseSets[otherBaseID].favoriteSetID = data.setID;
              end
            end
            if data.tp then
              BaseSets[otherBaseID].tp = true;
            end
            
            --AddSetToHash(data, otherBaseID);
            AddToVarSets(data, otherBaseID);--new
            --MoveVarSetsIntoNewBase(data, otherBaseID);
            data.baseSetID = otherBaseID;
            
            --local updateVarSets = SetsFrame.GetVariantSets(data.setID);
            --for id,set in pairs(updateVarSets) do
            --  RemoveSetFromHash(set);
            --  set.baseSetID = otherBaseID;
            --  AddSetToHash(set, otherBaseID);
            --end
          --end
        end
      --else
      --  local baseID = data.setID;
      --  
      --  if VariantSetsIDs[data.baseSetID] then
      --    baseID = VariantSetsIDs[data.baseSetID];
      --    data.baseSetID = baseID;
      --  elseif data.label and BaseListLabels[data.label] then
      --    baseID = BaseListLabels[data.label]
      --    data.baseSetID = baseID;
      --  end
      --  
      --  if ( data.favorite and BaseSets[baseID] and not BaseSets[baseID].favoriteSetID ) then
      --    BaseSets[baseID].favoriteSetID = data.setID;
      --  end
      --  if data.tp and baseID and BaseSets[baseID] then
      --    BaseSets[baseID].tp = true;
      --  end
      --  if data.label and not BaseListLabels[data.label] then
      --    BaseListLabels[data.label] = data.setID;
      --    table.insert(BaseList,data);
      --    BaseSets[data.setID] = data;
      --    AddToVarSets(data, data.setID);
      --  else
      --    AddToVarSets(data, baseID);
      --  end
      --  
      --  --AddSetToHash(data, baseID);
      --  
      --  --AddToVarSets(data, baseID);--new
      --  --if BaseSets[baseID] then
      --  --  MoveVarSetsIntoNewBase(data, baseID);
      --  --end
      --end
    else
      NotUsedSets[data.setID] = data;
    end
    end
  end
  
  for i,callback in pairs(ExpandedCallbacks)do
    if i==-1 or ExS_Settings.expansionToggles[i+1] then
      callback();
    end
  end
  
  
  --if not showing hidden sets, remove any fully hidden sets from the base list
  if not ExS_Settings.showHiddenSets then
    RemoveHiddenSetsFromBaseList();
  end
  
  
  if testSources then
    for a,b in pairs(BaseList) do 
    testSourceInfos(b.setID);
    end
    for a,b in pairs(VariantSetsIDs) do
    testSourceInfos(a);
    end
  end
  
  
  SetsFrame.SortSets(BaseList, false);
  
  alreadyFilled = true;
end

--Function that handles adding the sets from the extended sets files.
local function AddSetToTables(data)
  if data == nil or data.setID == nil then return; end --in case an empty set for some reason tries to get added.
  
  --if this callback was called because the transmogrify needs to be filled do just that
  if transmogrifyOnlyCallback then
    UseSetForTransmogrify(data);
    return;
  end
  
  AddSourcesToSetsMap(data.setID, data.sources)
  
  if not UseSet(data) then NotUsedSets[data.setID] = data; return; end
  
  data.favorite = IsFavorite(data.setID);
  if data.favorite then
    data.favoriteSetID = data.setID;
  end

  if data.description == "" or data.description == nil then data.description = data.name; end
  
  if ClassNameMask[data.classMask] ~= nil then
    data.description = ColorStringByClass(data.description,data.classMask);
  end
  
  local combineWithOtherBaseSet = false;
  local otherBaseID = 0;
  --for _, baseSet in pairs(BaseSets) do
  --  if (data.label ~= nil and baseSet.label ~= nil and data.label == baseSet.label) then
  --    combineWithOtherBaseSet = true;
  --    otherBaseID = baseSet.setID;
  --    if data.favorite and not baseSet.favoriteSetID then
  --      baseSet.favoriteSetID = data.setID;
  --    end
  --    break;
  --  end
  --end
  
  if data.label and BaseListLabels[data.label] then
    combineWithOtherBaseSet = true;
    otherBaseID = BaseListLabels[data.label]
  end
  
  if not combineWithOtherBaseSet then
    data.baseSetID = data.setID;
    BaseSets[data.setID] = data;
    BaseListLabels[data.label] = data.setID;
    table.insert(BaseList,data);
    AddToVarSets(data, data.setID);
  else
    data.baseSetID = otherBaseID;
    if data.tp then
      BaseSets[otherBaseID].tp = true;
    end
    --AddSetToHash(data, otherBaseID);
    AddToVarSets(data, otherBaseID);
  end
end

local function AddAltAppearancesToTables(setID, sourceID, altSourceID)
  local set = GetSetByID(setID);
  if set then
    if set.altSources == nil then
      set.altSources = {};
      set.altSources[sourceID] = { sourceID };
      set.altSourceNumbers = {};
      set.altSourceNumbers[sourceID] = 1;
      set.altNumber = 1;
    elseif set.altSources[sourceID] == nil then
      set.altSources[sourceID] = { sourceID };
      set.altSourceNumbers[sourceID] = 1;
    end
    tinsert(set.altSources[sourceID], altSourceID);
    --set.altSources[altSourceID] = sourceID;
  end
end

--Creates the buttons shown in the list on the left side of the sets window.
local function SetButtonData(button, set)
  local setInfo;
  --if NotUsedSets[set.setID] ~= nil then 
  --  setInfo = { topCollected = 0, topTotal = 1, completed = false, numSets = 1, numFinishedSets = 0, allCompleted = false, isPvP = false };
  --else
    setInfo = GetBaseSetData(set.setID);
  --end
  
  button.setID = set.setID;
  button:Show();
  
  --Sets the name for the button and its color based on completion.
  button.Name:SetText(set.name);
  local color;
  if setInfo.completed then
    color = NORMAL_FONT_COLOR;
  elseif setInfo.topCollected == 0 then
    color = GRAY_FONT_COLOR;
  else 
    color = colors.IN_PROGRESS_FONT_COLOR;
  end
  button.Name:SetTextColor(color.r, color.g, color.b);
  
  if setInfo.numSets > 1 then
    button.NumSets:SetShown(true);
    button.NumSets.label:SetText(setInfo.numSets);
  else
    button.NumSets:SetShown(false);
  end
  
  --Sets the sub-name on the button.
  button.Label:SetText(set.label);
  
  button.IconCover:Show();
  button.Icon:Show();
  if NotUsedSets[set.setID] ~= nil then 
    local setSource;
    if not NotUsedSets[set.setID].sources then 
      local setAppearances = C_TransmogSets.GetSetPrimaryAppearances(set.setID);
      NotUsedSets[set.setID].sources = {};
      for i, appearanceInfo in ipairs(setAppearances) do
        NotUsedSets[set.setID].sources[appearanceInfo.appearanceID] = appearanceInfo.collected;
        if not setSource then setSource = appearanceInfo.appearanceID; end
      end
    end
    for a,b in pairs(NotUsedSets[set.setID].sources) do setSource = a; break; end
    local _, _, _, _, icon = GetItemInfoInstant(C_TransmogCollection.GetSourceInfo(setSource).itemID);
    button.Icon:SetTexture(icon);
    button.IconCover:SetShown(true);
  else
    button.Icon:SetTexture(GetIconForSet(set.setID));
    button.IconCover:SetShown((set.setID == GetBaseSetID(ExS_ScrollFrame.selectedSetID)) or false);
  end

  button.Icon:SetDesaturation((setInfo.topCollected == 0) and 1 or 0);
  button.Favorite:SetShown(set.favoriteSetID);
  button.TradingPost:SetShown(set.tp);
  
  --Setting if special apperance needed for newness or selectedness.
  if NotUsedSets[set.setID] == nil then 
    button.New:SetShown(IsBaseSetNew(set.setID));
    button.SelectedTexture:SetShown(set.setID == GetBaseSetID(ExS_ScrollFrame.selectedSetID));
  else
    button.SelectedTexture:SetShown(true);
  end
  
  --Sets the Progress Bar and Color for set completion along bottom of the button.
  if setInfo.topCollected == 0 then
    button.ProgressBar:Hide();
    button.AltProgressBar:Hide();
  else
    button.ProgressBar:Show();
    if setInfo.completed then
      if setInfo.numUsableSets and setInfo.numUsableSets ~= setInfo.numFinishedSets then
        if setInfo.numUsableSets > 0 then
          button.ProgressBar:SetWidth(SET_PROGRESS_BAR_MAX_WIDTH * setInfo.numUsableSets / setInfo.numSets);
          button.ProgressBar:SetColorTexture(color.r, color.g, color.b);
          button.ProgressBar:Show();
        else
          button.ProgressBar:Hide();
        end
        button.AltProgressBar:SetWidth(SET_PROGRESS_BAR_MAX_WIDTH * setInfo.numFinishedSets / setInfo.numSets);
        button.AltProgressBar:Show();
      else
        button.ProgressBar:SetWidth(SET_PROGRESS_BAR_MAX_WIDTH * (setInfo.numFinishedSets or 1) / (setInfo.numSets or 1));
        button.ProgressBar:SetColorTexture(color.r, color.g, color.b);
        button.AltProgressBar:Hide();
      end
    else
      button.ProgressBar:SetWidth(SET_PROGRESS_BAR_MAX_WIDTH * setInfo.topCollected / setInfo.topTotal);
      button.ProgressBar:SetColorTexture(colors.IN_PROGRESS_FONT_COLOR.r, colors.IN_PROGRESS_FONT_COLOR.g, colors.IN_PROGRESS_FONT_COLOR.b);
      button.AltProgressBar:Hide();
    end
  end
end

-----------------------------------------------------------------------------------------------------------
  --Scroll Frame--
-----------------------------------------------------------------------------------------------------------

--Select a set. Optional additional input to make it just choose the given set and not find a default set for it.
local function ScrollFrame_SelectSet(setID, notDefault)
  if type(setID) ~= "number" then
    if type(notDefault) == "number" then
      setID = notDefault;
    else
      setID = setID.selectedSetID;
    end
  end
  local baseID = GetBaseSetID(setID);
  
  --Loop through the buttons updating the current selection and new status.
  for i = 1, #ExS_ScrollFrame.buttons do 
    if ExS_ScrollFrame.buttons[i]:IsShown() and ExS_ScrollFrame.buttons[i].setID ~= nil then 
      ExS_ScrollFrame.buttons[i].SelectedTexture:SetShown(baseID == GetBaseSetID(ExS_ScrollFrame.buttons[i].setID));
      ExS_ScrollFrame.buttons[i].IconCover:SetShown(baseID == GetBaseSetID(ExS_ScrollFrame.buttons[i].setID));
      ExS_ScrollFrame.buttons[i].New:SetShown(ResetBaseSetNewStatus(ExS_ScrollFrame.buttons[i].setID));
    end
	end
  
  if (not notDefault) and (baseID == setID) then
    setID = GetDefaultSetIDForBaseSet(baseID);
  end
  
	WardrobeCollectionFrame.SetsCollectionFrame.selectedSetID = setID;
	ExS_ScrollFrame.selectedSetID = setID;
  DisplaySet(nil,setID);
end

--Sets the scroll position and updates the buttons to have the data for where its scroll position is.
local function ScrollToOffset(offset, minimizeScrolling, setSet, forceEmptyList)
  if #BaseList == 0 and not forceEmptyList then return; end
  
	local index = 0;
	local currButton = 1;
  local offsetToSet = offset;
  local mutableOffset = offset;
  --local buttonsShown = floor(ExS_ScrollFrame:GetHeight() / _ButtonHeight);
  
  local currTop = ExS_ScrollFrame.buttons[1].setID;
  local currOffset = 0;
  
  --Loop through the List, updating the buttons once we get to the offset.
	for _, baseSet in pairs(BaseList) do
		if currButton > #ExS_ScrollFrame.buttons then
			break;
		end
		index = index + 1;
    
    
    if minimizeScrolling and ((baseSet.setID == currTop) or (index == mutableOffset)) then
      if (mutableOffset - index) > 0 then 
        if (mutableOffset - index + 1) < _ButtonsInFrame then
          mutableOffset = index;
        else
          mutableOffset = mutableOffset - _ButtonsInFrame + 1;
        end
      end
      minimizeScrolling = false;
    end
    
    --If we need to select the set, set it if we are there.
    if setSet and index == offsetToSet then
      if type(setSet) == "number" then
        ScrollFrame_SelectSet(setSet);
      else
        ScrollFrame_SelectSet(baseSet.setID);
      end
      setSet = false;
    end
    
    --If we are past the offset (don't need to check max as currButton does that).
    mutableOffset = math.floor(mutableOffset + 0.5); --was getting a weird floating point error
		if index >= mutableOffset then
      SetButtonData(ExS_ScrollFrame.buttons[currButton], baseSet);
      currButton = currButton + 1;
		end
	end
  
  --If there are leftover buttons, hide them.
	for i = currButton, #ExS_ScrollFrame.buttons do 
		ExS_ScrollFrame.buttons[i]:Hide();
	end
  
  
  local scrollMax = max((#BaseList - _ButtonsInFrame) * 46, 0);
  ExS_ScrollFrame.scrollBar:SetMinMaxValues(0, scrollMax);
	ExS_ScrollFrame.range = #BaseList * 46;
  
  --Update the scroll bar visual for our current scrolled position.
  ExS_ScrollFrame.scrollBar:SetValue(mutableOffset * 46);
end

--On scrolling update, scroll to offset
local function ExS_ScrollFrame_Update()
  local offset = ExS_ScrollFrame.scrollBar:GetValue() / 46;

  if #BaseList > 0 then
    ScrollToOffset(offset, false, false, false);
  end
end

--WIP
local function ScrollFrame_ScrollToSet(setID, id)
  if type(setID) == "table" then setID = tonumber(id); end
  WardrobeCollectionFrame:ClickTab(WardrobeCollectionFrameTab2);

  if NotUsedSets[setID] then 
    wipe(BaseList);
    table.insert(BaseList, NotUsedSets[setID]);
    ScrollToOffset(1, false, true);
    WardrobeCollectionFrameSearchBox:SetText("\""..NotUsedSets[setID].name.."\"");
    return;
  end
  local baseID = GetBaseSetID(setID);
	local totalHeight = 0;
  local offset = 1;
	--local scrollFrameHeight = ExS_ScrollFrame:GetHeight();
	local found = false;
	for _,set in pairs(BaseList) do
    if set.setID == baseID then
      found = true;
      break;
    end
    
    offset = offset + 1;
		totalHeight = totalHeight + _ButtonHeight;
	end
  
  if found then
    ScrollToOffset(offset, true, true);
  else
    ScrollToOffset(1);
  end
end

local function ScrollFrame_HandleKey(pKey)
  if WardrobeCollectionFrame.SetsCollectionFrame.selectedSetID == nil then return; end
	if pKey ~= WARDROBE_DOWN_VISUAL_KEY and pKey ~= WARDROBE_UP_VISUAL_KEY then
		ExS_ScrollFrame:SetPropagateKeyboardInput(true);
		return;
	end
	
  local baseID = GetBaseSetID(WardrobeCollectionFrame.SetsCollectionFrame.selectedSetID);
  
  local offset = 0;
  local foundSet = false;
  for _,set in pairs(BaseList) do
    offset = offset + 1;
    if set.setID == baseID then
      foundSet = true;
      break;
    end
  end
      
	ExS_ScrollFrame:SetPropagateKeyboardInput(false);
  --Down was pressed, get the next set.
  if pKey == WARDROBE_DOWN_VISUAL_KEY then
    if not foundSet then
      ScrollToOffset(1, true, true);
    elseif offset < #BaseList then
      ScrollToOffset(offset + 1, true, true);
    end
  --Up was pressed, get the previous set.
  elseif pKey == WARDROBE_UP_VISUAL_KEY then
    if not foundSet then
      ScrollToOffset(1, true, true);
    elseif offset > 1 then
      ScrollToOffset(offset - 1, true, true);
    end
  end
end

local function MarkSetAsFavorite(setID, markAsFav)
  local baseSet = GetSetByID(GetBaseSetID(setID));
  local favSet = GetSetByID(setID);
  
  favSet.favorite = markAsFav;
  ExS_Favorites[setID] = markAsFav or nil;
  
  --if setting it as fav, make it the base favorite set if there wasn't one already
  if markAsFav then
    if not baseSet.favoriteSetID then
      baseSet.favoriteSetID = setID;
    end
  else
    --else clear the favorite set ids
    favSet.favoriteSetID = nil;
    baseSet.favoriteSetID = nil;
    --and check if there is a different favorite to set as the favorite set
    local varSets = GetVariantSets(baseSet.setID);
    for i=1,#varSets do
      if varSets[i].favorite then
        varSets[i].favoriteSetID = varSets[i].setID;
        baseSet.favoriteSetID = varSets[i].setID;
        break;
      end
    end
  end
  SetsFrame.SortSets(BaseList, false);
  ExS_ScrollFrame_Update();
  if setID == ExS_ScrollFrame.selectedSetID then
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton.backgroundTexture:SetDesaturated(not ExS_Favorites[ExS_ScrollFrame.selectedSetID]);
  end
end

local function FavoriteDropDown_Init(button)
  _FavoriteDropDown:SetAnchor("TOPLEFT", button, "BOTTOMLEFT", 9, -7);
  
  local baseButtonSetID = SetsFrame.GetBaseSetID(ExS_ScrollFrame.menuInitBaseSetID);
  local baseButtonSet = GetSetByID(baseButtonSetID);
  
	local baseSelectedSetID = SetsFrame.GetBaseSetID(ExS_ScrollFrame.selectedSetID);
  local setID = baseButtonSetID;
  if (baseButtonSet.favoriteSetID ~= nil) then
    setID = baseButtonSet.favoriteSetID
  elseif (baseButtonSetID == baseSelectedSetID) then
    setID = ExS_ScrollFrame.selectedSetID;
  end
  
  if (setID ~= _FavoriteDropDown.setID) then
    if _FavoriteDropDown:IsShown() then _FavoriteDropDown:Toggle() end
    _FavoriteDropDown:ClearLines();
  
    local variantSets, anyHidden = SetsFrame.GetVariantSets(baseButtonSetID, true);
    local set = GetSetByID(setID);
    local useDescription = (#variantSets > 1);
    local desc = set.description;
    if desc == nil then desc = set.name; end

    local info = {}
    info.notCheckable = true;
    info.disabled = nil;

    --Link outfit option on list right click
    info.text = LINK_TRANSMOG_OUTFIT
    info.func = function() LinkSetInChat(setID); end
    
    _FavoriteDropDown:AddLine(info);
    
    --Favorite button
    if baseButtonSet.favoriteSetID then
      if useDescription then
        info.text = format(TRANSMOG_SETS_UNFAVORITE_WITH_DESCRIPTION, desc);
      else
        info.text = TRANSMOG_ITEM_UNSET_FAVORITE;
      end
      info.func = function()
        MarkSetAsFavorite(baseButtonSet.favoriteSetID, false);
      end
    else
      local targetSetID = WardrobeCollectionFrame.SetsCollectionFrame:GetDefaultSetIDForBaseSet(ExS_ScrollFrame.menuInitBaseSetID);
      if useDescription then
        info.text = format(TRANSMOG_SETS_FAVORITE_WITH_DESCRIPTION, desc);
      else
        info.text = TRANSMOG_ITEM_SET_FAVORITE;
      end
      info.func = function()
        MarkSetAsFavorite(setID, true);
      end
    end
    _FavoriteDropDown:AddLine(info);
    
    -- Hide All Variants of Set
    if ExS_Settings.disableHideSetButton then
        info.text = "Hide Sets Button Disabled."
        info.func = nil;
        info.disabled = true;
    else
      --No sets hidden, so hiding all sets.
      if not anyHidden then--hiddenCount == 0 then
        info.text = "Hide all versions of this set."
        info.func = function(self)
              local baseSetID = GetBaseSetID(ExS_ScrollFrame.menuInitBaseSetID);
              
              local varSets = VariantSets[baseSetID];
              if not varSets then
                varSets = {NotUsedSets[baseSetID]};
              end
              
              local hiddenLabel = tonumber(WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:GetText());
              for i=1, #varSets do
                if not ExS_HiddenSets[CurrArmorType][varSets[i].setID] then
                  ExS_HiddenSets[CurrArmorType][varSets[i].setID] = true;
                  hiddenLabel = hiddenLabel + 1;
                end
              end
              WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:SetText(hiddenLabel);
              
              if GetBaseSetID(ExS_ScrollFrame.selectedSetID) == baseSetID then
                local selectedSetID = ExS_ScrollFrame.selectedSetID;
                ExS_HiddenSets[CurrArmorType][selectedSetID] = nil;
                HideSet(ExS_ScrollFrame.selectedSetID);
                ExS_HiddenSets[CurrArmorType][selectedSetID] = true;
              elseif not ExS_Settings.showHiddenSets then
                RemoveHiddenSetsFromBaseList();
              end
            end
      else --at least one set is hidden, so show all sets.
        info.text = "Show all versions of this set."
        info.func = function(self)
              local baseSetID = GetBaseSetID(ExS_ScrollFrame.menuInitBaseSetID);
              
              local varSets = VariantSets[baseSetID];
              if not varSets then
                varSets = {NotUsedSets[baseSetID]};
              end
              
              local hiddenLabel = tonumber(WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:GetText());
              for i=1, #varSets do
                if ExS_HiddenSets[CurrArmorType][varSets[i].setID] then
                  ExS_HiddenSets[CurrArmorType][varSets[i].setID] = nil;
                  hiddenLabel = hiddenLabel - 1;
                end
              end
              WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:SetText(hiddenLabel);
              if GetBaseSetID(ExS_ScrollFrame.selectedSetID) == baseSetID then
                WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetTexCoord(.5,1,0,1);
                --GameTooltip_SetTitle(GameTooltip, "Hide Set", NORMAL_FONT_COLOR, true);
              end
            end
      end
    end
    _FavoriteDropDown:AddLine(info);
    info.disabled = false;
    
    -- Cancel
    info = {}
    info.notCheckable = true;
    info.text = CANCEL;
    _FavoriteDropDown:AddLine(info);
    
    _FavoriteDropDown.setID = setID;
  end
end

--function to handle toggling show/hiding hidden sets.
local function ShowHideSetsToggle()
  if ExS_Settings.showHiddenSets then
    ExS_Settings.showHiddenSets = false;
    while ExS_HiddenSets[CurrArmorType][ExS_ScrollFrame.selectedSetID] do
      HideSet(ExS_ScrollFrame.selectedSetID);
    end
    RemoveHiddenSetsFromBaseList();
    --WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetAtlas("worldquest-icon-raid");
    WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetTexCoord(0,.5,0,1);
  else
    ExS_Settings.showHiddenSets = true;
    wipe(BaseList);
    for a,b in pairs(BaseSets) do
      tinsert(BaseList, b);
    end
    SetsFrame.SortSets(BaseList, false);
    ScrollFrame_ScrollToSet(ExS_ScrollFrame.selectedSetID);
    --WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetAtlas("worldquest-icon-dungeon");
    WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetTexCoord(.5,1,0,1);
  end
end

local function CreateScrollbar(frame)
  --local defaultScrollFrame = WardrobeCollectionFrameScrollFrame;
  --if not defaultScrollFrame then
  --  defaultScrollFrame = WardrobeCollectionFrame.SetsCollectionFrame.ListContainer;
  --  --_ButtonHeight = defaultScrollFrame.ScrollBox:GetFrames()[1]:GetHeight();
  --  --_ButtonHeight = 46;
  ----else
  -- -- _ButtonHeight = defaultScrollFrame.buttons[1]:GetHeight();
  --end
	WardrobeCollectionFrame.SetsCollectionFrame.ListContainer:Hide();
	
	ExS_ScrollFrame = CreateFrame("ScrollFrame", "SetCollectionUngroupScrollFrame", WardrobeCollectionFrame.SetsCollectionFrame, "HybridScrollFrameTemplate");
	ExS_ScrollFrame:SetAllPoints(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer);
  
	ExS_ScrollFrame.scrollBar = CreateFrame("Slider", "SetCollectionUngroupScrollFrameScrollBar", ExS_ScrollFrame, "HybridScrollBarTrimTemplate");
  
  --Moving the scrollBar to be in the right place
	ExS_ScrollFrame.scrollBar:SetPoint("TOPRIGHT", WardrobeCollectionFrame.SetsCollectionFrame.LeftInset, "TOPRIGHT", -4, -53)
	ExS_ScrollFrame.scrollBar:SetPoint("BOTTOMLEFT", WardrobeCollectionFrame.SetsCollectionFrame.LeftInset, "BOTTOMRIGHT", -23.5, 18);
  WardrobeCollectionFrame.SetsCollectionFrame.LeftInset:SetWidth(282);
  WardrobeCollectionFrame.SetsCollectionFrame.RightInset:SetPoint("TOPLEFT", WardrobeCollectionFrame.SetsCollectionFrame.LeftInset, "TOPRIGHT", 0,0)
  ExS_ScrollFrame.scrollBar.trackBG:SetColorTexture(.22,0.2,0.19,0.25);
  
	ExS_ScrollFrame.scrollBar:SetScript("OnValueChanged", function(self, val)
          self.scrollValue = val;
          HybridScrollFrame_OnValueChanged(self, val);
          ExS_ScrollFrame_Update();
        end);
	ExS_ScrollFrame.scrollBar.trackBG:Show();
	--ExS_ScrollFrame.scrollBar.trackBG:SetVertexColor(0, 0, 0, 0.75);
	--ExS_ScrollFrame.scrollBar.scrollValue = 0;
  
	HybridScrollFrame_CreateButtons(ExS_ScrollFrame, "WardrobeSetsScrollFrameButtonTemplate", 44, 0);
  _ButtonHeight = ExS_ScrollFrame.buttons[1]:GetHeight()
  ExS_ScrollFrame.scrollBar:SetValueStep(_ButtonHeight);
  ExS_ScrollFrame.stepSize = _ButtonHeight;
  
	for _, button in pairs(ExS_ScrollFrame.buttons) do
		button:RegisterForClicks("AnyUp");
		button:SetScript("OnClick", function(pSelf, pButton, pDown)
			if pButton == "LeftButton" then
        if ( IsModifiedClick("CHATLINK") ) then
          local setID = button.setID;
          local baseSelectedSetID = SetsFrame.GetBaseSetID(ExS_ScrollFrame.selectedSetID);
          if (button.setID == baseSelectedSetID) then
            setID = ExS_ScrollFrame.selectedSetID;
          end
          LinkSetInChat(setID);
        else
          ScrollFrame_SelectSet(pSelf.setID);
        end
			elseif pButton == "RightButton" then
        ExS_ScrollFrame.menuInitBaseSetID = button.setID;
        FavoriteDropDown_Init(button);
        _FavoriteDropDown:Toggle();
			end
		end)
    button:SetScript("OnMouseUp", nil);--maybe
    
    button.Name:SetWidth(175);
    
    button.NumSets = CreateFrame("Frame", nil, button);
    button.NumSets:SetAllPoints();
    button.NumSets.icon = button.NumSets:CreateTexture(nil, "BACKGROUND");
    button.NumSets.icon:SetPoint("TOPRIGHT",button.NumSets, "TOPRIGHT", -8,-8);
    button.NumSets.icon:SetSize(10,10);
    button.NumSets.icon:SetTexture([[Interface\Addons\ExtendedSets\textures\multipleSymbol.tga]]);
    button.NumSets.icon:SetVertexColor(.8,.7,.4,.65);
    
    button.NumSets.label = button.NumSets:CreateFontString(nil, "OVERLAY", "GameTooltipText")
    button.NumSets.label:SetPoint("RIGHT",button.NumSets.icon,"LEFT",-1,0);
    button.NumSets.label:SetText("1");
    button.NumSets.label:SetTextColor(.8,.7,.4,.65);
    
    button.TradingPost = CreateFrame("Frame", nil, button);
    button.TradingPost:SetAllPoints();
    button.TradingPost.icon = button.TradingPost:CreateTexture(nil, "BACKGROUND");
    button.TradingPost.icon:SetPoint("BOTTOMRIGHT",button.TradingPost, "BOTTOMRIGHT", -1,1);
    button.TradingPost.icon:SetSize(12,12);
    button.TradingPost.icon:SetTexture(4696085);
    button.TradingPost.icon:SetDesaturation(.4);
    button.TradingPost.icon:SetVertexColor(.9,.85,.1,.45);
    button.TradingPost.icon:SetTexCoord(.2,.95,.1,.9);
    button.TradingPost.icon:SetRotation(math.pi);
    
    button.AltProgressBar = button:CreateTexture(nil, "ARTWORK");
    button.AltProgressBar:SetDrawLayer("ARTWORK", -1);
    button.AltProgressBar:SetPoint("BOTTOMLEFT", button.Background, "BOTTOMLEFT", 2, 2);
    button.AltProgressBar:SetSize(204,2);
    button.AltProgressBar:SetColorTexture(0.78, 0.32, 0.06);
    button.AltProgressBar:Show();
	end
  
  ExS_ScrollFrame.scrollBar:SetObeyStepOnDrag(true);
  
  _ButtonsInFrame = ExS_ScrollFrame:GetHeight() / _ButtonHeight;
	
  _FavoriteDropDown = LDD:NewMenu(ExS_ScrollFrame, "SetsFavDropdown");
  _FavoriteDropDown:SetStyle('MENU')
  _FavoriteDropDown.minWidth = 170
  _FavoriteDropDown:SetFrameLevel(500)
  
  _FavoriteDropDown:HookScript("OnShow", function() _FavoriteDropDown:RegisterEvent("GLOBAL_MOUSE_DOWN") end)
  _FavoriteDropDown:HookScript("OnHide", function() _FavoriteDropDown:UnregisterEvent("GLOBAL_MOUSE_DOWN") end)
  _FavoriteDropDown:HookScript("OnEvent", function(pSelf, pEvent, pUnit)
        if _FavoriteDropDown:IsShown() and not _FavoriteDropDown:IsMouseOver() then
          _FavoriteDropDown:Toggle();
        end
    end)

	ExS_ScrollFrame:SetScript("OnKeyDown", function(pSelf, pKey)
		ScrollFrame_HandleKey(pKey);
	end);
  
  
  
  -- Hidden Set Button --
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton = CreateFrame("Frame", "ExS_HiddenSetButton", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:SetSize(16,20);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:SetPoint("RIGHT", WardrobeSetsCollectionVariantSetsButton, "LEFT", -4, 0);

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:CreateTexture(nil, "BACKGROUND");
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetAllPoints();
  
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetTexture([[Interface\Addons\ExtendedSets\textures\ShowHideIcons.tga]]);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetTexCoord(0,.5,0,1);

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
    if ExS_HiddenSets[CurrArmorType][WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.setID] then
      GameTooltip_SetTitle(GameTooltip, "Show Set", NORMAL_FONT_COLOR, true);
    else
      GameTooltip_SetTitle(GameTooltip, "Hide Set", NORMAL_FONT_COLOR, true);
    end
    GameTooltip:Show();
  end);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide();
  end);
  
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton:SetScript("OnMouseUp", function(pSelf, pButton, pDown)
    if pButton == "LeftButton" and not ExS_Settings.disableHideSetButton then
      local setID = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.setID;
      HideSet(setID);
      ExS_HiddenSets[CurrArmorType][setID] = not ExS_HiddenSets[CurrArmorType][setID] or nil;
      local hiddenCount = tonumber(WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:GetText());
      if ExS_HiddenSets[CurrArmorType][setID] then hiddenCount = hiddenCount + 1;
      else hiddenCount = hiddenCount - 1; end
      WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:SetText(hiddenCount);
    end
  end);
  
  -- Favorite Set Button --
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton = CreateFrame("Frame", "ExS_FavoriteSetButton", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton:SetSize(16,20);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton:SetPoint("RIGHT", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton, "LEFT", -2, 0);

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton.backgroundTexture = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton:CreateTexture(nil, "BACKGROUND");
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton.backgroundTexture:SetPoint("CENTER");
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton.backgroundTexture:SetSize(22,22);
  
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton.backgroundTexture:SetAtlas("PetJournal-FavoritesIcon");

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
    if ExS_HiddenSets[CurrArmorType][WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.setID] then
      GameTooltip_SetTitle(GameTooltip, "Mark Set as Favorite", NORMAL_FONT_COLOR, true);
    else
      GameTooltip_SetTitle(GameTooltip, "Remove Set as Favorite", NORMAL_FONT_COLOR, true);
    end
    GameTooltip:Show();
  end);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide();
  end);
  
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton:SetScript("OnMouseUp", function(pSelf, pButton, pDown)
    if pButton == "LeftButton" then
      local setID = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.setID;
      MarkSetAsFavorite(setID, not ExS_Favorites[setID]);
    end
  end);
  
  -- Link Outfit Button --
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton = CreateFrame("Frame", "ExS_LinkOutfitButton", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton:SetSize(16,20);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton:SetPoint("RIGHT", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.FavoriteSetButton, "LEFT", -2, 0);

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton.backgroundTexture = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton:CreateTexture(nil, "BACKGROUND");
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton.backgroundTexture:SetAllPoints();
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton.backgroundTexture:SetAtlas("poi-transmogrifier");

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
    GameTooltip_SetTitle(GameTooltip, LINK_TRANSMOG_OUTFIT, NORMAL_FONT_COLOR, true);
    GameTooltip:Show();
  end);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide();
  end);
  
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton:SetScript("OnMouseUp", function(pSelf, pButton, pDown)
    if pButton == "LeftButton" then
      LinkSetInChat(ExS_ScrollFrame.selectedSetID);
    end
  end);
  ExS_AHButton:SetPoint("RIGHT", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton, "LEFT", -2, 0)
  
  -- Hidden Set Count --
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount = CreateFrame("Frame", nil, WardrobeCollectionFrame.SetsCollectionFrame);
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount:SetSize(40,20);
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount:SetPoint("BOTTOMRIGHT", WardrobeCollectionFrame.SetsCollectionFrame, "TOPRIGHT", 0, 6);

  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon = WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount:CreateTexture(nil, "BACKGROUND");
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetPoint("RIGHT");
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetSize(16,16);
  --WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetAtlas("worldquest-icon-dungeon");
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetTexture([[Interface\Addons\ExtendedSets\textures\ShowHideIcons.tga]]);
  if ExS_Settings.showHiddenSets then
    WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetTexCoord(.5,1,0,1);
  else
    WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon:SetTexCoord(0,.5,0,1);
  end
  
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text = WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount:CreateFontString(nil, "OVERLAY", "GameTooltipText");
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:SetPoint("RIGHT", WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Icon, "LEFT", -2,0);
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:SetJustifyH("RIGHT");
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:SetText("1");
  
  local function SetHiddenSetsTooltip()
    local str = WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount.Text:GetText().." Sets Marked Hidden. ";
    GameTooltip_SetTitle(GameTooltip, str, NORMAL_FONT_COLOR, true);
    local str2 = "";
    if ExS_Settings.showHiddenSets then
      str2 = str2.."Click to Hide hidden sets.";
    else
      str2 = str2.."Click to Show hidden sets.";
    end
    GameTooltip:AddLine(str2,.55,.55,.7);
    GameTooltip:Show();
  end
  
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
    SetHiddenSetsTooltip();
  end);
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount:SetScript("OnLeave", function(self)
    GameTooltip:Hide();
  end);
  
  WardrobeCollectionFrame.SetsCollectionFrame.HiddenSetsCount:SetScript("OnMouseUp", function(pSelf, pButton, pDown)
    ShowHideSetsToggle();
    SetHiddenSetsTooltip();
  end);
end

----
-- FILTER DropDown
----
local function ReInitSets(force, keepLabel)
  local setType;
  for i = 1, 4 do
    if (ArmorTypeRadioIsChecked[i]) then
      setType = i;
      break;
    end
  end
  InitializeSets(setType, force, keepLabel);
end

local function XpacPicker(self, button, index)
  ExS_Settings.expansionToggles[index] = not ExS_Settings.expansionToggles[index];
  ReInitSets(true, true);
  self:SetCheckedState(ExS_Settings.expansionToggles[index]);
end

local function ExS_FilterDropDown_Init(self, level, menuList)
  local info = {}
  info.isNotRadio = true;
 
  --if level == 1 then
    info.keepShown = true;
    info.text = COLLECTED;
    info.func = function(self)
            local state = not C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_COLLECTED);
            C_TransmogSets.SetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_COLLECTED, state);

            ReInitSets(true, true);
            self:SetCheckedState(state);
          end
    info.checked = function() return C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_COLLECTED) end;
    SetsFrame.FilterDropDown:AddLine(info);
  
    info.text = NOT_COLLECTED;
    info.func = function(self)
            local state = not C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_UNCOLLECTED);
            C_TransmogSets.SetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_UNCOLLECTED, state);

            ReInitSets(true, true);
            self:SetCheckedState(state);
          end
    info.checked = function() return C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_UNCOLLECTED) end;
    SetsFrame.FilterDropDown:AddLine(info);
  
    SetsFrame.FilterDropDown:AddLine({isSpacer = true;});
  
    info.text = TRANSMOG_SET_PVE;
    info.func = function(self)
            local state = not C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVE);
            C_TransmogSets.SetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVE, state);

            ReInitSets(true, true);
            self:SetCheckedState(state);
          end
    info.checked = function() return C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVE) end;
    SetsFrame.FilterDropDown:AddLine(info);
  
    info.text = TRANSMOG_SET_PVP;
    info.func = function(self)
            local state = not C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVP);
            C_TransmogSets.SetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVP, state);

            ReInitSets(true, true);
            self:SetCheckedState(state);
          end
    info.checked = function() return C_TransmogSets.GetBaseSetsFilter(LE_TRANSMOG_SET_FILTER_PVP) end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    SetsFrame.FilterDropDown:AddLine({isSpacer = true;});
    
    ----
    --  Settings
    ----
    
    --Show/Hide other faction sets
    info.text = factionNames.opposingFaction;
    info.func = function(self)
            if (ExS_Settings.displayOtherFaction == true) then
              ExS_Settings.displayOtherFaction = false;
            else
              ExS_Settings.displayOtherFaction = true;
            end
            
            ReInitSets(true, true);
            self:SetCheckedState(ExS_Settings.displayOtherFaction);
          end
    info.checked = function() return ExS_Settings.displayOtherFaction end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    --Show/Hide other class sets for player's armor weight
    info.text = "Show Only My Class's Sets";
    info.func = function(self)
            if (ExS_Settings.displayOnlyMyClass == true) then
              ExS_Settings.displayOnlyMyClass = false;
            else
              ExS_Settings.displayOnlyMyClass = true;
            end
            
            local setType;
            for i = 1, 4 do
              if (ArmorTypeRadioIsChecked[i]) then
                setType = i;
                break;
              end
            end
            
            if setType == ClassArmorType[transmogrifyClass] then
              InitializeSets(setType, true, true);
            end
            self:SetCheckedState(ExS_Settings.displayOnlyMyClass);
          end
    info.checked = function() return ExS_Settings.displayOnlyMyClass end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    --Show/Hide CharCollectionIcons
    info.text = "Show Character Collection Icons";
    info.tooltipText = "Shows a Red X above items that are not collected and cannot be collected by the current character's class. Shows a Red O above items that are collected but cannot be used by the current character's class. Shows an Orange O above items that have a class-specific version collected that cannot be transmogged by the current character's class, but has a non-class-specific version that can be collected.";
    info.tooltipOnButton = true;
    info.func = function(self)
            if (ExS_Settings.showCharCollectionIcons == true) then
              ExS_Settings.showCharCollectionIcons = false;
            else
              ExS_Settings.showCharCollectionIcons = true;
            end
            
            for itemFrame in WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.itemFramesPool:EnumerateActive() do
              SetsFrame.HandleItemFrames(itemFrame, false);
            end
            self:SetCheckedState(ExS_Settings.showCharCollectionIcons);
          end
    info.checked = function() return ExS_Settings.showCharCollectionIcons end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    info.tooltipText = "";
    info.tooltipOnButton = false;
    
    --Show/Hide no longer obtainable sets
    info.text = "Hide No Longer Obtainable Sets";
    info.func = function(self)
            if (ExS_Settings.hideNoLongerObtainable == true) then
              ExS_Settings.hideNoLongerObtainable = false;
            else
              ExS_Settings.hideNoLongerObtainable = true;
            end
            
            ReInitSets(true, true);
            self:SetCheckedState(ExS_Settings.hideNoLongerObtainable);
          end
    info.checked = function() return ExS_Settings.hideNoLongerObtainable end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    --Show/Hide trading post sets
    info.text = "Hide Trading Post Sets";
    info.func = function(self)
            if (ExS_Settings.hideTradingPost == true) then
              ExS_Settings.hideTradingPost = false;
            else
              ExS_Settings.hideTradingPost = true;
            end
            
            ReInitSets(true, true);
            self:SetCheckedState(ExS_Settings.hideTradingPost);
          end
    info.checked = function() return ExS_Settings.hideTradingPost end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    --Show/Hide shop sets
    info.text = "Hide Out of Game (Shop, etc.) Sets";
    info.func = function(self)
            if (ExS_Settings.hideShopsets == true) then
              ExS_Settings.hideShopsets = false;
            else
              ExS_Settings.hideShopsets = true;
            end
            
            ReInitSets(true, true);
            self:SetCheckedState(ExS_Settings.hideShopsets);
          end
    info.checked = function() return ExS_Settings.hideShopsets end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    --Show/Hide hidden sets
    info.text = "Show Hidden Sets";
    info.func = function(self)
              ShowHideSetsToggle();
              self:SetCheckedState(ExS_Settings.showHiddenSets);
          end
    info.checked = function() return ExS_Settings.showHiddenSets end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    --Disable Show/Hide hidden sets button
    info.text = "Disable Hide Set Button";
    info.func = function(self)
            ExS_Settings.disableHideSetButton = not ExS_Settings.disableHideSetButton;
            WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.HiddenSetButton.backgroundTexture:SetDesaturated(ExS_Settings.disableHideSetButton);
            self:SetCheckedState(ExS_Settings.disableHideSetButton);
          end
    info.checked = function() return ExS_Settings.disableHideSetButton end;
    SetsFrame.FilterDropDown:AddLine(info);
    
    SetsFrame.FilterDropDown:AddLine({isSpacer = true;});
    
    --
    -- Expansion Select opener
    --
    
    info.text = EXPANSION_FILTER_TEXT;
    info.func = nil;
    info.menu = {}
    
    for i = 1,ExpansionCount do
      local subInfo = {}
      subInfo.keepShown = true;
      
      if ExS_Settings.expansionToggles[i] == nil then ExS_Settings.expansionToggles[i] = true; end --will auto default new expansions to on as they are added.
      subInfo.text = _G["EXPANSION_NAME"..(i-1)];
      subInfo.func = XpacPicker
      subInfo.args = {i};
      subInfo.checked = function() return ExS_Settings.expansionToggles[i] end;
      
      tinsert(info.menu, subInfo);
    end
    SetsFrame.FilterDropDown:AddLine(info);
    
    info.menu = nil;
    
    SetsFrame.FilterDropDown:AddLine({isSpacer = true;});
    
    --
    -- Armor Type Select
    --
    
    info.keepShown = false;
    info.isRadio = true;
  
    local _,_,armortype = GetItemInfoInstant(165459);
    info.text = armortype;
    info.func = function(_, _, _, value)
            InitializeSets(4, false, true);
          end
    info.checked = function() return ArmorTypeRadioIsChecked[4] end
    SetsFrame.FilterDropDown:AddLine(info);
    
    local _,_,armortype = GetItemInfoInstant(166566);
    info.text = armortype;
    info.func = function(_, _, _, value)
            InitializeSets(3, false, true);
          end
    info.checked = function() return ArmorTypeRadioIsChecked[3] end
    SetsFrame.FilterDropDown:AddLine(info);
    
    local _,_,armortype = GetItemInfoInstant(165072);
    info.text = armortype;
    info.func = function(_, _, _, value)
            InitializeSets(2, false, true);
          end
    info.checked = function() return ArmorTypeRadioIsChecked[2] end
    SetsFrame.FilterDropDown:AddLine(info);
    
    local _,_,armortype = GetItemInfoInstant(165435);
    info.text = armortype;
    info.func = function(_, _, _, value)
            InitializeSets(1, false, true);
          end
    info.checked = function() return ArmorTypeRadioIsChecked[1] end
    SetsFrame.FilterDropDown:AddLine(info);
    
    
    ---- Race Select
    --
    --UIDropDownMenu_AddSeparator(level);
    --info.text = RESET_TO_DEFAULT;
    --info.func = function()
    --              WardrobeCollectionFrame.SetsCollectionFrame.Model:SetCustomRace(UnitRace("player"), defaultSex);
    --              WardrobeCollectionFrame.SetsCollectionFrame.Model:Undress();
    --              WardrobeTransmogFrame_EvaluateModel(true, true);
    --              DisplaySet(ExS_ScrollFrame.selectedSetID);
    --            end
    --info.notCheckable = true;
    --UIDropDownMenu_AddButton(info, level);
    --
    --info.text = RACE;
    --info.func = nil;
    --info.hasArrow = true;
    --info.menuList = "RaceList";
    --UIDropDownMenu_AddButton(info, level, info.menuList);
    --
    --info.text = MALE;
    --info.func = function()
    --              displayBools.displayFemale = 0;
    --              WardrobeCollectionFrame.SetsCollectionFrame.Model:SetCustomRace(currentRaceID, displayBools.displayFemale);
    --              WardrobeCollectionFrame.SetsCollectionFrame.Model:UpdatePanAndZoomModelType();
    --              DisplaySet(ExS_ScrollFrame.selectedSetID);
    --            end
    --info.notCheckable = false;
    --info.hasArrow = false;
    --info.menuList = nil;
    --info.checked = displayBools.displayFemale == 0;
    --UIDropDownMenu_AddButton(info, level);
    --
    --info.text = FEMALE;
    --info.func = function()
    --              displayBools.displayFemale = 1;
    --              WardrobeCollectionFrame.SetsCollectionFrame.Model:SetCustomRace(currentRaceID, displayBools.displayFemale);
    --              WardrobeCollectionFrame.SetsCollectionFrame.Model:UpdatePanAndZoomModelType();
    --              DisplaySet(ExS_ScrollFrame.selectedSetID);
    --            end
    --info.checked = displayBools.displayFemale == 1;
    --UIDropDownMenu_AddButton(info, level);
  --elseif (menuList == "RaceList") then
  --  info.isNotRadio = false;
  --  info.keepShownOnClick = false;
  --  
  --  local playerRace = UnitRace("player");
  --  for _,race in pairs(raceList) do
  --    if playerRace == race.raceName then
  --      info.text = ColorString(race.raceName.." ("..DEFAULT..")",0.2,0.8,0.4);
  --    else
  --      info.text = race.raceName;
  --      --info.text = race.raceName.."   (id = "..race.raceID..")";
  --    end
  --    info.func = function()
  --                  UpdateBaseListHeritageArmors(currentRaceID, race.raceID);
  --                  currentRaceID = race.raceID;
  --                  WardrobeCollectionFrame.SetsCollectionFrame.Model:SetCustomRace(currentRaceID, displayBools.displayFemale);
  --                  WardrobeCollectionFrame.SetsCollectionFrame.Model:UpdatePanAndZoomModelType();
  --                  WardrobeCollectionFrame.SetsCollectionFrame.Model:Undress();
  --                  WardrobeTransmogFrame_EvaluateModel(true, true);
  --                  WardrobeCollectionFrame.SetsCollectionFrame.Model:OnUpdate();
  --                  if heritageSets[ExS_ScrollFrame.selectedSetID] ~= nil then
  --                    ExS_ScrollFrame.selectedSetID = BaseList[1].setID;
  --                  end
  --                  DisplaySet(ExS_ScrollFrame.selectedSetID);
  --                  ScrollFrame_ScrollToSet(ExS_ScrollFrame.selectedSetID);
  --                end
  --    info.checked = race.raceID == currentRaceID;
  --    info.menuList = menu;
  --    UIDropDownMenu_AddButton(info, level);
  --  end
  --elseif (menuList == "ExpansionList") then
  --  info.isNotRadio = false;
  --  info.keepShownOnClick = true;
  --  info.menuList = nil;
  --  
  --  for i = 1,ExpansionCount do
  --    if ExS_Settings.expansionToggles[i] == nil then ExS_Settings.expansionToggles[i] = true; end --will auto default new expansions to on as they are added.
  --    info.text = _G["EXPANSION_NAME"..(i-1)];
  --    info.func = function()
  --                  ExS_Settings.expansionToggles[i] = not ExS_Settings.expansionToggles[i];
  --                  
  --                  local setType;
  --                  for i = 1, 4 do
  --                    if (ArmorTypeRadioIsChecked[i]) then
  --                      setType = i;
  --                      break;
  --                    end
  --                  end
  --                  InitializeSets(setType, true, true);
  --                end
  --    info.checked = ExS_Settings.expansionToggles[i];
  --    UIDropDownMenu_AddButton(info, level);
  --  end
  --end
end

function AppearanceTooltipOnEnter(self)
  SetsFrame.tooltipFrame = self;
  WardrobeCollectionFrame.SetsCollectionFrame.tooltipTransmogSlot = C_Transmog.GetSlotForInventoryType(self.invType);
  WardrobeCollectionFrame.SetsCollectionFrame.tooltipPrimarySourceID = self.sourceID;
  WardrobeCollectionFrame.tooltipContentFrame = WardrobeCollectionFrame.SetsCollectionFrame;
  
  WardrobeCollectionFrame.SetsCollectionFrame:RefreshAppearanceTooltip();
	self:SetScript("OnUpdate",
		function()
			if IsModifiedClick("DRESSUP") then
				ShowInspectCursor();
			else
				ResetCursor();
			end
		end
	);
	if ( self.New:IsShown() ) then
		local transmogSlot = C_Transmog.GetSlotForInventoryType(self.invType);
    if self.setID < ExpandedID then
      C_TransmogSets.ClearSetNewSourcesForSlot(self.setID, transmogSlot);
    end
    
    local visID = C_TransmogCollection.GetSourceInfo(self.sourceID).visualID;
    for i=0,#SetsFrame.NewVisualIDs do
      if SetsFrame.NewVisualIDs[i] == visID then
        table.remove(SetsFrame.NewVisualIDs, i);
        break;
      end
    end
    
		local baseSetID = GetBaseSetID(self.setID);
		ResetBaseSetNewStatus(baseSetID);
    
    HandleItemFrames(self, true);
    
		WardrobeCollectionFrame.SetsCollectionFrame:Refresh();
	end
end

----
-- Handles showing the tooltips for items in the SetSources row.
-- All Blizzard code save for setting sources variable which calls my GetSetSourcesForSlot and the last handful lines
----
local function RefreshAppearanceTooltip()
  local self = WardrobeCollectionFrame.SetsCollectionFrame;
	if ( not self.tooltipTransmogSlot ) then
		return;
	end
  
	local sources = GetSetSourcesForSlot(self.selectedSetID, self.tooltipTransmogSlot);

	if ( #sources == 0 ) then
		-- can happen if a slot only has HiddenUntilCollected sources
		local sourceInfo = C_TransmogCollection.GetSourceInfo(self.tooltipPrimarySourceID);
		tinsert(sources, sourceInfo);
	end
	CollectionWardrobeUtil.SortSources(sources, sources[1].visualID, self.tooltipPrimarySourceID);
  
  GameTooltip:SetOwner(SetsFrame.tooltipFrame, "RIGHT")
  WardrobeCollectionFrame.tooltipSourceIndex, WardrobeCollectionFrame.tooltipCycle = CollectionWardrobeUtil.SetAppearanceTooltip(GameTooltip, sources, self.tooltipPrimarySourceID, WardrobeCollectionFrame.tooltipSourceIndex, true)
end

--Handles Mouse click in the SetSources row.
--if Shift+Left Click, puts link in open chat
--if Ctrl+Left Click, preview in DressUp model
--else swaps appearance if multiple appearances for that slot
local function ExS_SetSources_OnMouseDown(button)
	if ( IsModifiedClick("CHATLINK") ) then
    local sources = GetSetSourcesForSlot(button.setID, WardrobeCollectionFrame.SetsCollectionFrame.tooltipTransmogSlot);
		if ( #sources == 0 ) then
			-- can happen if a slot only has HiddenUntilCollected sources
      local sourceInfo = C_TransmogCollection.GetSourceInfo(WardrobeCollectionFrame.SetsCollectionFrame.tooltipPrimarySourceID);
			tinsert(sources, sourceInfo);
		end
    
    CollectionWardrobeUtil.SortSources(sources, sources[1].visualID, WardrobeCollectionFrame.SetsCollectionFrame.tooltipPrimarySourceID);
		--WardrobeCollectionFrame_SortSources(sources, sources[1].visualID, WardrobeCollectionFrame.SetsCollectionFrame.tooltipPrimarySourceID);
		if ( WardrobeCollectionFrame.tooltipSourceIndex ) then
			local index = CollectionWardrobeUtil.GetValidIndexForNumSources(WardrobeCollectionFrame.tooltipSourceIndex, #sources);
			local link = select(6, C_TransmogCollection.GetAppearanceSourceInfo(sources[index].sourceID));
			if ( link ) then
				HandleModifiedItemClick(link);
			end
		end
	elseif ( IsModifiedClick("DRESSUP") ) then
    local sources = GetSetSourcesForSlot(button.setID, WardrobeCollectionFrame.SetsCollectionFrame.tooltipTransmogSlot);
		if ( #sources == 0 ) then
			-- can happen if a slot only has HiddenUntilCollected sources
      local sourceInfo = C_TransmogCollection.GetSourceInfo(WardrobeCollectionFrame.SetsCollectionFrame.tooltipPrimarySourceID);
			tinsert(sources, sourceInfo);
		end
    
		DressUpVisual(sources[1].sourceID);
  else
    SwapAlternateSourceID(button.setID, button.sourceID);
    ----For help filling in alt appearance db.
    --print(button.setID,"  setID--sourceID  ",button.sourceID,"    baseSet: ",GetSetByID(button.setID).baseSetID);
	end
end


------
--  Transmogrify
------
local function TransmogrifySwapAlternate(self, setID)
  local set = SetsForTransmogrify[SetsForTransmogrifyIndex[setID]];
  --local sourcesToSwap = {}
  --for sourceID,_ in pairs(set.sources) do
  --  if set.altSources[sourceID] then
  --    table.insert(sourcesToSwap, sourceID);
  --  end
  --end
  --local first;
  --local useFirst = false;
  --for a,b in pairs(set.altSourceNumbers) do
  --  if not first then first = a; end
  --  if b < #set.altSources[a] then
  --    set.altSourcesNumbers[a] = set.altSourceNumbers[a] + 1;
  --    
  --  else
  --  
  --  end
  --end
  --SwapAlternateSourceID(setID, GetNextAltBaseSourceIDForSet(set), set);
  SwapToNextSourceCombo(set)
  --for i=1,#sourcesToSwap do
  --  SwapAlternateSourceID(setID, sourcesToSwap[i], set);
  --end
  
  for i=1,#self.Models do
    if self.Models[i].setID == setID then
      self.Models[i]:Undress();
      for sourceID,_ in pairs(set.sources) do
        self.Models[i]:TryOn(sourceID);
      end
      if set.altNumber % 2 == 1 then
        self.Models[i].AltAppBorder.icon.iconA:Show();
        self.Models[i].AltAppBorder.icon.iconB:Hide();
      else
        self.Models[i].AltAppBorder.icon.iconA:Hide();
        self.Models[i].AltAppBorder.icon.iconB:Show();
      end
      break;
    end
  end
end

local function TransmogrifyUpdateSets(self, force)
  local self = WardrobeCollectionFrame.SetsTransmogFrame;
	local usableSets = GetUsableSets(force);
	self.PagingFrame:SetMaxPages(ceil(#usableSets / self.PAGE_SIZE));
	local pendingTransmogModelFrame = nil;
	local indexOffset = (self.PagingFrame:GetCurrentPage() - 1) * self.PAGE_SIZE;
	for i = 1, self.PAGE_SIZE do
		local model = self.Models[i];
		local index = i + indexOffset;
		local set = usableSets[index];
		if ( set ) then
			model:Show();
			if ( model.setID ~= set.setID ) then
				model:Undress();
				--local sourceData = GetSetSourceData(set.setID, set.sources);
        local sources = GetSetSources(set.setID, set);

        for sourceID,_ in pairs(sources) do
          model:TryOn(sourceID);
        end
			end
			local transmogStateAtlas;
			if ( set.setID == self.appliedSetID and set.setID == self.selectedSetID ) then
				transmogStateAtlas = "transmog-set-border-current-transmogged";
			elseif ( set.setID == self.selectedSetID ) then
				transmogStateAtlas = "transmog-set-border-selected";
				pendingTransmogModelFrame = model;
			end
			if ( transmogStateAtlas ) then
				model.TransmogStateTexture:SetAtlas(transmogStateAtlas, true);
				model.TransmogStateTexture:Show();
			else
				model.TransmogStateTexture:Hide();
			end
			model.Favorite.Icon:SetShown(set.favorite);
      if model.AltAppBorder == nil then
        model.AltAppBorder = model:CreateTexture(nil, "OVERLAY");
        model.AltAppBorder:SetPoint("BOTTOMLEFT", model, "BOTTOMLEFT", -8, -6);
        model.AltAppBorder:SetSize(100,100);
        model.AltAppBorder:SetDrawLayer("OVERLAY", 4);
        model.AltAppBorder:SetTexture([[Interface\Addons\ExtendedSets\textures\alt_vers_border.tga]]);
        model.AltAppBorder:SetTexCoord(0,130/256,0,175/256);
        --left, right, top, bottom
        
        model.AltAppBorder.icon = CreateFrame("Frame", nil, model);
        model.AltAppBorder.icon:SetSize(35,35);
        model.AltAppBorder.icon:SetPoint("BOTTOMLEFT", model.AltAppBorder, "BOTTOMLEFT", 11, 9);
        model.AltAppBorder.icon:SetScript("OnMouseDown", function()
            TransmogrifySwapAlternate(self, model.setID);
          end)
        
        model.AltAppBorder.icon.iconA = model.AltAppBorder.icon:CreateTexture(nil, "OVERLAY");
        model.AltAppBorder.icon.iconA:SetAllPoints(model.AltAppBorder.icon)
        model.AltAppBorder.icon.iconA:SetTexture([[Interface\Addons\ExtendedSets\textures\alt_vers_border.tga]]);
        model.AltAppBorder.icon.iconA:SetTexCoord(130/256,1,0,125/256);
        
        model.AltAppBorder.icon.iconB = model.AltAppBorder.icon:CreateTexture(nil, "OVERLAY");
        model.AltAppBorder.icon.iconB:SetAllPoints(model.AltAppBorder.icon)
        model.AltAppBorder.icon.iconB:SetTexture([[Interface\Addons\ExtendedSets\textures\alt_vers_border.tga]]);
        model.AltAppBorder.icon.iconB:SetTexCoord(130/256,1,125/256,1);
      end
      
      if set.altSources then
        model.AltAppBorder:Show();
        model.AltAppBorder.icon:Show();
        if set.altNumber == 1 then
          model.AltAppBorder.icon.iconA:Show();
          model.AltAppBorder.icon.iconB:Hide();
        else
          model.AltAppBorder.icon.iconA:Hide();
          model.AltAppBorder.icon.iconB:Show();
        end
      else
        model.AltAppBorder:Hide();
        model.AltAppBorder.icon:Hide();
      end
			model.setID = set.setID;
		else
			model:Hide();
		end
	end
	if ( pendingTransmogModelFrame ) then
		self.PendingTransmogFrame:SetParent(pendingTransmogModelFrame);
		self.PendingTransmogFrame:SetPoint("CENTER");
		self.PendingTransmogFrame:Show();
		if ( self.PendingTransmogFrame.setID ~= pendingTransmogModelFrame.setID ) then
			self.PendingTransmogFrame.TransmogSelectedAnim:Stop();
			self.PendingTransmogFrame.TransmogSelectedAnim:Play();
			self.PendingTransmogFrame.TransmogSelectedAnim2:Stop();
			self.PendingTransmogFrame.TransmogSelectedAnim2:Play();
			self.PendingTransmogFrame.TransmogSelectedAnim3:Stop();
			self.PendingTransmogFrame.TransmogSelectedAnim3:Play();
			self.PendingTransmogFrame.TransmogSelectedAnim4:Stop();
			self.PendingTransmogFrame.TransmogSelectedAnim4:Play();
			self.PendingTransmogFrame.TransmogSelectedAnim5:Stop();
			self.PendingTransmogFrame.TransmogSelectedAnim5:Play();
		end
		self.PendingTransmogFrame.setID = pendingTransmogModelFrame.setID;
	else
		self.PendingTransmogFrame:Hide();
	end
	self.NoValidSetsLabel:SetShown(not C_TransmogSets.HasUsableSets()); --this needs changing
end

--Called when a set is clicked on to load it into the pending transmog.
local function TransmogrifyLoadSet(self, setID)
	local waitingOnData = false;
	local transmogSources = { };
  
  local sources = SetsForTransmogrify[SetsForTransmogrifyIndex[setID]].sources--GetSetSources(setID);
  
	for sourceID,_ in pairs(sources) do
		local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
		local slot = C_Transmog.GetSlotForInventoryType(sourceInfo.invType);
    local tmogLocation = TransmogUtil.CreateTransmogLocation(slot, Enum.TransmogType.Appearance, Enum.TransmogModification.Main);
    local slotSources = C_TransmogCollection.GetAppearanceSources(sourceInfo.visualID, sourceInfo.categoryID, tmogLocation);
		CollectionWardrobeUtil.SortSources(slotSources, sourceInfo.visualID);
		local index = CollectionWardrobeUtil.GetDefaultSourceIndex(slotSources, sourceID);
		transmogSources[slot] = slotSources[index].sourceID;
		for i, slotSourceInfo in ipairs(slotSources) do
			if ( not slotSourceInfo.name ) then
				waitingOnData = true;
			end
		end
    
	end
  for i=1,#hiddenVisuals do
    if hiddenVisuals[i][1] ~= 0 then
      if transmogSources[i] == nil then
        transmogSources[i] = select(2,C_TransmogCollection.GetItemInfo(hiddenVisuals[i][2]))
      end
    end
  end
	if ( waitingOnData ) then
		self.loadingSetID = setID;
	else
		self.loadingSetID = nil;
		local transmogLocation, pendingInfo;
    
		for slotID, appearanceID in pairs(transmogSources) do
			if transmogLocation then
				transmogLocation.slotID = slotID;
			else
				transmogLocation = TransmogUtil.CreateTransmogLocation(slotID, Enum.TransmogType.Appearance, Enum.TransmogModification.Main);
			end
			if pendingInfo then
				pendingInfo.transmogID = appearanceID;
			else
				pendingInfo = TransmogUtil.CreateTransmogPendingInfo(Enum.TransmogPendingType.Apply, appearanceID);
			end
			C_Transmog.SetPending(transmogLocation, pendingInfo);
      local baseSourceID,baseVisID,appVisID,_,pendVisID,_ = C_Transmog.GetSlotVisualInfo(transmogLocation)
      if appearanceID ~= hiddenVisuals[slotID][1] and not (baseVisID == appearanceID or baseSourceID == appearanceID or appVisID == appearanceID) and pendVisID ~= appearanceID then
        local _, _, _, canTransmogrify = C_Transmog.GetSlotInfo(transmogLocation)
        if canTransmogrify then
          local set = GetSetByID(setID);
          SilentError("Failed to apply set at transmogrifier.\nSet: ",set.name,"\nSet Label: ",set.label,"\nSet ID: ",setID,"\nCharacter Level: ",transmogrifyLevel);
        end
      end
			-- for slots that are be split, undo it
			if C_Transmog.CanHaveSecondaryAppearanceForSlotID(slotID) then
				local secondaryTransmogLocation = TransmogUtil.CreateTransmogLocation(slotID, Enum.TransmogType.Appearance, Enum.TransmogModification.Secondary);
				local itemLocation = ItemLocation:CreateFromEquipmentSlot(slotID);
				if TransmogUtil.IsSecondaryTransmoggedForItemLocation(itemLocation) then
					local secondaryPendingInfo = TransmogUtil.CreateTransmogPendingInfo(Enum.TransmogPendingType.ToggleOff);
					C_Transmog.SetPending(secondaryTransmogLocation, secondaryPendingInfo);
				else
					C_Transmog.ClearPending(secondaryTransmogLocation);
				end
			end
		end
	end
end

--Reset Page
function TransmogrifyResetPage()
  local self = WardrobeCollectionFrame.SetsTransmogFrame;
	local page = 1;
  
	if ( self.selectedSetID ) then
		local usableSets = GetUsableSets();
		self.PagingFrame:SetMaxPages(ceil(#usableSets / self.PAGE_SIZE));
		for i, set in ipairs(usableSets) do
			if ( set.setID == self.selectedSetID or set.setID == setID ) then
				page = floor((i-1) / self.PAGE_SIZE) + 1;
				break;
			end
		end
	end
	self.PagingFrame:SetCurrentPage(page);
	self:UpdateSets();
end

local function TransmogrifyGetFirstMatchingSetID(self,sourceIndex)
  if self.selectedSetID then return self.selectedSetID end
	local transmogSourceIDs = { };
	for _, button in ipairs(WardrobeTransmogFrame.SlotButtons) do
		if not button.transmogLocation:IsSecondary() then
			local sourceID = select(sourceIndex, TransmogUtil.GetInfoForEquippedSlot(button.transmogLocation));
			if ( sourceID ~= Constants.Transmog.NoTransmogID ) then
				transmogSourceIDs[button.transmogLocation:GetSlotID()] = C_TransmogCollection.GetSourceInfo(sourceID).visualID;
			end
		end
	end
	local usableSets = GetUsableSets();
	for _, set in ipairs(usableSets) do
		local setMatched = false;
		for slotID, transmogSourceID in pairs(transmogSourceIDs) do
			local appID = GetSetSourcesForSlot(set.setID, slotID,set.sources,true);
				if ( transmogSourceID == appID ) then
					setMatched = true;
					break;
				end
		end
		if ( setMatched ) then
			return set.setID;
		end
	end
	return nil;
end

--On Page Change. This is mostly copy/pasta. The GameTooltip doesn't refresh on page change, so need to refresh the tooltip on page change. =/
local function TransmogrifyOnPageChanged(self, userAction)
	PlaySound(SOUNDKIT.UI_TRANSMOG_PAGE_TURN);
	CloseDropDownMenus();
	if ( userAction ) then
		self:UpdateSets();
    if self.tooltipModel then
      self.tooltipModel:RefreshTooltip();
    end
	end
end

--Handles clicking on a transmog set.
local function TransmogrifyOnMouseDown(self, button)
	if ( button == "LeftButton" ) then
    self:GetParent().selectedSetID = self.setID;
    self:GetParent():LoadSet(self.setID);
    self:GetParent():ResetPage();
  
		PlaySound(SOUNDKIT.UI_TRANSMOG_ITEM_CLICK);
	elseif ( button == "RightButton" ) then
		--local dropDown = self:GetParent().RightClickDropDown;
		--if ( dropDown.activeFrame ~= self ) then
		--	CloseDropDownMenus();
		--end
		WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown.activeFrame = self;
    WardrobeCollectionFrame.SetsTransmogFrame.OpenRightClickDropDown();
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:Toggle();
		--ToggleDropDownMenu(1, nil, dropDown, self, -6, -3);
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	end
end

--Refresh Tooltip
local function TransmogrifyRefreshTooltip(self)
	local totalQuality = 0;
	local numTotalSlots = 0;
	local waitingOnQuality = false;
	local sourceQualityTable = self:GetParent().sourceQualityTable;
  
  local sources = GetSetSources(self.setID);
	for sourceID,_ in pairs(sources) do
		numTotalSlots = numTotalSlots + 1;
		if ( sourceQualityTable[sourceID] ) then
			totalQuality = totalQuality + sourceQualityTable[sourceID];
		else
			local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID);
			if ( sourceInfo and sourceInfo.quality ) then
				sourceQualityTable[sourceID] = sourceInfo.quality;
				totalQuality = totalQuality + sourceInfo.quality;
			else
				waitingOnQuality = true;
			end
		end
	end
	if ( waitingOnQuality ) then
		GameTooltip:SetText(RETRIEVING_ITEM_INFO, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b);
	else
		local setQuality = (numTotalSlots > 0 and totalQuality > 0) and Round(totalQuality / numTotalSlots) or Enum.ItemQuality.Common;
		local color = ITEM_QUALITY_COLORS[setQuality];
		local setInfo = GetSetByID(self.setID);
		GameTooltip:SetText(setInfo.name, color.r, color.g, color.b);
		if ( setInfo.label ) then
			GameTooltip:AddLine(setInfo.label);
			GameTooltip:Show();
		end
	end
end

--Right click on set
local function TransmogrifyOpenRightClickDropDown()
  --local self = WardrobeCollectionFrame.SetsTransmogFrame;
	if ( not WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown.activeFrame ) then
		return;
	end
  
  WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:ClearLines();
  WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:SetAnchor('TOPLEFT', WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown.activeFrame, 'BOTTOMLEFT', 7, -10)
	local setID = WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown.activeFrame.setID;
	local info = {}--UIDropDownMenu_CreateInfo();
  -- Set Favorite
	if ( C_TransmogSets.GetIsFavorite(setID) ) then
		info.text = BATTLE_PET_UNFAVORITE;
		info.func = function() WardrobeCollectionFrame.SetsTransmogFrame:SetFavorite(setID, false); end
	else
		info.text = BATTLE_PET_FAVORITE;
		info.func = function() WardrobeCollectionFrame.SetsTransmogFrame:SetFavorite(setID, true); end
	end
	--info.notCheckable = true;
	--UIDropDownMenu_AddButton(info);
  WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:AddLine(info);
  -- Swap to Alt Appearance
  if SetsForTransmogrify[SetsForTransmogrifyIndex[setID]].altSources then
    info = {}--UIDropDownMenu_CreateInfo();
    --info.notCheckable = true;
    info.text = "Swap to Alt Appearance";
    info.func = function()
      TransmogrifySwapAlternate(WardrobeCollectionFrame.SetsTransmogFrame, setID);
    end
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:AddLine(info);
    --UIDropDownMenu_AddButton(info);
  end
	-- Cancel
	info = {}--UIDropDownMenu_CreateInfo();
	--info.notCheckable = true;
	info.text = CANCEL;
  WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:AddLine(info);
	--UIDropDownMenu_AddButton(info);
end

local function TransmogrifyOnEvent(self, event, ...)
	if ( event == "TRANSMOGRIFY_UPDATE" or event == "TRANSMOGRIFY_SUCCESS" )  then
		-- these event can fire multiple times for set interaction, once for each slot in the set
		if ( not self.pendingRefresh ) then
			self.pendingRefresh = true;
			C_Timer.After(0, function()
				self.pendingRefresh = nil;
				if self:IsShown() then
					local resetSelection = (event == "TRANSMOGRIFY_UPDATE");
					self:Refresh(resetSelection);
				end;
			end);
		end
	elseif ( event == "TRANSMOG_COLLECTION_UPDATED" or event == "TRANSMOG_SETS_UPDATE_FAVORITE" ) then
		GetUsableSets(true);
		self:Refresh();
		self:UpdateProgressBar();
	elseif ( event == "TRANSMOG_COLLECTION_ITEM_UPDATE" ) then
		--if ( not self.pendingRefresh ) then
		--	self.pendingRefresh = true;
		--	C_Timer.After(1, function()
		--		self.pendingRefresh = nil;
    --    TransmogrifyUpdateSets(self);
		--	end);
		--end
		if ( self.loadingSetID ) then
			local setID = self.loadingSetID;
			self.loadingSetID = nil;
			self:LoadSet(setID);
		end
		if ( self.tooltipModel ) then
			self.tooltipModel:RefreshTooltip();
		end
    if ( not self.pendingRefresh ) then
      self.pendingRefresh = true;
      C_Timer.After(1, function()
        for i=1,#self.Models do
          if self.Models[i]:IsShown() then
            local sources = GetSetSources(self.Models[i].setID);
            for sourceID,_ in pairs(sources) do
              self.Models[i]:TryOn(sourceID);
            end
          end
        end
      end)
    end
	elseif ( event == "PLAYER_EQUIPMENT_CHANGED" ) then
		if ( self.selectedSetID ) then
			self:LoadSet(self.selectedSetID);
		end
		self:Refresh();
  elseif ( event == "UNIT_FORM_CHANGED" and ... == "player" ) then
    for i=1,#self.Models do
      if self.Models[i]:IsShown() then
        self.Models[i]:SetUnit("player", false, not select(2,C_PlayerInfo.GetAlternateFormInfo()));
        local sources = GetSetSources(self.Models[i].setID);
        for sourceID,_ in pairs(sources) do
          self.Models[i]:TryOn(sourceID);
        end
      end
    end
	end
end



------
--Items Collection
------

--local function ExItems_FilterVisuals()
--  local self = WardrobeCollectionFrame.ItemsCollectionFrame;
--	local isAtTransmogrifier = C_Transmog.IsAtTransmogNPC();
--	local visualsList = self.visualsList;
--	local filteredVisualsList = { };
--	local slotID = self.transmogLocation.slotID;
--	for i, visualInfo in ipairs(visualsList) do
--		local skip = false;
--		if visualInfo.restrictedSlotID then
--			skip = (slotID ~= visualInfo.restrictedSlotID);
--		end
--		if not skip then
--			if isAtTransmogrifier then
--				if (visualInfo.isUsable and visualInfo.isCollected) or visualInfo.alwaysShowItem then
--					table.insert(filteredVisualsList, visualInfo);
--				end
--			else
--				--if not visualInfo.isHideVisual then
--					table.insert(filteredVisualsList, visualInfo);
--				--end
--			end
--		end
--	end
--	self.filteredVisualsList = filteredVisualsList;
--end




------
-- On Load Setup for whole Addon
------

----Changed to delaying loading to when a player login instead of on addon loaded which fixes stuff but allows
----catching new sources being added and linking completed sets even if transmog window hasn't been opened yet.
----Assuming no bugs reported in, all of the addon loaded commented out stuff can be deleted.
--local addonsLoaded = { false, false, false };

local frame = CreateFrame("frame"); 
--frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("PLAYER_LOGIN");
frame:SetScript("OnEvent", function(pSelf, pEvent, pUnit)
  --if pEvent == "ADDON_LOADED" then 
  --  if pUnit == "ExtendedSets" then
  --    addonsLoaded[1] = true;
  --    if (not addonsLoaded[2] and IsAddOnLoaded("Blizzard_Collections")) then
  --      addonsLoaded[2] = true;
  --    end
  --  elseif pUnit == "Blizzard_Collections" then
  --    addonsLoaded[2] = true;
  --  end
  --end
  --
  --if not addonsLoaded[3] and addonsLoaded[1] and addonsLoaded[2] then
  --  addonsLoaded[3] = true;
    
  if pEvent == "PLAYER_LOGIN" then
    if not IsAddOnLoaded("Blizzard_Collections") then
      LoadAddOn("Blizzard_Collections")
    end
    
    if (ExS_Settings == nil) then
      ExS_Settings = {};
    end
    if (ExS_Settings.displayOtherFaction == nil) then
      ExS_Settings.displayOtherFaction = false;
    end
    if (ExS_Settings.displayOnlyMyClass == nil) then
      ExS_Settings.displayOnlyMyClass = false;
    end
    if (ExS_Settings.showCharCollectionIcons == nil) then
      ExS_Settings.showCharCollectionIcons = true;
    end
    if (ExS_Settings.expansionToggles == nil) then
      ExS_Settings.expansionToggles = {true, true, true, true, true, true, true, true, true};
    end
    if (ExS_Settings.hideNoLongerObtainable == nil) then
      ExS_Settings.hideNoLongerObtainable = false;
    end
    if (ExS_Settings.hideTradingPost == nil) then
      ExS_Settings.hideTradingPost = false;
    end
    if (ExS_Settings.hideShopsets == nil) then
      ExS_Settings.hideShopsets = false;
    end
    if (ExS_Settings.showHiddenSets == nil) then
      ExS_Settings.showHiddenSets = false;
    end
    if (ExS_Settings.disableHideSetButton == nil) then
      ExS_Settings.disableHideSetButton = false;
    end
    if (ExS_Favorites == nil) then
      ExS_Favorites = {};
    end
    if ExS_Favorites[1] then
      local oldFavs = {}
      for i=1,#ExS_Favorites do
        oldFavs[i] = ExS_Favorites[i];
      end
      ExS_Favorites = {}
      for i=1,#oldFavs do
        ExS_Favorites[oldFavs[i]] = true;
      end
    end
    if (ExS_HiddenSets == nil) then
      ExS_HiddenSets = {};
    end
    if (ExS_HiddenSets[1] == nil) then
      ExS_HiddenSets[1] = {};
    end
    if (ExS_HiddenSets[2] == nil) then
      ExS_HiddenSets[2] = {};
    end
    if (ExS_HiddenSets[3] == nil) then
      ExS_HiddenSets[3] = {};
    end
    if (ExS_HiddenSets[4] == nil) then
      ExS_HiddenSets[4] = {};
    end
  
		--WardrobeCollectionFrameScrollFrame:Hide();
    
    SetsFrame = CreateFromMixins(WardrobeSetsDataProviderMixin);
    
		--CreateScrollbar(frame);
    
    SetsFrame.CreateScrollbar = CreateScrollbar;
    SetsFrame.GetSetByID = GetSetByID;
		--SetsFrame.GetBaseSets = GetBaseSets;
		SetsFrame.GetVariantSets = GetVariantSets;
    SetsFrame.FillSetMaps = FillSetMaps;
		SetsFrame.IsBaseSetNew = IsBaseSetNew;
		SetsFrame.GetBaseSetData = GetBaseSetData;
		SetsFrame.GetSetSourceData = GetSetSourceData;
		SetsFrame.GetIconForSet = GetIconForSet;
		SetsFrame.GetSetSourceCounts = GetSetSourceCounts;
		SetsFrame.ResetBaseSetNewStatus = ResetBaseSetNewStatus;
		SetsFrame.GetSortedSetSources = GetSortedSetSources;
		SetsFrame.GetBaseSetID = GetBaseSetID;
		--SetsFrame.FavoriteDropDown_Init = FavoriteDropDown_Init;
    SetsFrame.SortSets = SortSets;
    SetsFrame.SelectSet = ScrollFrame_SelectSet;
    SetsFrame.ScrollToSet = ScrollFrame_ScrollToSet;
    SetsFrame.ScrollToOffset = ScrollToOffset;
    SetsFrame.InitializeSets = InitializeSets;
    SetsFrame.AddSetToTables = AddSetToTables;
    SetsFrame.ExpandedID = ExpandedID;
    SetsFrame.ExpandedIDOffset = ExpandedIDOffset;
    SetsFrame.ExpandedCallbacks = ExpandedCallbacks;
    SetsFrame.GetSetSources = GetSetSources;
    SetsFrame.ExS_SetSources_OnMouseDown = ExS_SetSources_OnMouseDown;
    SetsFrame.HandleItemFrames = HandleItemFrames;
    SetsFrame.DisplaySet = DisplaySet;
    SetsFrame.AppearanceTooltipOnEnter = AppearanceTooltipOnEnter;
    SetsFrame.UseSet = UseSet;
    SetsFrame.ExS_ScrollFrame_Update = ExS_ScrollFrame_Update;
    SetsFrame.CombineIntoSpecial = CombineIntoSpecial;
    SetsFrame.AddAltAppearancesToTables = AddAltAppearancesToTables;
    SetsFrame.SetButtonData = SetButtonData;
    SetsFrame.GetUsableSets = GetUsableSets;
    SetsFrame.IsForClass = IsForClass;
    SetsFrame.GetPlayerClassArmorType = GetPlayerClassArmorType;
    SetsFrame.MergeColors = MergeColors;
    
    SetsFrame.NewVisualIDs = {};
    
		------------------------------------------------------------------------
		WardrobeCollectionFrame.SetsCollectionFrame.OnShow = OnShow;
    WardrobeCollectionFrame.SetsCollectionFrame:SetScript("OnShow", OnShow);
		WardrobeCollectionFrame.SetsCollectionFrame.OnHide = OnHide;
    WardrobeCollectionFrame.SetsCollectionFrame:SetScript("OnHide", OnHide);
		WardrobeCollectionFrame.SetsCollectionFrame.OnEvent = OnEvent;
    WardrobeCollectionFrame:HookScript("OnShow", function()
        if WardrobeCollectionFrame.activeFrame.searchType == Enum.TransmogSearchType.BaseSets then
          WardrobeCollectionFrame.FilterButton:Hide();
        else
          WardrobeCollectionFrame.FilterButton:Show();
        end
      end)
    frame:SetScript("OnEvent", OnEvent);
    WardrobeCollectionFrame.SetsCollectionFrame:SetScript("OnEvent", OnEvent);
		WardrobeCollectionFrame.SetsCollectionFrame.DisplaySet = DisplaySet;
		WardrobeCollectionFrame.SetsCollectionFrame.OnSearchUpdate = OnSearchUpdate;
		WardrobeCollectionFrame.SetsCollectionFrame.SelectSet = ScrollFrame_SelectSet;
		WardrobeCollectionFrame.SetsCollectionFrame.GetDefaultSetIDForBaseSet = GetDefaultSetIDForBaseSet;
		WardrobeCollectionFrame.SetsCollectionFrame.OpenVariantSetsDropDown = OpenVariantSetsDropDown;
		--WardrobeCollectionFrame.SetsCollectionFrame.GetBaseSets = GetBaseSets;
		WardrobeCollectionFrame.SetsCollectionFrame.UpdateProgressBar = UpdateProgressBar;
    WardrobeCollectionFrame.SetsCollectionFrame.ScrollToSet = ScrollFrame_ScrollToSet;
    WardrobeCollectionFrame.GoToSet = WardrobeCollectionFrame.SetsCollectionFrame.ScrollToSet;
		WardrobeCollectionFrame.SetsCollectionFrame.RefreshAppearanceTooltip = RefreshAppearanceTooltip;
    WardrobeCollectionFrame.SetsCollectionFrame.GetBaseSetData = GetBaseSetData;
    WardrobeCollectionFrame.SetsCollectionFrame.SetsDataProvider = SetsFrame;
    WardrobeCollectionFrame.SetsCollectionFrame.OnLoad = nil;
    
    WardrobeCollectionFrame.SetsCollectionFrame:RegisterEvent("TRANSMOG_COLLECTION_SOURCE_ADDED");
    WardrobeCollectionFrame.SetsCollectionFrame:RegisterEvent("TRANSMOG_COLLECTION_SOURCE_REMOVED");
    
    -------------------------------------------------------------------------
    WardrobeCollectionFrame.SetsTransmogFrame.UpdateSets = TransmogrifyUpdateSets;
    WardrobeCollectionFrame.SetsTransmogFrame.LoadSet = TransmogrifyLoadSet;
    WardrobeCollectionFrame.SetsTransmogFrame.ResetPage = TransmogrifyResetPage;
    WardrobeCollectionFrame.SetsTransmogFrame.GetFirstMatchingSetID = TransmogrifyGetFirstMatchingSetID;
    WardrobeCollectionFrame.SetsTransmogFrame.OnEvent = TransmogrifyOnEvent;
    WardrobeCollectionFrame.SetsTransmogFrame.OnPageChanged = TransmogrifyOnPageChanged;
    WardrobeCollectionFrame.SetsTransmogFrame:SetScript("OnEvent",TransmogrifyOnEvent);
    for i=1,#WardrobeCollectionFrame.SetsTransmogFrame.Models do
      WardrobeCollectionFrame.SetsTransmogFrame.Models[i].RefreshTooltip = TransmogrifyRefreshTooltip;
      WardrobeCollectionFrame.SetsTransmogFrame.Models[i].OnMouseDown = TransmogrifyOnMouseDown;
      WardrobeCollectionFrame.SetsTransmogFrame.Models[i]:SetScript("OnMouseDown", TransmogrifyOnMouseDown);
    end
    WardrobeCollectionFrame.SetsTransmogFrame.OpenRightClickDropDown = TransmogrifyOpenRightClickDropDown;
    
    -- Right Click Menu stuff for the Transmogrify (not collection) window
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown = LDD:NewMenu(WardrobeCollectionFrame.SetsTransmogFrame, "SetsTransmogRightClickDropDown")
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown.minWidth = 240
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:SetStyle('MENU')
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:SetFrameLevel(8)
  
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:HookScript("OnShow", function() WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:RegisterEvent("GLOBAL_MOUSE_DOWN") end)
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:HookScript("OnHide", function() WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:UnregisterEvent("GLOBAL_MOUSE_DOWN") end)
    WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:HookScript("OnEvent", function(pSelf, pEvent, pUnit)
          if WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:IsShown() and not WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:IsMouseOver() then
            WardrobeCollectionFrame.SetsTransmogFrame.RightClickDropdown:Toggle();
          end
      end)
    
    WardrobeCollectionFrame.SetsTransmogFrame:HookScript("OnShow", function() WardrobeCollectionFrame.SetsTransmogFrame:RegisterEvent("UNIT_FORM_CHANGED") end)
    WardrobeCollectionFrame.SetsTransmogFrame:HookScript("OnHide", function() WardrobeCollectionFrame.SetsTransmogFrame:UnregisterEvent("UNIT_FORM_CHANGED") end)
    
    --WardrobeCollectionFrame.ItemsCollectionFrame.FilterVisuals = ExItems_FilterVisuals;
    
    --UIDropDownMenu_Initialize(WardrobeCollectionFrame.FilterDropDown, ExtendedWardrobeFilterDropDown_Initialize)--, "MENU");
    factionNames.playerFaction, _ = UnitFactionGroup('player');
    if factionNames.playerFaction == "Alliance" then
      factionNames.opposingFaction = "Horde";
    else
      factionNames.opposingFaction = "Alliance";
    end
  
    
    WardrobeCollectionFrame.SetsCollectionFrame.FilterDropDownButton = CreateFrame("Button", nil, WardrobeCollectionFrame.SetsCollectionFrame, "UIResettableDropdownButtonTemplate")
    WardrobeCollectionFrame.SetsCollectionFrame.FilterDropDownButton:SetAllPoints(WardrobeCollectionFrame.FilterButton)
    WardrobeCollectionFrame.SetsCollectionFrame.FilterDropDownButton:SetText(FILTER)
    WardrobeCollectionFrame.SetsCollectionFrame.FilterDropDownButton:SetScript("OnClick", function() SetsFrame.FilterDropDown:Toggle() end)
    
    SetsFrame.FilterDropDown = LDD:NewMenu(WardrobeCollectionFrame.SetsCollectionFrame, "SetsFilterDropDown")
    SetsFrame.FilterDropDown:SetAnchor('TOPLEFT', WardrobeCollectionFrame.SetsCollectionFrame.FilterDropDownButton, 'TOPRIGHT', 8, -10)
    SetsFrame.FilterDropDown.minWidth = 240
    SetsFrame.FilterDropDown:SetStyle('MENU')
    SetsFrame.FilterDropDown:SetFrameLevel(10)
  
    --SetsFrame.FilterDropDown:HookScript("OnShow", function() SetsFrame.FilterDropDown:RegisterEvent("GLOBAL_MOUSE_DOWN") end)
    --SetsFrame.FilterDropDown:HookScript("OnHide", function() SetsFrame.FilterDropDown:UnregisterEvent("GLOBAL_MOUSE_DOWN") end)
    --SetsFrame.FilterDropDown:HookScript("OnEvent", function(pSelf, pEvent, pUnit)
    --      --if SetsFrame.FilterDropDown:IsShown() and
    --      --    not SetsFrame.FilterDropDown:IsMouseOver() and
    --      --    not WardrobeCollectionFrame.SetsCollectionFrame.FilterDropDownButton:IsMouseOver() then
    --      --  local closeDD = true;
    --      --  local child = { SetsFrame.FilterDropDown:GetChildren() }
    --      --  for i = 1, SetsFrame.FilterDropDown:GetNumChildren() do
    --      --    if child.IsMouseOver and child:IsMouseOver() then
    --      --      closeDD = false;
    --      --      break;
    --      --    end
    --      --  end
    --      --  if closeDD then
    --      --    SetsFrame.FilterDropDown:Toggle();
    --      --  end
    --      --end
    --  end)
    ExS_FilterDropDown_Init();
    
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown = LDD:NewMenu(WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame, "SetsVariantDropDown")
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:SetAnchor('TOPRIGHT', WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton, 'BOTTOMRIGHT', -9, -9)
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown.minWidth = 240
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:SetStyle('MENU')
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:SetFrameLevel(8)
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:SetCheckAlignment("LEFT")
    
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:HookScript("OnShow", function() WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:RegisterEvent("GLOBAL_MOUSE_DOWN") end)
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:HookScript("OnHide", function() WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:UnregisterEvent("GLOBAL_MOUSE_DOWN") end)
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:HookScript("OnEvent", function(pSelf, pEvent, pUnit)
          if WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:IsShown() and
              not WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:IsMouseOver() and
              not WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton:IsMouseOver() then
            WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:Toggle();
          end
      end)
    
    WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton:SetScript("OnMouseDown", function()
        UIMenuButtonStretchMixin.OnMouseDown(WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsButton);
        OpenVariantSetsDropDown();
        WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantsDropDown:Toggle();
      end)

    app.SetsFrame = SetsFrame;

    app.ExS_AH_Init();
	end
end)
