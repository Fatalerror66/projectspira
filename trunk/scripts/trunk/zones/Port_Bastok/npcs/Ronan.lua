-----------------------------------
--	Author: Almendro
-- 	Ronan
-- 	Out of One's Shell
-----------------------------------
ShellBug = 0x43F5;
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
if(TheQuadavsCurse == 0) then
	player:startEvent(Event(0x25));
elseif(TheQuadavsCurse == 1) then
	player:startEvent(Event(0x59));
elseif(TheQuadavsCurse == 2)then
	if(player:getVar("OutofOnesShell") == 1 or player:getVar("OutofOnesShell") == 0) then
		player:startEvent(Event(0x52));
	elseif(player:getVar("OutofOnesShell") == 2)then
		player:startEvent(Event(0x55));
	else
		player:startEvent(Event(0x56));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
item1 = trade:hasItemQty(ShellBug,3);
gil = trade:getGil();
if(count == 3 and item1==true and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x54));
	player:setVar("OutofOnesShell",2);
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
 OutofOnesShell = player:getQuestStatus(1,5);
if(csid == 0x52 and OutofOnesShell == 0)then
	player:addQuest(1,5);
	player:setVar("OutofOnesShell",1);
elseif(csid == 0x56) then
	player:completeQuest(1,5);
	player:addItem(0x30D5); -- Monk's Headgear
	player:addFame(1,BAS_FAME*40);
	player:setTitle(82);
	player:specialMessage(ITEM_OBTAINED,0x30D5);
	player:setVar("OutofOnesShell",0);
end
end;