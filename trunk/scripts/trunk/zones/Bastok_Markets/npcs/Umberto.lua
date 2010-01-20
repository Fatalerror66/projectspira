-----------------------------------
--	Author: ChrisKara10
--	Umberto
-- 	Involved in 2 different Quest "Pictures Prefect" & "Too Many Chefs" INCOMPLETE
--	Incomplete due to the Quest starting uncomplete 
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
bf = player:getFame(1);
--print("Name:",npcname);
--print("NPC ID:",npcid);
--print("Bastok Fame",bf);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

	player:startEvent(Event(0x198));
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 