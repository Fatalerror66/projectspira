-----------------------------------
--	Author: Tenjou
-- 	DOOR: Departures Exit (to Kazham)
-- 	Blocks players from entering the dock without an airship pass and 200 gil.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
csid = 0x2d;
pass = player:hasKeyItem(0x09);
currGil = player:getCurrGil();
if (pass == 1 and currGil >= 200)then
	csid = 0x25;
end
player:startEvent(Event(csid));
 end

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x25 and option ~= nil) then
	player:removeGil(200);
end
 end 