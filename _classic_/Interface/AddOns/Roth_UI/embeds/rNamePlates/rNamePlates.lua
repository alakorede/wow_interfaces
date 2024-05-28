-- rNamePlates: core
-- Galaxy 2016

-----------------------------
-- Variables
-----------------------------

local addon, ns = ...
local EliteTag = "+"
local RareTag = "^"
local BossTag = "*"
local cfg = ns.cfg
if not cfg.embeds.rNamePlates then return end
-----------------------------
-- SetCVar
-----------------------------

SetCVar("namePlateMinScale", 1)
SetCVar("namePlateMaxScale", 1)

-----------------------------
-- Options
-----------------------------
local groups = {
	"Enemy",
	"Friendly",
	}

if not IsInInstance() then
	local options = {
		useClassColors = true,
		displayNameWhenSelected = true,
		displayNameByPlayerNameRules = true,
		playLoseAggroHighlight = false,
		displayAggroHighlight = true,
		displaySelectionHighlight = true,
		considerSelectionInCombatAsHostile = true,
		colorNameWithExtendedColors = true,
		colorHealthWithExtendedColors = true,
		selectedBorderColor = CreateColor(0, 0, 0, 1),
		tankBorderColor = false,
		defaultBorderColor = CreateColor(0, 0, 0, 1),
		}
	for i, group  in next, groups do
		for key, value in next, options do
			_G["DefaultCompactNamePlate"..group.."FrameOptions"][key] = value
		end
	end
end


-----------------------------
-- Functions
-----------------------------

local function GetHexColorFromRGB(r, g, b)
	return string.format("%02x%02x%02x", r*255, g*255, b*255)
end

--SetupNamePlate
local h = CreateFrame("Frame")
h:RegisterEvent("NAME_PLATE_CREATED")
h:SetScript("OnEvent", function(h, event, ...)
    if event == "NAME_PLATE_CREATED" then
        hooksecurefunc("DefaultCompactNamePlateFrameSetupInternal", function(frame, setupOptions, frameOptions, ...)
		local unit = ...
            --Health Bar
			if frame:IsForbidden() then return end
			frame.healthBar:SetStatusBarTexture(mediapath.."statusbar_fill")
			frame.healthBar.border:Hide()
			frame.LevelFrame:Hide()
			frame.name:SetPoint("BOTTOM",frame.healthBar,"TOP",0,0)
			frame.healthBar:SetPoint("TOP",0,-50)
			frame.healthBar:SetPoint("BOTTOM",0,50)
			frame.healthBar:SetPoint("RIGHT",-10,0)
			frame.healthBar:SetPoint("LEFT",10,0)	
			frame.healthBar:SetScale(0.35)
			frame.RaidTargetFrame.RaidTargetIcon:SetTexture(mediapath.."raidicons")
			frame.RaidTargetFrame:SetPoint("RIGHT", frame.healthBar,"RIGHT",35,0)

  
            --Left Edge artwork
			if (not frame.healthBar.le) then
				frame.healthBar.le = frame.healthBar:CreateTexture(nil,"BACKGROUND",nil,-8)
				frame.healthBar.le:SetTexture(mediapath.."edge_left")
				frame.healthBar.le:SetSize(64,64)
				frame.healthBar.le:SetPoint("RIGHT",frame.healthBar,"LEFT",0,0)
			end

			if (not frame.healthBar.text) then
				frame.healthBar.text = frame.healthBar:CreateFontString(nil,"OVERLAY")
				frame.healthBar.text:SetFont(cfg.font, cfg.Nameplates.fontSize, "THICKOUTLINE")
				frame.healthBar.text:SetPoint("CENTER",frame.healthBar,"CENTER",0,0)
			end
	
            --Right Edge artwork
			if (not frame.healthBar.re) then
				frame.healthBar.re = frame.healthBar:CreateTexture(nil,"BACKGROUND",nil,-8)
				frame.healthBar.re:SetTexture(mediapath.."edge_right")
				frame.healthBar.re:SetSize(64,64)
				frame.healthBar.re:SetPoint("LEFT",frame.healthBar,"RIGHT",0,0)
            end
			
            --Healthbar Background
			if (not frame.healthBar.bg) then
				frame.healthBar.bg = frame.healthBar:CreateTexture(nil,"BACKGROUND",nil,-8)
				frame.healthBar.bg:SetTexture(mediapath.."statusbar_bg")
				frame.healthBar.bg:SetAllPoints()
				frame.healthBar.bg:SetAlpha(0.5)
			end
			
            --Name shadow
			if (not frame.healthBar.shadow) then
				frame.healthBar.shadow = frame.healthBar:CreateTexture(nil,"BACKGROUND",nil,-8)
				frame.healthBar.shadow:SetTexture("Interface\\Common\\NameShadow")
				frame.healthBar.shadow:SetPoint("BOTTOM",frame.healthBar,"TOP",0,-20)
				frame.healthBar.shadow:SetSize(256,32)
				frame.healthBar.shadow:SetTexCoord(1,1,1,0,0,1,0,0)
				frame.healthBar.shadow:SetAlpha(0.5)
			end
  
            --Highlight Frame
			if (not frame.healthBar.hlf) then
				frame.healthBar.hlf = CreateFrame("Frame",nil,frame.healthBar)
				frame.healthBar.hlf:SetAllPoints(frame.healthBar)
				frame.healthBar.hlf = frame.healthBar.hlf
			end
  
            --Highlight
			if (not frame.healthBar.hl) then
				frame.healthBar.hl = frame.healthBar.hlf:CreateTexture(nil,"BACKGROUND",nil,-8)
				frame.healthBar.hl:SetTexture(mediapath.."statusbar_highlight")
				frame.healthBar.hl:SetPoint("TOP",50,0)
				frame.healthBar.hl:SetPoint("LEFT",-30,0)
				frame.healthBar.hl:SetPoint("RIGHT",30,0)
				frame.healthBar.hl:SetPoint("BOTTOM",40,0)
			end
  
            --Cast Bar
            if (frame.CastBar) then
				frame.CastBar:SetStatusBarTexture(mediapath.."statusbar_fill")
			end
            if GetCVar("NamePlateVerticalScale") == "1" then
				if frame:IsForbidden() then return end
                frame.CastBar:SetHeight(11)
                frame.CastBar.Icon:SetTexCoord(0.1,0.9,0.1,0.9)
                frame.CastBar.Icon:SetSize(17,17)
                frame.CastBar.Icon:ClearAllPoints()
                frame.CastBar.Icon:SetPoint("BOTTOMRIGHT",frame.castBar,"BOTTOMLEFT",-2,0)
			end
        end)
    end
end)


