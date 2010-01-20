-----------------------------------
--	Author: Tenjou
-- 	Name of NPC
-- 	Description,especially related to what needs to be done,what can and can't be done,what has and hasn't been done,etc.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0xe6 = Event(0x800e6);
gil = player:getCurrGil();
--print("Gil:",gil);
event0xe6:setParams(0xd,9,9,9,9,9,9,9);
player:startEvent(event0xe6);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
--DELETE THE BELOW IF UNUSED--
count = trade:getItemCount();
--print("count: " .. count);
itemid = {};
amount = {};
for i = 1,count do
itemid[i] = trade:getItem(i);
amount[i] = trade:getItemQty(i);
	if (item1 == 0x000) then
	else
	end
end
--DELETE THE ABOVE IF UNUSED--
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
player:updateEvent(9,9,9,9,9,9,9,9);
--print("OPTION:",option);
end;