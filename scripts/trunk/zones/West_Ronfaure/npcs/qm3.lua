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
	if (player:getQuestStatus(0,6) == 1) then
		player:addKeyItem(0x0081);
		player:specialMessage(KEYITEM_OBTAINED,0x0081);
	else
		player:specialMessage(1135);
	end
end;
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

end;