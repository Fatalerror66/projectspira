-----------------------------------
--	Author: ReaperX
-- 	Granite Door
-- 	leads to painbrush room @ F-7
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
z = player:getZPos();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (z < 11) then
	player:specialMessage(908,1136);
else
	player:startEvent(Event(0x2F));
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if(trade:getItemCount() == 1 and trade:hasItemQty(1136,1)) then
	trade:isComplete();
	player:startEvent(Event(0x2E));	
	player:specialMessage(911,0000,1136);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;