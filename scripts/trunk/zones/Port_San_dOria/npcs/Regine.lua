-----------------------------------
--	Author: Jax
-- 	Regine
--	Quest added (The Brugaire Consortium)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------
-- Initialization
MagicShopParcel = 593;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
BrugaireConsortium = player:getQuestStatus(0,12);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x01fe));
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
	elseif (trade:hasItemQty(MagicShopParcel,1) == true and player:getQuestStatus(0,12) == 1 and count == 1) then
		trade:isComplete();
		player:startEvent(Event(0x0217));
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x0217) then
		player:setVar("MagicParcel",2)
	end
end;