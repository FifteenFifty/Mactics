local macticsFrame = CreateFrame("Frame")

macticsFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
macticsFrame:RegisterEvent("ADDON_LOADED")
macticsFrame:RegisterEvent("PLAYER_LOGIN")
--
-- This function is called whenever a registered event occurs
--
-- @param self      The frame through which the event occurred
-- @param event     A string containing the name of the event that occurred
-- @param addonName A string containing the name of the addon to which this
--                  event pertains.
--

--Much to my annoyance this was the only way I could get the frameEvent function to fire
--Not entirely sure why calling it from the SetScript method doesn't work
macticsFrame:SetScript("OnEvent", function(self, event, addonName, ...)
    -- if (addonName== "mactics-core") then
        -- SLASH_MCT1 = '/mct'
		-- loadZoneTactics()		
    -- end

    if (event == "ZONE_CHANGED_NEW_AREA") then
		loadZoneTactics()
    end
end)

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
    else if msg == '?' then
		macticsHelp();
        
    else if msg == 'self' then
        --Find player's name, and whisper self
        if UnitGUID("target") then
            printTacts(UnitGUID("target"), "self");
        end
    else if UnitGUID("target") then
        printTacts(UnitGUID("target"), "party");
    end
end
end
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

function macticsHelp()
	print("Mactics");
    print("Usage: Target boss and /mct");
    print("Optional arguments: self, debug, <name of boss>");
end

--
-- This function prints tactics for the desired boss.
--
-- @param
-- @param
--
function printTacts(mobId, chatName)
    local id=tonumber(string.sub(mobId,-12,-9),16)
    print("lel, that's not implemented yet");
end

--
-- This function is called when a user switches zones, and once on initial
-- load. It should load the sub-addon containing zone tactics.
--
-- @note If the user moves out of an applicable zone, there is no need to
--        unload any tactics currently being held in memory.
--
--
function loadZoneTactics()
    ChatFrame1:AddMessage("<Mactics> Loaded ".. GetZoneText())
    --This is the part where we load the addon containing relevant tactics
end

function registerMe(name)
    print(name .. " had just registered, cool")
end
