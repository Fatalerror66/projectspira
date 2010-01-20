-----------------------------------
--	Author: Almendro & Rautek
--  ??? (qm1)
--  Involved in "The Light of the Day"
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	player:specialMessage(918);
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
TheLightoftheDay = player:getQuestStatus(1,11);
           count = trade:getItemCount();
           item1 = trade:hasItemQty(0x11A2,1); -- Quus
             gil = trade:getGil();
-----------------------------------
-- Trades go below.
-----------------------------------
if (TheLightoftheDay == 1 and count == 1 and item1 and gil == 0 and player:hasItem(0x226) == 0) then
	trade:isComplete();
	player:specialMessage(921,0x11A2); -- You put a quus down.
	zone = Zone(player:getZone());
	zone:spawnMob("BubblyBernie",749.313,-3.627,-695.315,192,player:getId()); -- Retail position
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;

