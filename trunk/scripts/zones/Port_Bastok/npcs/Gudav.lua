-----------------------------------
--	Author: SharXeniX & Almendro
-- 	Gudav
-- 	Quest: "A Foreman's Best Friend"
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
aForemansBestFriend = player:getQuestStatus(1,9);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(aForemansBestFriend == 0)then
	player:startEvent(Event(0x6E));
	player:addQuest(1,9);
else
	player:startEvent(Event(0x1F));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
item1 = trade:hasItemQty(0x3328,1);
  gil = trade:getGil();
aForemansBestFriend = player:getQuestStatus(1,9);
if (item1 and aForemansBestFriend == 1 and count == 1 and gil == 0) then
	player:startEvent(Event(0x70));
	player:addFame(1,BAS_FAME*60);
	trade:isComplete();
end
end;
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if(csid == 0x70)then
		player:completeQuest(1,9);
		player:addKeyItem(0x18E);
		player:specialMessage(4804,0x18E);
	end
end;