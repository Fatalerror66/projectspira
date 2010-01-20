-----------------------------------
--	Author: Jax
-- 	Miageau
--	Quest added (Waters of the Cheval)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
ChevalWater = 603
WingPendant = 13183
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
WatersoftheCheval = player:getQuestStatus(0,1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (WatersoftheCheval == 0) then
		player:startEvent(Event(0x01f8));
	elseif (WatersoftheCheval == 1 and player:getVar("Waters") == 2) then
		player:startEvent(Event(0x0200));
	elseif (WatersoftheCheval == 1) then
		player:startEvent(Event(0x0207));
	elseif (WatersoftheCheval == 2) then
		player:startEvent(Event(0x0205));
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
	elseif (trade:hasItemQty(ChevalWater,1) == true and player:getQuestStatus(0,1) == 1 and count == 1) then
		trade:isComplete();
		player:startEvent(Event(0x0203));
	else 
		player:startEvent(Event(0x01fa));
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x0203) then
		player:addItem(WingPendant);
		player:specialMessage(ITEM_OBTAINED,WingPendant);
		player:setTitle(63); -- 	 The Pure One 		
		player:completeQuest(0,1);
		player:addFame(0,SAN_FAME*30);
		player:setVar("Waters",0);
	elseif (csid == 0x01f8) then
		player:addQuest(0,1)
		player:setVar("Waters",1);
	end
end;