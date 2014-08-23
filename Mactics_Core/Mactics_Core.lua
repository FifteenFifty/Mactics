local macticsFrame  = CreateFrame("Frame")
local macticsLoaded = 0
local currentMapId  = 0

addonMap            = {}
currentLoadedPlugin = nil

--
-- This function is called whenever a registered event occurs
--
-- @param self      The frame through which the event occurred
-- @param event     A string containing the name of the event that occurred
-- @param addonName A string containing the name of the addon to which this
--                  event pertains.
--
local function frameEvent(self, event, addonName, ...)
    if (addonName == "Mactics_Core") then
        macticsLoaded = 1
        SLASH_MCT1 = '/mct'

        gatherChildren()

        print("Mactics loaded :)")
        debug()

        currentMapId = GetCurrentMapAreaID()
        loadZoneTactics(currentMapId)
    elseif (macticsLoaded == 1 and event == "ZONE_CHANGED_NEW_AREA") then
        currentMapId = GetCurrentMapAreaID()
        loadZoneTactics(currentMapId)
    end
end

macticsFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
macticsFrame:RegisterEvent("ADDON_LOADED")
macticsFrame:RegisterEvent("PLAYER_LOGIN")
macticsFrame:SetScript("OnEvent", frameEvent)

--
-- This function processes any slash command that is registered
--
-- @param msg     A string containing any text that was present after the
--                slash command
-- @param editbox I have literally no idea
--
function SlashCmdList.MCT(msg, editbox)
    if msg == 'debug' then
        debug();
    elseif msg == '?' then
        print("Mactics");
        print("Usage: Target boss and /mct");
        print("Optional arguments: self, debug, <name of boss>");
    elseif msg == 'self' then
        --Find player's name, and whisper self
        if UnitGUID("target") then
            printTacts(currentMapId, UnitGUID("target"), "self");
        end
    elseif UnitGUID("target") then
        printTacts(currentMapId, UnitGUID("target"), "party");
    end
end

--
-- This function prints debug information to clientside chat.
--
function debug()
    if UnitGUID("target") then
        print("Mob ID: " .. tonumber(string.sub(UnitGUID("target"),-12,-9),16));
    end

    print ("Instance ID: " .. GetCurrentMapAreaID());
end

--
-- This function farms out tactic printing to the currently loaded plugin.
--
-- @param mapId    The identifier of the current map.
-- @param mobId    The identifier of the currently selected target.
-- @param chatName The name of the chat to which tactics should be printed.
--
function printTacts(mapId, mobId, chatName)
    local id = tonumber(string.sub(mobId,-12,-9),16)

    if (currentLoadedPlugin ~= nil) then
        local bossTable = _G[currentLoadedPlugin]:getTactics(mapId, id)

        if (bossTable == nil) then
            print("Nothing to print for this target!")
        else
            SendChatMessage("Tactics for " ..
                                bossTable["bossName"] ..
                                ", written by " ..
                                bossTable["author"],
                            "raid");

            for i, v in ipairs(bossTable["tactics"]) do
                SendChatMessage(v, "raid")
            end
        end
    end
end

--
-- This function is called when a user switches zones, and once on initial
-- load. It loads the sub-addon containing zone tactics.
--
-- @note If the user moves out of an applicable zone, there is no need to
--        unload any tactics currently being held in memory.
--
-- @param areaId The numeric identifier of the zone into which the user
--               moved.
--
function loadZoneTactics(areaId)
    print("Loading tactics for zone " .. areaId)

    local addonName   = addonMap[areaId]

    if (addonName ~= nil and IsAddOnLoaded(addonName) == false) then
        loaded, reason = LoadAddOn(addonName)

        if (loaded == nil) then
            print("Error loading addon: " .. addonName)
        else
            print("Loaded: " .. addonName)
            currentLoadedPlugin = addonName
        end

    end
end

--
-- This function finds all of the Mactics tactics plugins and populates a map
-- of mapId -> applicableAddonName.
--
function gatherChildren()
    for i = 1, GetNumAddOns() do
        local addonName, _, _, enabled = GetAddOnInfo(i)

        if (GetAddOnMetadata(i, "X-Mactics-Plugin") and enabled) then
            local mapIdTable =
                {
                    strsplit(",", GetAddOnMetadata(i,
                                                   "X-Mactics-Plugin-MapIds")
                                    or "")
                }

            for key, value in pairs(mapIdTable) do
                addonMap[tonumber(value)] = addonName
            end
        end
    end
end
