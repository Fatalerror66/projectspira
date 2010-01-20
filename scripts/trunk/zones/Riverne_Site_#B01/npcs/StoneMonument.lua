-----------------------------------
--	Author: ReaperX
--  Stone Monument at C-10
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Riverne_Site_#B01/TextIDs"] = nil;
require("scripts/zones/Riverne_Site_#B01/TextIDs");


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:specialMessage(MONUMENT);
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;