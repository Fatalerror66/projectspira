-----------------------------------
--	Author: ChrisKara10 & Almendro
--  Salimah
--  "Gourmet" Quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
Gourmet = player:getQuestStatus(1,12);
FFTime = getVanaHour();
GourmetJustDone = player:getVar("GourmetJustDone");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	-- if "Gourmet" not active trigger Quest --
	if (Gourmet ~= 2) then
		if(Gourmet == 0)then
			player:addQuest(1,12);
		end
		player:startEvent(Event(0xC8));		
	-- if "Gourmet" is finished --
	elseif (Gourmet == 2) then
		if(GourmetJustDone == 1)then
			player:startEvent(Event(0x79));
		else
			player:startEvent(Event(0xC8));
		end
	end

end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 FFTime = getVanaHour();
  count = trade:getItemCount();
    gil = trade:getGil();
Gourmet = player:getQuestStatus(1,12);
GourmetJustDone = player:getVar("GourmetJustDone");
  
 Sleepmushroom = 0x1116;
Sleepmushroom1 = trade:hasItemQty(Sleepmushroom,1);
    TreantBulb = 0x3B9;
   TreantBulb1 = trade:hasItemQty(TreantBulb,1);
     WildOnion = 0x1123;
    WildOnion1 = trade:hasItemQty(WildOnion,1);

if((Sleepmushroom1 or TreantBulb1 or WildOnion1) and GourmetJustDone~=1 and Gourmet ~= 0 and count == 1 and gil == 0) then
    -- Sleepshroom: Trade during 18:00-5:59 for 200 gil 
	if (FFTime >= 18 or FFTime <= 5) then
		if (Sleepmushroom1) then
			player:setVar("GourmetFood",1); -- Sleepshroom
			SalimahEvent = Event(0xC9);
			SalimahEvent:setParams(Sleepmushroom);
			player:startEvent(SalimahEvent);		
		elseif(TreantBulb1)then
			SalimahEvent = Event(0xCB);
			SalimahEvent:setParams(TreantBulb);
			player:startEvent(SalimahEvent);
		else
			SalimahEvent = Event(0xCB);
			SalimahEvent:setParams(WildOnion);
			player:startEvent(SalimahEvent);
		end
		trade:isComplete();
	-- Treant Bulb: Trade during 6:00-11:59 for 200 gil 
	elseif(FFTime >= 6 or FFTime <= 11) then
		if (TreantBulb1) then
			player:setVar("GourmetFood",2); -- Sleepshroom
			SalimahEvent = Event(0xC9);
			SalimahEvent:setParams(TreantBulb);
			player:startEvent(SalimahEvent);		
		elseif(Sleepmushroom1)then
			SalimahEvent = Event(0xCB);
			SalimahEvent:setParams(Sleepmushroom);
			player:startEvent(SalimahEvent);
		else
			SalimahEvent = Event(0xCB);
			SalimahEvent:setParams(WildOnion);
			player:startEvent(SalimahEvent);
		end
		trade:isComplete();
	-- Wild Onion: Trade during 12:00-17:59 for 350 gil 
	elseif(FFTime >= 12 or FFTime <= 17) then
		if (WildOnion1) then
			player:setVar("GourmetFood",3); -- Sleepshroom
			SalimahEvent = Event(0xC9);
			SalimahEvent:setParams(WildOnion);
			player:startEvent(SalimahEvent);		
		elseif(Sleepmushroom1)then
			SalimahEvent = Event(0xCB);
			SalimahEvent:setParams(Sleepmushroom);
			player:startEvent(SalimahEvent);
		else
			SalimahEvent = Event(0xCB);
			SalimahEvent:setParams(TreantBulb);
			player:startEvent(SalimahEvent);
		end
		trade:isComplete();
	end
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
Gourmet = player:getQuestStatus(1,12);
if(csid == 0xC9) then
	if(Gourmet == 1)then
		player:completeQuest(1,12);
		player:setTitle(86); -- Mommy's Helper
		player:addFame(1,BAS_FAME*100);
	else
		player:addFame(1,BAS_FAME*10);
	end
	food = player:getVar("GourmetFood");
	gilReward = 0;
	if(food == 1 or food == 2)then
		gilReward=200;
	else
		gilReward=350;
	end
	player:addGil(GIL_RATE*gilReward);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*gilReward);
	player:setVar("GourmetJustDone",1);
	player:setVar("GourmetFood",0); -- Deleting from server
elseif(csid == 0xCB)then
	if(Gourmet == 1)then
		player:completeQuest(1,12);
		player:setTitle(86); -- Mommy's Helper
		player:addFame(1,BAS_FAME*100);
	else
		player:addFame(1,BAS_FAME*8); -- Its not 10 because its has no sense to give the same reputation when repeating the quest giving the wrong or the correct item.
	end
	player:addGil(GIL_RATE*100);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*100);
	player:setVar("GourmetJustDone",1);
end
end;