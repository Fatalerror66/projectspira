-----------------------------------
--	Author: Jax
-- 	Gulemont
--	Quest added (A Sentry's Peril)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------
-- Initialization
Papers = 0x0081;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
DismayedCustomer = player:getQuestStatus(0,6);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (DismayedCustomer == 0) then
		player:startEvent(Event(0x025d));
	elseif (DismayedCustomer == 1 and player:hasKeyItem(Papers) == 0) then
		player:startEvent(Event(0x025e));
	elseif (DismayedCustomer == 1 and player:hasKeyItem(Papers) == 1) then
		player:startEvent(Event(0x025f));
	end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then
		player:specialMessage(1488);
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x025d and option == 0) then
		player:addQuest(0,6);
	elseif (csid == 0x025f) then
		player:setTitle(66); --          Lost & Found Officer
		player:completeQuest(0,6);
		player:addFame(0,SAN_FAME*30);
		player:addGil(560)
		player:specialMessage(GIL_OBTAINED,560);
		player:removeKeyItem(Papers);
	end
end;