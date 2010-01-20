-- Author: Mana, SharXeniX, Almendro
-- Eperdur 
-- "Altana's Sorrow"
----------------------------------- 
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------
-- Initialization
LetterfromVirnage = 0xAE;
ScrollofteleportDem = 0x127B;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
altanasSorrow = player:getQuestStatus(1,49);			--Get Altana's Sorrow quest status
keyLetter = player:hasKeyItem(LetterfromVirnage);		--Get "Letter from Virnage" key item
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if(altanasSorrow == 1 and keyLetter == 1)then
		player:startEvent(Event(0x2A7));
	else
		-- default chat text
		player:startEvent(Event(0x2A6));
	end
end; 


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	end 
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if(csid == 0x2A7)then
		if(player:getFreeSlotCount(0)>=1) then								--Check if there is free space in the inventory
			player:removeKeyItem(LetterfromVirnage);						--Remove "Letter from Virnage" key item
			player:addItem(ScrollofteleportDem);							--Add Scroll of teleport-Dem
			player:specialMessage(ITEM_OBTAINED,ScrollofteleportDem,1);		--Display message: You obtain a scroll of Teleport-Dem!
			player:addFame(1,BAS_FAME*100);									--Add 100 to bastok fame
			player:completeQuest(1,49);										--Move quest to completed log
			player:setTitle(49);											--receive title "Pilgrim to Dem"
		else
			player:specialMessage(ITEM_CANNOT_BE_OBTAINED,ScrollofteleportDem,1);
		end
	end
end;