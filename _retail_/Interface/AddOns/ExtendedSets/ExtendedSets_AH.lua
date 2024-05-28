local app = select(2,...);

local itemKeys = {};
local AH_sorts = {
	{sortOrder = Enum.AuctionHouseSortOrder.Price, reverseSort = false},
	{sortOrder = Enum.AuctionHouseSortOrder.Name, reverseSort = false},
}
local AH_Frame_Opened = false;
local AHSearchButton;

local titleColor = CreateColor(227/256,38/256,224/256);
local bodyColor = ITEM_QUALITY_COLORS[4];
local bottomColor = CreateColor(104/256,102/256,117/256);

local function IsSourceNotCollectedButBuyable(appID, isArmor)
  --local appSources = C_TransmogCollection.GetAllAppearanceSources(appID);
  --local isCollectedAccount = false;
  local canCharCollectIt = false;
  local isCollectedChar = false;
      
      
  --if appSources then
  --  local sourceInfo = C_TransmogCollection.GetSourceInfo(appSources[1]);
  --  local itemArmorType = select(7,GetItemInfoInstant(sourceInfo.itemID));
  --    
  --  for i=1, #appSources do
  --    local sourceInfo = C_TransmogCollection.GetSourceInfo(appSources[i]);
  --    
  --    local link = select(6, C_TransmogCollection.GetAppearanceSourceInfo(sourceInfo.sourceID));
  --    
  --    if sourceInfo.isCollected then
  --      isCollectedAccount = true;
  --    end
  --    local isForClass = app.SetsFrame.IsForClass(link);
  --    
  --    if isPlayerArmorWeight and not canCharCollectIt and isForClass then
  --      canCharCollectIt = true;
  --    end
  --    if isPlayerArmorWeight and not isCollectedChar and isForClass and sourceInfo.isCollected then
  --      isCollectedChar = true;
  --      break;
  --    end
  --    
  --    if isCollectedAccount and canCharCollectIt and isCollectedChar then
  --      break;
  --    end
  --  end
  --end
  
  local appSources = C_TransmogCollection.GetAppearanceSources(appID);
    
  --local canCharCollectIt = false;
  
  if appSources then
    for source,appInfo in pairs(appSources) do
      if appInfo.isCollected then
        return false;
      end
      --if not canCharCollectIt then
        if isArmor then
          local itemArmorType = select(7,GetItemInfoInstant(appInfo.itemID));
          local isPlayerArmorWeight = (appInfo.invType == 17) or (itemArmorType == 0) or (itemArmorType == 5) or app.SetsFrame.GetPlayerClassArmorType() == itemArmorType;
          local link = select(6, C_TransmogCollection.GetAppearanceSourceInfo(appInfo.sourceID));
          if isPlayerArmorWeight and app.SetsFrame.IsForClass(link) then
            --canCharCollectIt = true;
            --break;
            return true;
          end
        else
          local itemArmorType = select(7,GetItemInfoInstant(appInfo.itemID));
          local _,_,_,main,off = C_TransmogCollection.GetCategoryInfo(appInfo.categoryID)
          if main or off then
            return true;
          end
        end
      --end
    end
  end
  
  --if canCharCollectIt then
  --  return true;
  --end
end

local index = 0;
local setName = "";
local function FillAHSearchList()
  local sources;
  if WardrobeCollectionFrame.activeFrame == WardrobeCollectionFrame.SetsCollectionFrame then
    local setID = WardrobeCollectionFrame.SetsCollectionFrame:GetSelectedSetID();
    local set = app.SetsFrame.GetSetByID(setID);
    sources = set.sources;
    setName = set.name;
  else
    local set = WardrobeCollectionFrame.WeaponSetsCollectionFrame.GetCurrentSet();
    sources = {};
    for i=1,#set.sources do
      sources[set.sources[i][2]] = true;
    end
    setName = set.name;
  end
  itemKeys = {};
  for sourceID,_ in pairs(sources) do
    local appID = C_TransmogCollection.GetSourceInfo(sourceID).visualID;
    if IsSourceNotCollectedButBuyable(appID, WardrobeCollectionFrame.activeFrame == WardrobeCollectionFrame.SetsCollectionFrame) then
      --loop through all the sources of an appearance, if a source is BoE add it to the sources list
      local sourceIDs = C_TransmogCollection.GetAllAppearanceSources(appID)
      for i=1, #sourceIDs do
        local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceIDs[i]);
        local itemLink = select(6, C_TransmogCollection.GetAppearanceSourceInfo(sourceInfo.sourceID));
        local _,_,_,iLvl,_,_,_,_,equipLoc,_,_,_,_,bindType = GetItemInfo(itemLink)
        --local bindType = select(14,GetItemInfo(itemLink));
        if bindType == 2 then--LE_ITEM_BIND_ON_EQUIP
          --local itemKey = C_AuctionHouse.MakeItemKey(sourceInfo.itemID, iLvl)
          --tinsert(itemKeys, itemKey);
          tinsert(itemKeys, {sourceInfo.name,equipLoc})
        end
      end
    end
  end
  
  --for i=1,#itemKeys do
  --          print("-----------",i,"--------------")
  --  
  --        for a,b in pairs(itemKeys[i]) do
  --          print(a,"  ",b);
  --        end
  --end
  
  if #itemKeys == 0 then 
    print(RED_FONT_COLOR:WrapTextInColorCode(setName.." has no missing items that can be purchased."));
    UIErrorsFrame:AddExternalErrorMessage(setName.." has no missing items that can be purchased.");
  end
  index = 0;
