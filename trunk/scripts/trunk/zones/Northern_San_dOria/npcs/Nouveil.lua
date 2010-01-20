-----------------------------------
--	Author: Jax
-- 	Nouveil
--	Quest added  (Waters of the Cheval)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
BlessedWaterskin = 602
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
WatersoftheCheval = player:getQuestStatus(0,1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (player:getVar("Waters") == 1) then
		player:startEvent(Event(0x023f));
	elseif (player:getVar("Waters") == 2) then
		player:startEvent(Event(0x023c));
	elseif (WatersoftheCheval == 2) then
		player:startEvent(Event(0x024c));
	else
		player:startEvent(Event(0x023e));
	end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
 -- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then
		player:specialMessage(1488);
	elseif (trade:getGil() == 10 and player:getQuestStatus(0,1) == 1 and count == 1) then
		trade:isComplete();
		player:startEvent(Event(0x023b));
	else 
		player:startEvent(Event(0x023d));
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x023b) then
	if(player:getFreeSlotCount(0) >=1) then
		player:setVar("Waters",2);	
		player:addItem(BlessedWaterskin);
		player:specialMessage(ITEM_OBTAINED,BlessedWaterskin);
	else 
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED);
		player:addGil(10);

		end
	end
end;