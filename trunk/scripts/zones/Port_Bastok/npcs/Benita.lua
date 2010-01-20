-----------------------------------
--	Author: Almendro
-- 	Benita
-- 	"The Wisdom of Elders"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
BombAsh = 0x3A0;
TravelersHat = 0x30D4;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TheWisdomofElders = player:getQuestStatus(1,36);
TheWisdomofElders_tempVar = player:getVar("TheWisdomofElders_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(TheWisdomofElders == 0)then
	player:startEvent(Event(0xAE));
	player:addQuest(1,36);
	player:setVar("TheWisdomofElders_tempVar",1);
elseif()
end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
TheWisdomofElders_tempVar = player:getVar("TheWisdomofElders_tempVar");
BombAsh1 = trade:hasItemQty(BombAsh,1);
       count = trade:getItemCount();
         gil = trade:getGil();
if(TheWisdomofElders_tempVar == 1 and BombAsh1 and count == 1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0xB0));
end 
end;  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xB0)then
	if(player:getFreeSlotCount(0)>=1)then
		player:completeQuest(1,36);
		player:addFame(1,BAS_FAME*65);
		player:addItem(TravelersHat);
		player:specialMessage(ITEM_OBTAINED,TravelersHat);
		player:setVar("TheWisdomofElders_tempVar",0); -- Deletes from server
	else
		player:specialMessage(FULL_INVENTORY_AFTER_TRADE,TravelersHat);
		quantity = player:hasItem(BombAsh);
		stacks = math.floor(quantity/12);
		player:removeItem(BombAsh,quantity,0);
		if(stacks > 0)then
			i = 1;
			while(i <= stacks)do
				player:addItem(BombAsh,12,0);
				i = i + 1;
			end
			player:addItem(BombAsh,math.floor(math.fmod(quantity,12)) + 1,0);
		else			
			player:addItem(BombAsh,quantity+1,0);
		end
	end
end
end;