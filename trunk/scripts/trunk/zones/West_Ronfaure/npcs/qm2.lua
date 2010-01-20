-----------------------------------
--	Author: Jax
-- 	qm1
-- 	Qwest The Dismayed Customer
-----------------------------------
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------
-- Initialization

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:specialMessage(1135); 
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

-----------------------------------
-- onEventFinish Action
-----------------------------------	
function onEventFinish(player,csid,option)
end
end

end;