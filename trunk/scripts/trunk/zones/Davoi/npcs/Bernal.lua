-----------------------------------
--	Author: Aurelias
-- 	Bernal
-- 	Introduces himself then lets you in and out of the tower.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
intro = player:getVar("Bernal_intro_Davoi")
	if(intro == 0) then
		player:startEvent(Event(0x001f));
		player:setVar("Bernal_intro_Davoi",1)
	else
		player:startEvent(Event(0x001e));
	end
end; 
