-----------------------------------
--	Author: ReaperX
-- 	Drop Gate
--  Leads to Sacrificial Chamber
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Den_of_Rancor/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(795);
end;
 
