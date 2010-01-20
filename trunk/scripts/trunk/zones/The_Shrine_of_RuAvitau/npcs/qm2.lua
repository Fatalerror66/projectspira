-----------------------------------
--	Author: Tenjou
-- 	??? (Kirin's Spawn)
-- 	Allows players to spawn the HNM Kirin with the seals of the Shijin.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(895);
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
-----------------------------------
-- Trades go below.
-----------------------------------
item1 = trade:hasItemQty(0x57c,1); --Seal of Genbu
item2 = trade:hasItemQty(0x57d,1); --Seal of Seiryu
item3 = trade:hasItemQty(0x57e,1); --Seal of Byakko
item4 = trade:hasItemQty(0x57f,1); --Seal of Suzaku
seals = (item1 and item2 and item3 and item4);
if (count == 4 and seals) then
	--Spawn Kirin
	trade:isComplete();
	sky = Zone(0xb2);
	sky:spawnMob("Kirin",-92,32,0,0,player:getId());
	player:showText(npc,904);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;