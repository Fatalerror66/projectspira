-----------------------------------
--	Author: Almendro
-- 	Ken
--	Involved in the quest "All by myself" Incomplete due to the lack of functions. Also involved in "Lure of the Wildcats - Bastok"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x02000);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x02000);
	player:startEvent(Event(0x1B0));
elseif (player:getQuestStatus(1,76) == 0) then
	player:startEvent(Event(0x170));
elseif(player:getQuestStatus(1,76) == 1) then
	player:startEvent(Event(0x16F));
else
	player:startEvent(Event(0x172));
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