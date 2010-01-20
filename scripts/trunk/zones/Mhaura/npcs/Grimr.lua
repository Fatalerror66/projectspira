-----------------------------------
--	Author: Tenjou, Aurelias
-- 	Grimr
-- 	Working 100%.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
charm = player:getVar("The_Sand_Charm");

if(charm == 1)then
	player:startEvent(Event(0x78));
		player:setVar("The_Sand_Charm",2);
		else
			player:startEvent(Event(0x78));
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