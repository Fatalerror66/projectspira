-----------------------------------
--	Author: Tenjou
-- 	Dulsie
--  Shows a map of Bastok, gives advice, and accepts Adventurer Coupons.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x7));
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
item1 = trade:hasItemQty(0x218,1)
--print("count: " .. count);
if (count == 1 and item1 == true) then
	player:startEvent(Event(0x8));
	player:addGil(GIL_RATE*50);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*50);
	player:removeItem(0x218,1);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;