-----------------------------------
--	Author: Arcanedemon
-- 	ValahMolkot
-- 	A Lady's Heart
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
Amaryllis = 0x3BD;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event = Event(0xA0);
event:setParams(0,0,0);
player:startEvent(event);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
Amaryllis1 = trade:hasItemQty(Amaryllis,1);
     count = trade:getItemCount();
       gil = trade:getGil();
if(Amaryllis1 and count == 1 and gil ==0)then
	event = Event(0xA0);
	event:setParams(0,0,2);
	player:startEvent(event);
	if(player:getQuestStatus() ~=2)then
		trade:isComplete();		
		if(player:getQuestStatus() ==0)then
			player:addQuest(1,50);		
		end
		player:completeQuest(1,50);
		-- Give player moghouse exits access
		-- and message related with that
	else	
		event = Event(0xA0);
		event:setParams(0,0,4);
		player:startEvent(event);
	end
end

end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;