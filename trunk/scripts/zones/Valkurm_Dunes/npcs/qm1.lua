-----------------------------------
--	Author: ReaperX
-- 	??? for ship / sunsand mini-quest

-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
require("scripts/zones/Valkurm_Dunes/TextIDs");
-----------------------------------
-- Initialization
Sunsand =0x1F7;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
zone = Zone(player:getZone());
weather = zone:getWeather();
-- weather == 0x08 and 
if (player:getVar("OBTAINED_VALKURM_SUNSAND") == 0 ) then -- when Dust/sand storm is active
	player:addItem(Sunsand);
    player:specialMessage(ITEM_OBTAINED,Sunsand);
    player:setVar("OBTAINED_VALKURM_SUNSAND",1);
else
	player:specialMessage(890);
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