--Name
hooksecurefunc("CompactUnitFrame_UpdateName", function (frame)
	if frame:IsForbidden() then return end
	if frame.unit == nil then return end
   --Set the tag based on UnitClassification, can return "worldboss", "rare", "rareelite", "elite", "normal", "minus"
	local tag 
	local level = UnitLevel(frame.unit)
	local name = UnitName(frame.unit)
	local hexColor = GetCreatureDifficultyColor(level)
	hexColor = ConvertRGBtoColorString(hexColor)   


	if UnitClassification(frame.unit) == "worldboss" or UnitLevel(frame.unit) == -1 then
		level = "??"
	elseif UnitClassification(frame.unit) == "rare" then
		name = "*"..name.."*"
	elseif UnitClassification(frame.unit) == "rareelite" then
		name = "*"..name.."*"
		level = "+"..level
	elseif UnitClassification(frame.unit) == "elite" then
		level = "+"..level
	end
	--Set the nameplate name to include tag(if any), name and level
	if (name and level) then
		frame.name:SetText("("..hexColor..""..level.."|r) "..name)
		frame.name:SetFont(cfg.font, 12)
	end
	
	if (frame.healthBar.re) then
		frame.healthBar.re:SetSize(64,64)
	end
	if (frame.healthBar.le) then
		frame.healthBar.le:SetSize(64,64)
	end
end)



local function IsTank()
return false
--  local assignedRole = UnitGroupRolesAssigned("player")
--  if assignedRole == "TANK" then return true end
--  local role = GetSpecializationRole(GetSpecialization())
--  if role == "TANK" then return true end
--  return false
end


--UpdateHealthBorder
local function UpdateHealthBorder(frame)
	if frame:IsForbidden() then return end
	if frame.displayedUnit:match("(nameplate)%d?$") ~= "nameplate" then return end
	if not IsTank() then return end
	local status = UnitThreatSituation("player", frame.displayedUnit)
	if status and status >= 3 then
		frame.healthBar.border:SetVertexColor(0, 1, 0, 0.8)
	end
end
hooksecurefunc("CompactUnitFrame_UpdateHealthBorder", UpdateHealthBorder)
