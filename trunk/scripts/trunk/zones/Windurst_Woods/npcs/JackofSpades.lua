-----------------------------------
--	Author: Tenjou
-- 	Jack of Spades
--  Shows a map of Windurst, gives advice, and accepts Adventurer Coupons.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x2719 = Event(0x2719);
event0x2719:setParams(0,4);
player:startEvent(event0x2719);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
item1 = trade:hasItemQty(0x218,1)
--print("count: " .. count);
if (count == 1 and item1 == true) then
	event0x271a = Event(0x271a);
	event0x271a:setParams(GIL_RATE*50);
	player:startEvent(event0x271a);
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