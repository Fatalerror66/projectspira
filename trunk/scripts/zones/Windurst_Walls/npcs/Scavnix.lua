-----------------------------------
--	Author: Tenjou
-- 	Scavnix
-- 	Standard merchant, though he acts like a guild merchant.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
hour = getVanaHour();
day = getVanaDayElement();
if (hour >= 11 and getVanaHour() < 22 and day ~= 6) then
	player:showText(npc,2022);
end
player:sendGuild(0xef01,6,11,22);
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
end;