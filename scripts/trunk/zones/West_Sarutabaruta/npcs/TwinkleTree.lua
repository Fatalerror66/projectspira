-----------------------------------
--	Author: Tenjou
-- 	Twinkle Tree
-- 	INCOMPLETE: Involved in quest "To Catch a Falling Star"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local starfall = player:getVar("toCatchAFallingStar");
hour = getVanaHour();
if (starfall == 2 and hour >= 0 and hour < 3) then
	player:specialMessage(950);
else
	player:specialMessage(951);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local starfall = player:getVar("toCatchAFallingStar");
hour = getVanaHour();
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x364,1);
if (starfall == 2 and hour >= 0 and hour < 3 and count == 1 and item1) then
	trade:isComplete();
	player:specialMessage(20,0x222);
	player:addItem(0x222);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;