end

local function StartAHSearch()
  --local results = C_AuctionHouse.GetBrowseResults();
  --for i = 1,#results do
  --  print("-----------",i,"--------------")
  --  for a,b in pairs(results[i].itemKey) do
  --    print(a,"  ",b)
  --  end
  --  print("-----------")
  --  for a,b in pairs(C_AuctionHouse.GetItemKeyInfo(results[i].itemKey)) do
  --    print(a,"  ",b)
  --  end
  --end
  --for i=1,#itemKeys do
  --  print("-----------",i,"--------------")
  --  for a,b in pairs(C_AuctionHouse.GetItemKeyInfo(itemKeys[i])) do
  --    print(a,"  ",b)
  --  end
  --end
  
  index = index + 1;
  if index > #itemKeys then index = 1; end
  
  AuctionHouseFrame:SendBrowseQuery(itemKeys[index][1], 0, 1000, {4,5,6,7,8,9,10});
  AuctionHouseFrame.SearchBar.SearchBox:SetText(itemKeys[index][1]);
  
  
  --C_AuctionHouse.SearchForItemKeys(itemKeys, AH_sorts);
end

--Create the button in the AH window
local isAHSearchButtonInit = false;
local function SetupAHSearchButton()
  if isAHSearchButtonInit then return; end
  isAHSearchButtonInit = true;
  -- AH Window Button --
  AHSearchButton = CreateFrame("Frame", "ExS_AHButton", UIParent);
  AHSearchButton:SetSize(16,20);
  AHSearchButton:Show();
  --AHSearchButton:SetPoint("RIGHT", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.LinkOutfitButton, "LEFT", -2, 0);

  AHSearchButton.backgroundTexture = AHSearchButton:CreateTexture(nil, "BACKGROUND");
  AHSearchButton.backgroundTexture:SetAllPoints();
  AHSearchButton.backgroundTexture:SetAtlas("poi-transmogrifier");

  AHSearchButton:SetScript("OnEnter", function(self)
      GameTooltip:SetOwner(self, "ANCHOR_LEFT");
      if #itemKeys == 0 then
        GameTooltip_SetTitle(GameTooltip, "Click the Auction House button in the Wardrobe Sets Collection window to search for missing transmog.", bottomColor, true);
      else
        GameTooltip_SetTitle(GameTooltip, setName, titleColor, true);
      end
      for i=1,#itemKeys do
        if i == index then
          --GameTooltip:AddLine(WARDROBE_TOOLTIP_CYCLE_ARROW_ICON..itemKeys[i][1],bodyColor.r,bodyColor.g,bodyColor.b);
          GameTooltip:AddDoubleLine(WARDROBE_TOOLTIP_CYCLE_ARROW_ICON..itemKeys[i][1],_G[itemKeys[i][2]],bodyColor.r,bodyColor.g,bodyColor.b,.8,.8,.8);
        else
          --GameTooltip:AddLine(WARDROBE_TOOLTIP_CYCLE_SPACER_ICON..itemKeys[i][1],bodyColor.r,bodyColor.g,bodyColor.b);
          GameTooltip:AddDoubleLine(WARDROBE_TOOLTIP_CYCLE_SPACER_ICON..itemKeys[i][1],_G[itemKeys[i][2]],bodyColor.r,bodyColor.g,bodyColor.b,.8,.8,.8);
        end
      end
      if #itemKeys > 1 then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Click to cycle to next item.", bottomColor.r,bottomColor.g,bottomColor.b);
      end
      GameTooltip:Show();
    end);
  AHSearchButton:SetScript("OnLeave", function(self)
      GameTooltip:Hide();
    end);

  local function AhSearchButtonClick(pSelf, pButton, pDown)
      if pButton == "LeftButton" then
        StartAHSearch();
        GameTooltip_SetTitle(GameTooltip, setName, titleColor, true);
        for i=1,#itemKeys do
          if i == index then
            --GameTooltip:AddLine(WARDROBE_TOOLTIP_CYCLE_ARROW_ICON..itemKeys[i][1],bodyColor.r,bodyColor.g,bodyColor.b);
            GameTooltip:AddDoubleLine(WARDROBE_TOOLTIP_CYCLE_ARROW_ICON..itemKeys[i][1],_G[itemKeys[i][2]],bodyColor.r,bodyColor.g,bodyColor.b,.8,.8,.8);
          else
            --GameTooltip:AddLine(WARDROBE_TOOLTIP_CYCLE_SPACER_ICON..itemKeys[i][1],bodyColor.r,bodyColor.g,bodyColor.b);
            GameTooltip:AddDoubleLine(WARDROBE_TOOLTIP_CYCLE_SPACER_ICON..itemKeys[i][1],_G[itemKeys[i][2]],bodyColor.r,bodyColor.g,bodyColor.b,.8,.8,.8);
          end
        end
        if #itemKeys > 1 then
          GameTooltip:AddLine(" ")
          GameTooltip:AddLine("Click to cycle to next item.", bottomColor.r,bottomColor.g,bottomColor.b);
        end
      end
    end
  
  AHSearchButton:RegisterEvent("AUCTION_HOUSE_SHOW");
  AHSearchButton:SetScript("OnEvent", function(pSelf, pEvent)
      if pEvent == "AUCTION_HOUSE_SHOW" then
        if not AH_Frame_Opened then
          AHSearchButton:SetParent(AuctionHouseFrame);
          AHSearchButton:SetPoint("RIGHT", AuctionHouseFrameCloseButton, "LEFT", -7, 0);
          AHSearchButton:SetFrameLevel(510)
        end
        if #itemKeys == 0 then
          AHSearchButton.backgroundTexture:SetVertexColor(1,1,1,.4);
          AHSearchButton:SetScript("OnMouseUp", nil);
        else
          AHSearchButton.backgroundTexture:SetVertexColor(1,1,1,1);
          AHSearchButton:SetScript("OnMouseUp", AhSearchButtonClick);
        end
      end
    end)
