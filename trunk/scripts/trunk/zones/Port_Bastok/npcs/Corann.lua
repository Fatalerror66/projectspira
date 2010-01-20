-----------------------------------
--	Author: Arcanedemon
-- 	Corann
-- 	Basic Chat Text
-----------------------------------
QuadavBackplate = 0x254; -- 596
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
TheQuadavsCurse = player:getQuestStatus(1,4);
 OutofOnesShell = player:getQuestStatus(1,5);
if(TheQuadavsCurse~=2 and player:getFameLevel(1)>=1) then
	if(TheQuadavsCurse == 0) then
		player:startEvent(Event(0x50));
	else
		player:startEvent(Event(0x26));
	end
else
	if(OutofOnesShell == 2) then
		player:startEvent(Event(0x58));
	else
		player:startEvent(Event(0x57));
	end	
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
item1 = trade:hasItemQty(QuadavBackplate,1);
gil = trade:getGil();
if(player:getQuestStatus(1,4) == 1 and count == 1 and item1==true and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x51));
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x50)then
	player:addQuest(1,4);
elseif(csid == 0x51) then
	player:completeQuest(1,4);
	player:addItem(0x3220); -- Bronze Subligar
	player:addFame(1,BAS_FAME*20);
	player:specialMessage(ITEM_OBTAINED,0x3220);
end
end;