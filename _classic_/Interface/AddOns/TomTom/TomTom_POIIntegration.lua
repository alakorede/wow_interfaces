local addonName, addon = ...
local hbd = LibStub("HereBeDragons-2.0")

if (not addon.WOW_MAINLINE) then
    return
end

local enableClicks = true       -- True if waypoint-clicking is enabled to set points
local enableClosest = true      -- True if 'Automatic' quest waypoints are enabled
local modifier                  -- A string representing click-modifiers "CAS", etc.

local modTbl = {
    C = IsControlKeyDown,
    A = IsAltKeyDown,
    S = IsShiftKeyDown,
}

local L = TomTomLocals

-- This function and the related events/hooks are used to automatically
-- update the crazy arrow to the closest quest waypoint.
local lastWaypoint
local scanning          -- This function is not re-entrant, stop that


local function GetQuestIndexForWatch(questWatchIndex)
    local questID = C_QuestLog.GetQuestIDForQuestWatchIndex(questWatchIndex)
    local questIndex = questID and C_QuestLog.GetLogIndexForQuestID(questID)
    return questIndex
end

local function ObjectivesChanged()
    -- This function should only run if enableClosest is set
    if not enableClosest then
        return
    end

    -- This function may be called while we are processing this function
    -- so stop that from happening.
    if scanning then
        return
    else
        scanning = true
    end

    local map = C_Map.GetBestMapForUnit("player")
    if not map then
        scanning = false
        return
    end

    local player = C_Map.GetPlayerMapPosition(map, "player")
    if not player then
        scanning = false
        return
    end

    local px, py = player:GetXY()

    -- Bail out if we can't get the player's position
    if not px or not py or px <= 0 or py <= 0 then
        scanning = false
        return
    end

    -- THIS CVAR MUST BE CHANGED BACK!
    local cvar = GetCVarBool("questPOI")
    SetCVar("questPOI", 1)

    local closest
    local closestdist = math.huge

    -- This function relies on the above CVar being set, and updates the icon
    -- position information so it can be queried via the API
    QuestPOIUpdateIcons()

    -- Scan through every quest that is tracked, and find the closest one
    local watchIndex = 1
    while true do
        local questIndex = GetQuestIndexForWatch(watchIndex)

        if not questIndex then
            break
        end

        local qid = C_QuestLog.GetQuestIDForQuestWatchIndex(watchIndex)
        C_QuestLog.SetSelectedQuest(qid)
        C_QuestLog.GetNextWaypoint(qid)
        local completed, x, y, objective = QuestPOIGetIconInfo(qid)
        local qmap = GetQuestUiMapID(qid)

        if x and y then
            local dist = hbd:GetZoneDistance(map, px, py, qmap, x, y)
            if dist and (dist < closestdist) then
                closest = watchIndex
                closestdist = dist
            end
        end
        watchIndex = watchIndex + 1
    end

    if closest then
        local questIndex = GetQuestIndexForWatch(closest)
        local title = C_QuestLog.GetTitleForLogIndex(questIndex)
        local qid = C_QuestLog.GetQuestIDForQuestWatchIndex(closest)
        local completed, x, y, objective = QuestPOIGetIconInfo(qid)
        local map = GetQuestUiMapID(qid)

        if completed then
            title = "Turn in: " .. title
        end

        local setWaypoint = true
        if lastWaypoint then
            -- This is a hack that relies on the UID format, do not use this
            -- in your addons, please.
            local pm, px, py = unpack(lastWaypoint)
            if map == pm and x == px and y == py and lastWaypoint.title == title then
                -- This is the same waypoint, do nothing
                setWaypoint = false
            else
                -- This is a new waypoint, clear the previous one
                TomTom:RemoveWaypoint(lastWaypoint)
            end
        end

        if setWaypoint then
            -- Set the new waypoint
            lastWaypoint = TomTom:AddWaypoint(map, x, y, {
                title = title,
                persistent = false,
                arrivaldistance = TomTom.profile.poi.arrival,
            })

            -- Check and see if the Crazy arrow is empty, and use it if so
            if TomTom:IsCrazyArrowEmpty() then
                TomTom:SetCrazyArrow(lastWaypoint, TomTom.profile.poi.arrival, title)
            end
        end
    else
        -- No closest waypoint was found, so remove one if its already set
        if lastWaypoint then
            TomTom:RemoveWaypoint(lastWaypoint)
            lastWaypoint = nil
        end
    end

    SetCVar("questPOI", cvar and 1 or 0)
    scanning = false
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("QUEST_POI_UPDATE")
eventFrame:RegisterEvent("QUEST_LOG_UPDATE")


eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "QUEST_POI_UPDATE" then
        ObjectivesChanged()
    elseif event == "QUEST_LOG_UPDATE" then
        ObjectivesChanged()
    end
end)

local poiclickwaypoints = {}
local function poi_OnClick(self, button)
    if not enableClicks then
        return
    end

    if button == "RightButton" then
        for i = 1, #modifier do
            local mod = modifier:sub(i, i)
            local func = modTbl[mod]
            if not func() then
                return
            end
        end
    else
        return
    end

    local cvar = GetCVarBool("questPOI")
    SetCVar("questPOI", 1)

    -- Run our logic, and set a waypoint for this button
    local m

    QuestPOIUpdateIcons()

    local questIndex = C_QuestLog.GetLogIndexForQuestID(self.questID)
    local title, completed, x, y

    if questIndex and questIndex ~= 0 then
        title = C_QuestLog.GetTitleForLogIndex(questIndex)
        completed, x, y = QuestPOIGetIconInfo(self.questID)
        m = C_TaskQuest.GetQuestZoneID(self.questID)
        -- If the WorldMap is open, maybe use the map's MapID, else maybe try the players' map
        if WorldMapFrame:IsShown() then
            m = m or WorldMapFrame:GetMapID()
        else
            m = m or C_Map.GetBestMapForUnit("player")
        end
    else
        -- Must be a World Quest
        title = C_TaskQuest.GetQuestInfoByQuestID(self.questID)
        completed = false
        x, y = C_TaskQuest.GetQuestLocation(self.questID)
        m = C_TaskQuest.GetQuestZoneID(self.questID)
        m = m or C_Map.GetBestMapForUnit("player")
    end

    if completed then
        title = "Turn in: " .. title
    end

    if not x or not y then
        -- No coordinate information for this quest/objective
        local header = "|cFF33FF99TomTom|r"
        if TomTom.profile.general.announce then
            local msg = L["%s: No coordinate information found for '%s' at this map level"]:format(header, title or self.questID)
            ChatFrame1:AddMessage(msg)
        end
        return
    end

    local key = TomTom:GetKeyArgs(m, x, y, title)

    local alreadySet = false
    if poiclickwaypoints[key] then
        local uid = poiclickwaypoints[key]
        -- Check to see if it has been removed by the user
        if TomTom:IsValidWaypoint(uid) then
            alreadySet = true
        end
    end

    if not alreadySet then
        local uid = TomTom:AddWaypoint(m, x, y, {
            title = title,
            arrivaldistance = TomTom.profile.poi.arrival,
        })
        poiclickwaypoints[key] = uid
    else
        local uid = poiclickwaypoints[key]
        TomTom:SetCrazyArrow(uid, TomTom.profile.poi.arrival, title)
    end

    SetCVar("questPOI", cvar and 1 or 0)
end

if ObjectiveTrackerBlocksFrame and ObjectiveTrackerBlocksFrame.CallOnCreateFunction then
    local hooked = {}

    if ObjectiveTrackerBlocksFrame.buttonPool then
        -- iterate over buttons that exist
        for poiButton in ObjectiveTrackerBlocksFrame.buttonPool:EnumerateActive() do
            if not hooked[poiButton] then
                poiButton:HookScript("OnClick", function(self, button)
                    poi_OnClick(self, button)
                end)
                hooked[poiButton] = true
            end
        end
    end

    -- and hook for new ones
    hooksecurefunc(ObjectiveTrackerBlocksFrame, "CallOnCreateFunction", function(self, poiButton)
        if not hooked[poiButton] then
            poiButton:HookScript("OnClick", function(self, button)
                poi_OnClick(self, button)
            end)
            hooked[poiButton] = true
        end
    end)
else
    if not addon.WAR_WITHIN then
        hooksecurefunc("QuestPOIButton_OnClick", function(self, button)
            poi_OnClick(self, button)
        end)
    end
end

function TomTom:EnableDisablePOIIntegration()
    enableClicks= TomTom.profile.poi.enable
    modifier = TomTom.profile.poi.modifier
    enableClosest = TomTom.profile.poi.setClosest

    if not enableClosest and lastWaypoint then
        TomTom:RemoveWaypoint(lastWaypoint)
        lastWaypoint = nil
    elseif enableClosest then
        ObjectivesChanged()
    end
end