end

--Create the button in the armor sets collection window
local function InitializeAH()
  -- Collection Window Button --
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton = CreateFrame("Frame", "ExS_AHButton", WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton:SetSize(16,20);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton:SetPoint("RIGHT", ExS_LinkOutfitButton, "LEFT", -2, 0);

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton.backgroundTexture = WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton:CreateTexture(nil, "BACKGROUND");
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton.backgroundTexture:SetAllPoints();
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton.backgroundTexture:SetAtlas("auctioneer");

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
    GameTooltip_SetTitle(GameTooltip, "Search for Missing Pieces on the Auction House", titleColor, true);
    GameTooltip:AddLine("1. Click this button to add the current set to the search list.",bodyColor.r,bodyColor.g,bodyColor.b);
    GameTooltip:AddLine("2. Open the Auction House.",bodyColor.r,bodyColor.g,bodyColor.b);
    GameTooltip:AddLine("3. Click the transmog icon in the upper right corner to cycle items.",bodyColor.r,bodyColor.g,bodyColor.b);
    GameTooltip:Show();
  end);
  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide();
  end);

  WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.AHButton:SetScript("OnMouseUp", function(pSelf, pButton, pDown)
    if pButton == "LeftButton" then
      FillAHSearchList();
    end
  end);
  
  SetupAHSearchButton();
end

--Create the button in the weapon sets collection window
local function InitializeAH_wep()
  -- Collection Window Button --
  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton = CreateFrame("Frame", "ExS_AHButton", WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame);
  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton:SetSize(16,20);
  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton:SetPoint("LEFT", WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.HiddenSetButton, "RIGHT", 2, 0);

  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton.backgroundTexture = WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton:CreateTexture(nil, "BACKGROUND");
  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton.backgroundTexture:SetAllPoints();
  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton.backgroundTexture:SetAtlas("auctioneer");

  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT");
    GameTooltip_SetTitle(GameTooltip, "Search for Missing Pieces on the Auction House", titleColor, true);
    GameTooltip:AddLine("1. Click this button to add the current set to the search list.",bodyColor.r,bodyColor.g,bodyColor.b);
    GameTooltip:AddLine("2. Open the Auction House.",bodyColor.r,bodyColor.g,bodyColor.b);
    GameTooltip:AddLine("3. Click the transmog icon in the upper right corner to cycle items.",bodyColor.r,bodyColor.g,bodyColor.b);
    GameTooltip:Show();
  end);
  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide();
  end);

  WardrobeCollectionFrame.WeaponSetsCollectionFrame.RightFrame.AHButton:SetScript("OnMouseUp", function(pSelf, pButton, pDown)
    if pButton == "LeftButton" then
      FillAHSearchList();
    end
  end);
  
  SetupAHSearchButton();
end

app.ExS_AH_Init = InitializeAH;
app.ExS_AH_Init_Wep = InitializeAH_wep;