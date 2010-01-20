-----------------------------------
--	Author: Tenjou
-- 	Kuzah Hpirohpon
-- 	Vendors are not implemented yet.  This is a guild vendor,and should be closed sometimes.
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
if (hour >= 6 and getVanaHour() < 21 and day ~= 0) then
	player:showText(npc,1263);
end
player:sendGuild(0xf101,0,6,21);
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