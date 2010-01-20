-----------------------------------
--	Author: Tenjou
-- 	??? (Suzaku's Spawn)
-- 	Allows players to spawn the HNM Suzaku with a Gem of the South and a Summerstone.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/RuAun_Gardens/Zone");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:specialMessage(SKY_SPEECH_OFFSET+3);
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
item1 = trade:hasItemQty(0x58c,1); --Gem of the South
item2 = trade:hasItemQty(0x58d,1); --Summerstone
if (count == 2 and item1 and item2) then
	--Spawn Suzaku
	trade:isComplete();
	sky = Zone(0x82);
	sky:spawnMob("Suzaku",-506,-70,-269,0x80,player:getId());
	player:showText(npc,SKY_SPEECH_OFFSET+7);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;