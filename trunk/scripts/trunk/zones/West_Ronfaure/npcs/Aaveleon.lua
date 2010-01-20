-----------------------------------
--	Author: Jax
-- 	Aaveleon
-- 	Qwest A Sentrys Peril
-----------------------------------
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------
-- Initialization
Ointment = 600;
OintmentCase = 601;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
ASentrysPeril = player:getQuestStatus(0,0);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (player:getVar("ASentrysPeril") == 2 and ASentrysPeril == 1) then
		event = Event(0x7e);
		event:setParams(601,0,0,0,0,0,0,0);
		player:startEvent(event);
	else
		player:startEvent(Event(0x65));
		
	end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
 
 	if (trade:hasItemQty(Ointment,1) == true and ASentrysPeril == 1 and player:getFreeSlotCount(0) <=0) then
		player:startEvent(Event(0x0076));
	
	elseif (trade:hasItemQty(Ointment,1) == true and ASentrysPeril == 1 and count == 1) then
		trade:isComplete();		
		player:startEvent(Event(0x0064));
  	else 
		player:startEvent(Event(0x006a));
	end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

	if (csid == 0x7e and option == 1 and player:hasItem(OintmentCase) == 0) then
		player:addItem(OintmentCase);	
		player:specialMessage(ITEM_OBTAINED,OintmentCase);
	

	elseif (csid == 0x0064) then
		player:addItem(OintmentCase);
		player:setVar("ASentrysPeril",2);
		player:specialMessage(ITEM_OBTAINED,OintmentCase);
	
	end
end;
 