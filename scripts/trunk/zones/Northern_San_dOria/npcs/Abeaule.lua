-----------------------------------
--	Author: Jax
-- 	Abeaule
--	Quest added (The trader in the forest)(The medicine woman)
--	
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
Batagreens = 4367;
SuppliesOrder = 592;
Robe = 12600;
ColdMedicine = 0x0093;
-----------------------------------
function onTrigger(player,npc)
TraderintheForest = player:getQuestStatus(0,7);
MedicineWoman = player:getQuestStatus(0,30);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (TraderintheForest == 0) then
		player:startEvent(Event(0x020c));
	elseif (TraderintheForest == 1) then
		player:startEvent(Event(0x0251));
	elseif (TraderintheForest == 2 and MedicineWoman == 0) then
		player:startEvent(Event(0x0265));
	elseif (TraderintheForest == 2 and MedicineWoman == 1 and player:hasKeyItem(ColdMedicine)) then
		player:startEvent(Event(0x0266));
	elseif (TraderintheForest == 2 and MedicineWoman == 1) then
		player:startEvent(Event(0x0267));
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
	elseif (trade:hasItemQty(Batagreens,1) == true and player:getQuestStatus(0,7) == 1 and count == 1) then
		trade:isComplete();
		player:startEvent(Event(0x020d));
	end
end; 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x020c and option == 0) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addQuest(0,7)
			player:addItem(SuppliesOrder);
			player:specialMessage(ITEM_OBTAINED,SuppliesOrder);
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED);
		end  
	elseif (csid == 0x0251 and option == 1 and player:hasItem(SuppliesOrder) == 0) then
		if(player:getFreeSlotCount(0) >=1)then
			player:addItem(SuppliesOrder);
			player:specialMessage(ITEM_OBTAINED,SuppliesOrder);
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED);
		end  
	elseif (csid == 0x020d) then
		player:addItem(Robe);
		player:specialMessage(ITEM_OBTAINED,Robe);
		player:setTitle(67); -- 	 Green Grocer 		
		player:completeQuest(0,7);
		player:addFame(0,SAN_FAME*30);
	elseif (csid == 0x0265 and option == 0) then
		player:addQuest(0,30)
	elseif (csid == 0x0266) then
		player:removeKeyItem(ColdMedicine)
		player:addGil(2100)
		player:specialMessage(GIL_OBTAINED,2100);
		player:setTitle(74); -- 	Traveling Medicine Man 		
		player:completeQuest(0,30);
		player:addFame(0,SAN_FAME*30);
	end
end;