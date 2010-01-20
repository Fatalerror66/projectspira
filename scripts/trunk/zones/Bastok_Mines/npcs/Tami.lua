-----------------------------------
--	Author: ChrisKara10, Almendro
-- 	Tami
--	"Groceries"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- Initialization
TamisNote = 0x98;
RabbitMantle = 0x351A;
MeatJerky = 0x1118; -- 4376
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
              Groceries = player:getQuestStatus(1,37);
      Groceries_tempVar = player:getVar("Groceries_tempVar");
Groceries_cannot_repeat = player:getVar("Groceries_cannot_repeat");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (Groceries == 0) then
	player:startEvent(Event(0x6E));
elseif(Groceries == 1 and Groceries_tempVar == 3)then
	player:startEvent(Event(0x6F));
elseif(Groceries == 1 and Groceries_tempVar == 2)then
	player:startEvent(Event(0x70));
elseif (Groceries == 2 and player:getVar("Groceries_cannot_repeat") == 0) then
	if(Groceries_tempVar == 0)then
		player:startEvent(Event(0x6E));
	elseif(Groceries_tempVar == 3)then
		player:startEvent(Event(0x6F));
	elseif(Groceries_tempVar == 2)then
		player:startEvent(Event(0x70));
	elseif(Groceries_tempVar == 4)then
		player:startEvent(Event(0x73));
	end
else	
	player:startEvent(Event(0x73));
end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
Groceries_tempVar = player:getVar("Groceries_tempVar");
   seen_TamisNote = player:seenKeyItem(TamisNote);
		 
MeatJerky1 = trade:hasItemQty(MeatJerky,1);
     count = trade:getItemCount();
       gil = trade:getGil();		  
				  
if(Groceries_tempVar == 3 and MeatJerky1 and count == 1 and gil == 0)then	  
	trade:isComplete();
	player:startEvent(Event(0x71));
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
Groceries = player:getQuestStatus(1,37);
Groceries_tempVar = player:getVar("Groceries_tempVar");
if(csid == 0x6E)then
	player:addQuest(1,37);
	player:setVar("Groceries_tempVar",1);
	player:addKeyItem(TamisNote);
	player:specialMessage(KEYITEM_OBTAINED,TamisNote);
elseif(csid == 0x70)then
	if(Groceries == 1)then
		player:completeQuest(1,37);
		player:addFame(1,BAS_FAME*85);
	else
		player:addFame(1,BAS_FAME*9);
	end
	player:addGil(GIL_RATE*10);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*10);
	player:setVar("Groceries_tempVar",4);
elseif(csid == 0x71)then
	if(player:getFreeSlotCount(0)>=1)then
		if(Groceries == 1)then
			player:completeQuest(1,37);
			player:addFame(1,BAS_FAME*85);
		else
			player:addFame(1,BAS_FAME*9);
		end
		player:addItem(RabbitMantle);
		player:specialMessage(ITEM_OBTAINED,RabbitMantle);
		player:setVar("Groceries_tempVar",0);
		player:setVar("Groceries_cannot_repeat",1);
	else
		player:specialMessage(FULL_INVENTORY_AFTER_TRADE,RabbitMantle);
		quantity = player:hasItem(MeatJerky);
		stacks = math.floor(quantity/12);
		player:removeItem(MeatJerky,quantity,0);
		if(stacks > 0)then
			i = 1;
			while(i <= stacks)do
				player:addItem(MeatJerky,12,0);
				i = i + 1;
			end
			player:addItem(MeatJerky,math.floor(math.fmod(quantity,12)) + 1,0);
		else			
			player:addItem(MeatJerky,quantity+1,0);
		end
	end
end
end;