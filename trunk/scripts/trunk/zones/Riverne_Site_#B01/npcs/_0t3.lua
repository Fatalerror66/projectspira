-----------------------------------
--	Author: ReaperX
--  Unstable Displacement at D-8
--  Teleports Player to C-9 (needs to be opened with Giant Scale first)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Riverne_Site_#B01/TextIDs"] = nil;
require("scripts/zones/Riverne_Site_#B01/TextIDs");

GiantScale = 0x069B;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
state = npc:getState();
if (state == 8) then
	player:startEvent(Event(0x26));
else
	player:specialMessage(VERY_SMALL);
end; 
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 1) and (trade:hasItemQty(GiantScale,1)) then
	npc:setState(RIVERNE_PORTERS);
	player:specialMessage(HAS_GROWN);
	trade:isComplete();
end; 
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;