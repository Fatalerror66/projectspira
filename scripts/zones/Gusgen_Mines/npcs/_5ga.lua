-----------------------------------
--	Author: Aurelias
-- 	Lever for Door A
-- 	Opens door for 300 seconds, shuts others
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
	npc:setState(2);
	npc1 = getNPCById(17580350,0xc4)
	npc2 = getNPCById(17580349,0xc4)
	npc3 = getNPCById(17580348,0xc4)
	npc1:setState(0);
	npc2:setState(0);
	npc3:setState(300);	--Opens door for 5 mins
end; 
 