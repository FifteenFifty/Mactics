local macticsFrame = CreateFrame("Frame")

local function aTest(self, event, arg1, ...)
    if (arg1 == "Mactics") then
        SLASH_MCT1 = '/mct'
        print("Mactics loaded :)")
        debug()
    end
end

macticsFrame:RegisterEvent("ADDON_LOADED")
macticsFrame:RegisterEvent("PLAYER_LOGIN")
macticsFrame:SetScript("OnEvent", aTest)

function SlashCmdList.MCT(msg, editbox)
    if msg == 'debug' then
        debug();
    else if msg == '?' then
        print("Mactics");
        print("Usage: Target boss and /mct");
        print("Optional arguments: self, debug, name of a boss");
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

function debug()
    if UnitGUID("target") then
        print("Mob ID: " .. tonumber(string.sub(UnitGUID("target"),-12,-9),16));
    end

    print ("Instance ID: " .. GetCurrentMapAreaID());
end

function printTacts(mobID, chatName)
    local id=tonumber(string.sub(mobID,-12,-9),16)
    print("lel, that's not implemented yet");
end
