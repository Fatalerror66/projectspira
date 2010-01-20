-----------------------------------
--	Author: Tenjou
-- 	Lucia
-- 	Admits players to the dock in Selbina.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	-----------------------------------
	-- Dialogues,cutscenes,etc. go below.
	-----------------------------------
	event0xdd = Event(0xdd);
	event0xdd:setParams(player:getCurrGil(),100);
	player:startEvent(event0xdd);
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
	if (player:getZPos() < -28) then
		player:removeGil(100);
	end
end;