-----------------------------------
--	Author: Jax
-- 	Aaveleon
-- 	Qwest Waters of the Cheval
-----------------------------------
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
require("scripts/zones/East_Ronfaure/TextIDs");
-----------------------------------
-- Initialization
WaterSkin = 602
ChevalWater = 603
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:specialMessage(1156); -- The water sparkles in the light.
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
	if (trade:hasItemQty(WaterSkin,1) == true and count == 1) then
		trade:isComplete();
		player:addItem(ChevalWater);	
		player:specialMessage(1157,ChevalWater);
	end
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------	
function onEventFinish(player,csid,option)
end;