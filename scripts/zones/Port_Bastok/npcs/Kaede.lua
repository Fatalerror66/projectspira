-----------------------------------
--	Author: Almendro
-- 	Kaede
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
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x00001);
    
	joblevel = player:getMainLvl();
	airshippass = player:hasKeyItem(9);
	ninQuestCS = player:getVar("ayameandkaede-CS");
	ninQuest =player:getQuestStatus(1,60);
	
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00001);
	player:startEvent(Event(0x160));
else
	-- TODO: Check if job is already unlocked
	if(joblevel >= 30 and airshippass == 1 and ninQuestCS ~= 1 and ninQuest == 0) then
		player:startEvent(Event(0x00F0));
	else	
		player:startEvent(Event(0x001A));
	end;
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

if(csid == 0x00F0) then
	player:setVar("ayameandkaede-cs",1);
end;
end;