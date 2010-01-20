-----------------------------------
--	Author: Jax
-- 	Glenne
--	Quest added (A Sentry's Peril)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
Ointment = 600;
OintmentCase = 601;
BronzeSubligar = 0x3220;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
ASentrysPeril = player:getQuestStatus(0,0);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (ASentrysPeril == 0) then
		player:startEvent(Event(0x1FE));
	elseif (ASentrysPeril == 1 and player:hasItem(Ointment) == 0 and player:getVar("ASentrysPeril") == 1) then
		player:startEvent(Event(0x284));
	elseif (ASentrysPeril == 1) then
		player:startEvent(Event(0x208));
	elseif (ASentrysPeril == 2) then
		player:startEvent(Event(0x209));
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
	elseif (trade:hasItemQty(OintmentCase,1) == true and player:getQuestStatus(0,0) == 1 and player:getVar("ASentrysPeril") == 2 and count == 1) then
		trade:isComplete();
		player:startEvent(Event(0x201));
	else 
		player:startEvent(Event(0x202));
	end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)

	if (csid == 0x201) then
		player:addItem(BronzeSubligar);
		player:specialMessage(ITEM_OBTAINED,BronzeSubligar);
		player:setTitle(59); -- 	 Ronfaurian Rescuer 		
		player:completeQuest(0,0);
		player:addFame(0,SAN_FAME*30);
		player:setVar("ASentrysPeril",0)
	elseif (csid == 0x1FE and option == 0) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(Ointment);
			player:specialMessage(ITEM_OBTAINED,Ointment);
			player:addQuest(0,0)
			player:setVar("ASentrysPeril",1)
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED);
		end
	elseif (csid == 0x0284) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(Ointment);
			player:specialMessage(ITEM_OBTAINED,Ointment);
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED);
		end
	end
end;