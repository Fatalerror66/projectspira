-----------------------------------
--	Author: ChrisKAra10
-- 	Reinberta
--	Goldsmith Guild Item "Ranks and Sign up" INCOMPLETE	
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
craftguild = player:getVar("craftGuild");
	
	--if (craftguild == 0) then
		player:startEvent(Event(0x12C));
	--end;
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
craftguild = player:getVar("craftGuild");

	--if (csid == 0x12C and option == 1) then
		--player:setVar("craftGuild",1);
	--end;
end;