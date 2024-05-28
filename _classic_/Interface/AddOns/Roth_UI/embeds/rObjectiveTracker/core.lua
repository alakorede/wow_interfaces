
-- rObjectiveTracker: core
-- zork, 2016

-----------------------------
-- Variables
-----------------------------

local A, L = ...
local addon, ns = ...
local cfg = ns.cfg
L.addonName       = A
L.dragFrames      = {}
L.addonColor      = "00FF00AA"
L.addonShortcut   = "rot"

if not cfg.embeds.rObjectiveTracker then return end

-----------------------------
-- Init
-----------------------------

--ObjectiveTrackerFrame
WatchFrame:SetScale(cfg.tracker.scale)
WatchFrame:ClearAllPoints()
WatchFrame:SetPoint(unpack(cfg.tracker.point))
WatchFrame:SetSize(unpack(cfg.tracker.size))

--drag frame
rLib:CreateDragResizeFrame(WatchFrame, L.dragFrames, -2, true)

--create slash commands
rLib:CreateSlashCmd(L.addonName, L.addonShortcut, L.dragFrames, L.addonColor)
