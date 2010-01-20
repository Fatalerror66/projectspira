-----------------------------------
--	Author: ChrisKara
-- 	Brian
--	NPC just giving fame for quest test purposes,this NPC is only appearing during holidays
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
bf = player:getFame(1);
night = getVanaHour();
--print("Name:",npcname);
--print("NPC ID:",npcid);
--print("Bastok Fame",bf);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
 	--player:setFame(1,2000);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 