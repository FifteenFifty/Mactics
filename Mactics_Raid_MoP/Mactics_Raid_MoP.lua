Mactics_Raid_MoP = {}

--- This section holds all tactics relating to this file ---
--
local tacTable =
{
    [886] =
    {
        [60999] =
        {
            ["bossName"] = "Sha of Fear",
            ["idString"] = "shaoffear",
            ["tactics"] =
            {
                "lelelelelle",
                "elee;e;e;e;ee",
                "There are like 100 lines here",
                "But the maxumim should be 5",
                "Nobody should see this",
            }
        },
        [666] =
        {
            ["bossName"] = "Mr. Trololo",
            ["idString"] = "lele",
            ["tactics"] =
            {
                "Moo"
            }
        }
    }
}

--- End of file tactics section ---

--
-- This function returns a table containing desired tactics. It must be of
-- the form <TODO>.
--
-- @param mapId The identifier of the current map.
-- @param mobId The identifier of the currently selected target.
--
function Mactics_Raid_MoP:getTactics(mapId, mobId)
    if (mapId == nil or mobId == nil) then
        return nil
    end

    return tacTable[mapId][mobId]
end

--
-- This function returns the id of a boss, from its idString.
--
-- @param mapId The identifier of the current map.
-- @param mobString A string containing the name of the boss.whose tactics
--                  are to be printed.
--
function Mactics_Raid_MoP:getIdFromString(mapId, mobString)
    if (mapId == nil or mobString == nil) then
        return nil
    end

    mapTable = tacTable[mapId]

    if (mapTable ~= nil) then
        for k, v in pairs(mapTable) do
            if (v["idString"] ~= nil and v["idString"] == mobString) then
                return k
            end
        end
    end

    return nil
end
