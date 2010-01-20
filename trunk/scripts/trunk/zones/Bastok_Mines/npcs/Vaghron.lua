-----------------------------------
--	Author: Almendro
-- 	vaghron
-- 	Involved in quest "Lure of the wildcat"
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
    local wildcatc = testflag(tonumber(wildcatcount),0x80000);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x80000);
	player:startEvent(Event(0x1F7));
else
	-- General chat text
	player:startEvent(Event(0x76));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 