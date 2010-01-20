-----------------------------------
--	Author: Almendro
-- 	Zelman
-- 	"Groceries"
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- Initialization
TamisNote = 0x98;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
Groceries_tempVar = player:getVar("Groceries_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(Groceries_tempVar == 1)then
	seen_TamisNote = player:seenKeyItem(TamisNote);
	if(seen_TamisNote == 1)then
		player:startEvent(Event(0xA2));
		player:setVar("Groceries_tempVar",3);
	else
		player:startEvent(Event(0xA1));
		player:setVar("Groceries_tempVar",2);
	end
	player:removeKeyItem(TamisNote);
else
	player:startEvent(Event(0xA0));
end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;