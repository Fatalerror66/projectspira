-----------------------------------
--	Author: ChrisKAra10
-- 	Samia
-- 	She talk about her husband and the Maws
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	samia = math.random(1,2);
	if (samia == 1) then
		player:startEvent(Event(0x6F));
	elseif (samia == 2) then
		player:startEvent(Event(0x1E9));
	end; 
 
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 