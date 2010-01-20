-----------------------------------
--	Author: Almendro
-- 	Tilian
-- 	Basic Chat Text & "Lure of the Wildcat (Bastok)"
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
  	 wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
         wildcatc = testflag(tonumber(wildcatcount),0x00010);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00010);
	player:startEvent(Event(0x161));
else
	player:startEvent(Event(0x64));
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