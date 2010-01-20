-----------------------------------
--	Author: Tenjou
-- 	Jack of Clubs
--  Shows a map of Windurst, gives advice, and accepts Adventurer Coupons.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x2717 = Event(0x2717);
event0x2717:setParams(0,3);
player:startEvent(event0x2717);
end; 
 
 
-----------------------------------
--onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x218,1);
if (count == 1 and item1 == true) then
	local event0x2718 = Event(0x2718);
	event0x2718:setParams(GIL_RATE*50);
	player:startEvent(event0x2718);
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