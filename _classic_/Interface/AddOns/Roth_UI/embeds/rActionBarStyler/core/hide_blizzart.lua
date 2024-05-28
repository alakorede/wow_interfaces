
  -----------------------------
  -- INIT
  -----------------------------

  --get the addon namespace
  local addon, ns = ...
  local gcfg = ns.cfg

  -----------------------------
  -- HIDE FRAMES
  -----------------------------
if not gcfg.embeds.rActionBarStyler then return end
  --hide blizzard
  local pastebin = CreateFrame("Frame")
  pastebin:Hide()
  ns.pastebin = pastebin
  --hide main menu bar frames
  if gcfg.bars.bar1.enable then
    MainMenuBar:SetAlpha(0)
	MainMenuBar:Hide()
	MainMenuBar:EnableMouse(false)
    ActionBarDownButton:SetAlpha(0)
    ActionBarUpButton:SetAlpha(0)
  end

  -----------------------------
  -- HIDE TEXTURES
  -----------------------------

  --remove some the default background textures
  StanceBarLeft:SetAlpha(0)
  StanceBarMiddle:SetAlpha(0)
  StanceBarRight:SetAlpha(0)
  SlidingActionBarTexture0:SetAlpha(0)
  SlidingActionBarTexture1:SetAlpha(0)
  MainMenuBar:Hide()
  MainMenuBar:EnableMouse(false)

  if gcfg.bars.bar1.enable then
    MainMenuBarLeftEndCap:SetAlpha(0)
	MainMenuBarRightEndCap:SetAlpha(0)
	MainMenuBarTexture0:SetAlpha(0)
	MainMenuBarTexture1:SetAlpha(0)
	MainMenuBarTexture2:SetAlpha(0)
	MainMenuBarTexture3:SetAlpha(0)

  end

  --remove OverrideBar textures
  if gcfg.bars.overridebar.enable then
    local textureList =  {
      "_BG",
      "EndCapL",
      "EndCapR",
      "_Border",
      "Divider1",
      "Divider2",
      "Divider3",
      "ExitBG",
      "MicroBGL",
      "MicroBGR",
      "_MicroBGMid",
      "ButtonBGL",
      "ButtonBGR",
      "_ButtonBGMid",
    }
  end
