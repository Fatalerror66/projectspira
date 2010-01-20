-----------------------------------
--	Author: Aurelias
-- 	Door Text
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
require("scripts/zones/Gusgen_Mines/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	player:specialMessage(896);
end; 
 