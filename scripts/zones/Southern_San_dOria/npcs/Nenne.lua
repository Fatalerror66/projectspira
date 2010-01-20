-----------------------------------
--	Author: Aly
-- 	NPC:	Nenne
-- 	Quest: 	To Cure A Cough 
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
--Initialize
CoughMed = 0x9A;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    level = player:getMainLvl();
	 fame = player:getFame(0);
CoughCure = player:getQuestStatus(0,20);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (CoughCure == 0 and level >= 15 and fame >= 3) then
		player:startEvent(Event(0x21A));  -- Raminel enters house, learn of sickness
	elseif (CoughCure == 1 and player:hasKeyItem(CoughMed) == 0) then
		player:startEvent(Event(0x248));  -- learn more about Nenne
	elseif (player:hasKeyItem(CoughMed) == 1) then
		player:startEvent(Event(0x287));  -- Nenne receives medicine
	end
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then
		player:specialMessage(1488);
	end
end; 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x21A) then
	player:addQuest(0,20);
elseif (csid == 0x287) then
	player:removeKeyItem(CoughMed);
	player:completeQuest(0,20);
	player:setTitle(53);  		-- "A Moss Kind Person"
	player:addKeyItem(0x9B);	-- A Scroll of Treasure (keyItem)
	player:specialMessage(KEYITEM_OBTAINED,0x9B);
	player:addGil(GIL_RATE*3000);
	player:specialMessage(GIL_OBTAINED,3000);
	player:addFame(0,SAN_FAME*30);
end
end;