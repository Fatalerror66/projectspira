-----------------------------------
--	Author: Tenjou, Aurelias
-- 	Zexu
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

if(charm == 2)then
	player:startEvent(Event(0x7b));
		player:setVar("The_Sand_Charm",3);
		else
			player:startEvent(Event(0x79));
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