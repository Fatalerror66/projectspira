-----------------------------------
--	Author: Almendro
-- 	Yazan
-- 	Bite the Dust
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
SandBatFang = 0x3F7;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	BitetheDust = player:getQuestStatus(1,46);
	bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if(BitetheDust == 0 and bflvl >= 2)then
		player:startEvent(Event(0xBF));
		player:addQuest(1,46);
	elseif(BitetheDust == 1)then
		player:startEvent(Event(0xC0));
	elseif(BitetheDust == 2)then
		player:startEvent(Event(0xC2));
	else
		player:startEvent(Event(0xBE));
	end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	BitetheDust = player:getQuestStatus(1,46);
	count = trade:getItemCount();
    gil = trade:getGil();
	SandBatFang1 = trade:hasItemQty(SandBatFang,1);
	
	if(BitetheDust ~= 0 and SandBatFang1 and count == 1 and gil == 0)then
		trade:isComplete();
		player:startEvent(Event(0xC1));
	end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	BitetheDust = player:getQuestStatus(1,46);
	if(csid == 0xC1)then
		if(BitetheDust == 1)then
			player:completeQuest(1,46);			
			player:addFame(1,BAS_FAME*80);
			player:setTitle(108); -- Sand Blaster 
		else
			player:addFame(1,BAS_FAME*8);		
		end
		player:addGil(GIL_RATE*350);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*350);
	end
end;