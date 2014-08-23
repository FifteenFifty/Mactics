Mactics_Party_MoP = {}

--- This section holds all tactics relating to this file ---

local tacTable =
{
    [886] =
    {
        [60999] =
        {
            ["bossName"] = "Sha of Fear",
            ["author"]  = "FifteenFifty",
            ["tactics"] =
            {
                "Just kill the dude",
                "Until he is dead",
                "Really dead.",
                "This should be line 4",
                "Ok?"
            }
        }
    }
}

--- End of file tactics section ---

--
-- This function returns a table containing desired tactics. It must be of
-- the form <TODO>.
--
-- @param mapId    The identifier of the current map.
-- @param mobId    The identifier of the currently selected target.
--
function Mactics_Party_MoP:getTactics(mapId, mobId)
    return tacTable[mapId][mobId]
end
