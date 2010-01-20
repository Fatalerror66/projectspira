-----------------------------------
--	Author: Caspian
-- 	Gregory
-- 	He is related to ENM events.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	npcname = npc:getName();
	npcid = npc:getId();
	--print("Name:",npcname);
	--print("NPC ID:",npcid);
	
	-- Mission Flag
	Mothercrystal = player:getMissionStatus(6,3)
	-----------------------------------
	-- Dialogues,cutscenes,etc. go below.
	-----------------------------------
	if (Mothercrystal == 1 or Mothercrystal == 2) then
		player:startEvent(Event(0x101));
	else
		player:startEvent(Event(0x100));
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