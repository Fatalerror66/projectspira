------------------------------------------
-- Narcheral, Cathedral, North San d'Oria
-- WHM AF1 
-- By ReaperX, Mana
------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/Gearsets");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

TavnaziaPass = 0x448;
BlessedHammer = 0x440E;
YagudoHolyWater = 0x449;
Moccasins = 0x32C3;
TavnazianMask = 0x3612;
ParagonOfWhiteMageExcellence = 223;

function onTrigger(player,npc) 
if (player:getQuestStatus(0,87) == 0) and (player:getMainJob() == 3) and (player:getMainLvl() >=AF1_QUEST_LEVEL) then
	player:startEvent(Event(0x2B1));
elseif player:getVar("WHM_AF1_STATUS") == 2 then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(BlessedHammer);
		player:specialMessage(ITEM_OBTAINED,BlessedHammer);
		player:completeQuest(0,87);
		player:addFame(0,SAN_FAME*AF1_FAME);
		player:setVar("WHM_AF1_STATUS",0);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,BlessedHammer);
	end;	
elseif player:getVar("WHM_AF2_STATUS") == 2 then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(HealersDuckbills);
		player:specialMessage(ITEM_OBTAINED,HealersDuckbills);
		player:completeQuest(0,88);
		player:addFame(0,SAN_FAME*AF2_FAME);
		player:setVar("WHM_AF2_STATUS",0);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,HealersDuckbills);
	end;	
elseif player:getVar("WHM_AF3_STATUS") == 3 then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(HealersBriault);
		player:specialMessage(ITEM_OBTAINED,HealersBriault);
		player:completeQuest(0,89);
		player:setTitle(ParagonOfWhiteMageExcellence);
		player:addFame(0,SAN_FAME*AF3_FAME);
		player:setVar("WHM_AF3_STATUS",0);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,HealersBriault);
	end;	
else
	player:startEvent(Event(0x2B0)) -- >2B4
end;
end;  

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(FLYER_REFUSED) 
	elseif player:getQuestStatus(0,87) == 1 and trade:getItemCount() == 1 and trade:getItemQty(TavnaziaPass) == 1 then
		trade:isComplete();
		player:startEvent(Event(0x2B2));
	elseif player:getQuestStatus(0,88) == 1 and trade:getItemCount() == 2 and trade:getItemQty(YagudoHolyWater) == 1 and trade:getItemQty(Moccasins) == 1 then
		trade:isComplete();
		player:startEvent(Event(0x2B3));
	elseif player:getQuestStatus(0,89) == 1 and trade:getItemCount() == 1 and trade:getItemQty(TavnazianMask) == 1 then
		trade:isComplete();
		player:startEvent(Event(0x2B4));
	end;
end; 

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x2B1) then
	player:setVar("WHM_AF1_STATUS",1);
	player:addQuest(0,87);
	if DEBUG_MODE then
		player:setPos(-714, -10, -68, 120, 0x67);
	end;
elseif (csid == 0x2B2) then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(BlessedHammer);
		player:specialMessage(ITEM_OBTAINED,BlessedHammer);
		player:completeQuest(0,87);
		player:addFame(0,SAN_FAME*AF1_FAME);
		player:setVar("WHM_AF1_STATUS",0);
	else -- this should usually not happen, since the player traded an item to get the CS. But I implemented it just in case
		 -- there's some way I don't know about a partied char in Sandy could have items in the treasure pool or SE decides to add one.
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,BlessedHammer);
		player:setVar("WHM_AF1_STATUS",2);
	end;	
elseif (csid == 0x2B3) then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(HealersDuckbills);
		player:specialMessage(ITEM_OBTAINED,HealersDuckbills);
		player:completeQuest(0,88);
		player:addFame(0,SAN_FAME*AF2FAME);
		player:setVar("WHM_AF2_STATUS",0);
	else -- this should usually not happen, since the player traded an item to get the CS. But I implemented it just in case
		 -- there's some way I don't know about a partied char in Sandy could have items in the treasure pool or SE decides to add one.
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,HealersDuckbills);
		player:setVar("WHM_AF2_STATUS",2);
	end;	
elseif (csid == 0x2B4) then
	if (player:getFreeSlotCount(0) > 0) then
		player:addItem(HealersBriault);
		player:specialMessage(ITEM_OBTAINED,HealersBriault);
		player:completeQuest(0,89);
		player:setTitle(ParagonOfWhiteMageExcellence);
		player:addFame(0,SAN_FAME*AF3FAME);
		player:setVar("WHM_AF3_STATUS",0);
	else -- this should usually not happen, since the player traded an item to get the CS. But I implemented it just in case
		 -- there's some way I don't know about a partied char in Sandy could have items in the treasure pool or SE decides to add one.
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,HealersBriault);
		player:setVar("WHM_AF3_STATUS",3);
	end;	
end;
end;
