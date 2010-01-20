-----------------------------------
--	Author: Tenjou
--	FISHERMAN'S GUILD SHOPKEEPER: Babubu
--	Vendors are not implemented yet; I have included her only text line.
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
if (hour >= 3 and getVanaHour() < 23 and day ~= 5) then
	player:showText(npc,401);
end
player:sendGuild(0xf001,5,3,23);
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