---------------------------------------------------------------------
--	Author: ReaperX
-- 	Gate of Thunder.
--  no known function.
--  Default text is currently "The door is firmly closed." Needs to be checked on retail.
---------------------------------------------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
---------------------------------------------------------------------
-- onTrigger Action
---------------------------------------------------------------------
function onTrigger(player,npc)
	player:specialMessage(MISSIONS + 28) -- "The door is firmly closed."
end; 
 
---------------------------------------------------------------------
-- onTrade Action
---------------------------------------------------------------------
function onTrade(player,npc,trade)
end; 
 
---------------------------------------------------------------------
-- onEventFinish Action
---------------------------------------------------------------------
function onEventFinish(player,csid,option)
end;