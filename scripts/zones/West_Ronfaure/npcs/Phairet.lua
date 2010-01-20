-----------------------------------
--	Author: Jax
-- 	Phairet
--	Quest added (The Trader in the Forest)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------
-- Initialization
BataGreens = 4367
SuppliesOrder = 592
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TraderintheForest = player:getQuestStatus(0,7);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (TraderintheForest <= 1) then
		player:startEvent(Event(0x0075));
	elseif (TraderintheForest == 2) then
		player:startEvent(Event(0x007f));
	end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
	if (trade:hasItemQty(SuppliesOrder,1) == true and player:getQuestStatus(0,7) == 1 and count == 1) then
		trade:isComplete();
		player:startEvent(Event(0x007c));
	elseif (trade:getGil() == 50 and player:getQuestStatus(0,7) == 2 and count == 1) then
		trade:isComplete();
		player:startEvent(Event(0x007c));
	else
		player:startEvent(Event(0x007d));
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x007c) then
		if(player:getFreeSlotCount(0) >=1) then
			player:addItem(BataGreens);
			player:specialMessage(ITEM_OBTAINED,BataGreens);
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED);
		end
	end
end;