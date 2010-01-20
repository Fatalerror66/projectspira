-----------------------------------
--	Author: Almendro
-- 	Elayne
-- 	NPC that is involved with the quest "Stamp Hunt"
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end

        StampSheet = player:hasKeyItem(0x66);
    StampHuntCount = player:getVar("StampHunt-Counter");
        StampHuntC = testflag(tonumber(StampHuntCount),0x10);

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Stamp Hunt"
if(StampSheet == 1 and StampHuntC == false) then
	player:setVar("StampHunt-Counter",StampHuntCount+0x10);
	player:startEvent(Event(0x2D5));
else
	player:startEvent(Event(0x2C0));
end
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
end;