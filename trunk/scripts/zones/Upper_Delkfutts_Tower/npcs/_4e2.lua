-----------------------------------
--	Author: ReaperX
-- 	Elevator (10th floor of Delkfutt's Tower)
-- 	involved in "Magicite" Mission

-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");

KeyitemDelkfuttKey = 0x457;
ItemDelkfuttKey = 0x225;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:hasKeyItem(KeyitemDelkfuttKey) == 1) then
	player:startEvent(Event(0x6));
else
  player:specialMessage(20); -- "This elevator goes down, but it is locked. Perhaps a key is needed to activate it."
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

if  trade:getItemCount() == 1 and trade:hasItemQty(ItemDelkfuttKey,1) then
	-- trade is not completed so that the key doesn't get lost.
  player:startEvent(Event(0x6));
end;
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;