-----------------------------------
--	Author: Tenjou
-- 	CULINARIANS' GUILD VENDOR: Chomo Jinjahl
-- 	Cooking Guild merchant.
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
if (hour >= 5 and getVanaHour() < 20 and day ~= 7) then
	player:showText(npc,1163);
end
player:sendGuild(0xee01,7,5,20);
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