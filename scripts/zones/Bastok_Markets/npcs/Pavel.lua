-----------------------------------
--	Author: Almendro
-- 	Pavel
--	Involved in the quest "Stamp Hunt" & "Lure of the Wild Cat"
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
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x04000);

        StampSheet = player:hasKeyItem(0x66);
    StampHuntCount = player:getVar("StampHunt-Counter");
        StampHuntC = testflag(tonumber(StampHuntCount),0x1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x04000);
	player:startEvent(Event(0x1AF));
-- "Stamp Hunt"
elseif(StampSheet == 1 and StampHuntC == false) then
	player:setVar("StampHunt-Counter",StampHuntCount+0x1);
	player:startEvent(Event(0xE3));
else
	-- General chat text
	player:startEvent(Event(0x80));
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
--print("CSID:",csid);
--print("RESULT:",option);
end;