SLASH_MCT1 = '/mct';

function SlashCmdList.MCT(msg, editbox)
    if msg == 'debug' then
        if UnitGUID("target") then
            print("Mob ID: " .. tonumber(string.sub(UnitGUID("target"),-12,-9),16));
            print ("Instance ID: " .. GetCurrentMapAreaID());
        end
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

function printTacts(mobID, chatName)
    local id=tonumber(string.sub(mobID,-12,-9),16)
    print("lel, that's not implemented yet");
end
