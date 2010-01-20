-----------------------------------
--	Author: Tenjou
-- 	DOOR: Cermet Gate
-- 	Gives qualified players access to Ru'Aun Gardens.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
crystal = player:hasKeyItem(0x1c4);
if (crystal == 0) then
	player:startEvent(Event(1));
else
	player:startEvent(Event(2)); --Event 4 for the Zilart CS.
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
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 2 and option == 0 or csid == 4 and option == 0) then
	--player:sendRelease(1);
end
end;