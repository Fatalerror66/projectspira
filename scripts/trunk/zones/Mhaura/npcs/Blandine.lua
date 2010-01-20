-----------------------------------
--	Author: Tenjou, Aurelias
-- 	Blandine
-- 	Starts quest "The Sand Charm."
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

if(charm == 0)then
player:startEvent(Event(0x7a));
	player:setVar("The_Sand_Charm",1);
	elseif(charm == 3)then
		player:startEvent(Event(0x7c));
			player:setVar("The_Sand_Charm",4);
			elseif(charm == 4 or charm == 5)then
					player:startEvent(Event(0x7d));
					elseif(charm == 100)then
						player:startEvent(Event(0x80));
						else
			player:startEvent(Event(0x7a));
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