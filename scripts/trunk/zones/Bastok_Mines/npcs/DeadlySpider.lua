-----------------------------------
--	Author: ChrisKara10 & Almendro
-- 	Deadly Spider
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
        StampHuntC = testflag(tonumber(StampHuntCount),0x2);

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Stamp Hunt"
if(StampSheet == 1 and StampHuntC == false) then
	player:setVar("StampHunt-Counter",StampHuntCount+0x2);
	player:startEvent(Event(0x56));
else
	player:startEvent(Event(0x11));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 