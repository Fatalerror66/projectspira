-----------------------------------
--	Author: Snotz
-- 	GLOBAL SCRIPT
-- 	Sets Crafting Maximum Levels a Char can go above 60.
-----------------------------------
require("/scripts/globals/common");
require("/scripts/globals/settings");

function OnServerStart()

setGlobalVar("MaxCraftAbove60",MAX_CRAFT_ABOVE_60);

end;