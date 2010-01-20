---------------------
--- NPC: Esca ----------
--- Area: West Ronfaure -------
--- Created by: Raiendel ------
--- 11/20/2008 - InComplete -----
-- Pickpocket Quest by Kphiyr
---------------------
-- NPC Required
----Related CS's to this NPC-----
--need: what do u want?
--77
--7B What is it!? ...Leave!
--78 Me, a pickpocket?
--79 what's that? that eagle button,
--7A what's this? --trade wrong item
--80 What? You lost the glasses!?-
--89
--8A
---------------------
GiveItem = 0x0079;
NoSlot = 0x0089;
NoReplaceItem = 0x0080;
WrongTrade = 0x007A;


EagleButton=578;
GiltGlasses=579;
QuestID=3;
require("/scripts/globals/common");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");


--------------------
-- Functions ---------------
--------------------
function onTrigger(player,npc)
	if (player:getQuestStatus(0,QuestID) == 1 and player:hasItem(EagleButton) == 1) then
		player:startEvent(Event(0x0078));
	elseif (player:getQuestStatus(0,QuestID) == 1 and player:hasItem(GiltGlasses) == 0 and player:getVar("ObtainedGlasses")==1) then
		player:startEvent(Event(0x0080));
	else
		player:showText(npc,1093);
	end	
end;
-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 	if (trade:hasItemQty(EagleButton,1) == true and player:getQuestStatus(0,QuestID) == 1 and player:getVar("ObtainedGlasses")==0) then
		player:setVar("ObtainedGlasses",1);
		trade:isComplete();
		player:startEvent(Event(GiveItem));
	else 
		player:startEvent(Event(WrongTrade));
	end

 
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
	
	
	if (csid == GiveItem) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(GiltGlasses);
		end
	end

	
end;