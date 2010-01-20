-----------------------------------
--	Author: Tenjou and Friends
-- 	Jack of Hearts (Scripting Tutorial I)
--  Shows a map of Windurst, gives advice, and accepts Adventurer Coupons.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x271b = Event(0x271b);
event0x271b:setParams(0,1);
player:startEvent(event0x271b);
end; 
 
 
-----------------------------------
--onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x218,1);
if (count == 1 and item1 == true) then
	local event0x271c = Event(0x271c);
	event0x271c:setParams(GIL_RATE*50);
	player:startEvent(event0x271c);
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