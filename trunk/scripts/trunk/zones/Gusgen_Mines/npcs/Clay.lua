-----------------------------------
--	Author: Aurelias
--  Clay
-- 	Gives player 'Gusgen Clay' quest does not need to be active
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
clay = player:hasItem(569)

if(clay == 1)then
	player:specialMessage(16,569)
	else
	player:addItem(569)
	player:specialMessage(20,569)
	end
end; 
