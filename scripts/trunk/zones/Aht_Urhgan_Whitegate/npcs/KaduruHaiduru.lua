-----------------------------------
--	Authors: Almendro
-- 	Kaduru-Haiduru
-- 	Pay-Teleport taru
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
--[[taru = Event(0x80097);
taru:setParams(0x0,0x0,0x3,0xFF,0xFF,0xFF,0xFF,0xFF);
player:startEvent(taru);--]]
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	if(os.time() < player:getVar("reekofamateursorcery")) then
        -- You have used the other teleport taru within a vanadiel day so no teleport for you 
	else
        -- do the trade
	end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
