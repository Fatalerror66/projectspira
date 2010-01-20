-----------------------------------
--	Author: Tenjou
-- 	??? (Seiryu's Spawn)
-- 	Allows players to spawn the HNM Seiryu with a Gem of the East and a Springstone.
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
player:specialMessage(SKY_SPEECH_OFFSET+1);
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
item1 = trade:hasItemQty(0x58a,1); --Gem of the East
item2 = trade:hasItemQty(0x58b,1); --Springstone
if (count == 2 and item1 and item2) then
	--Spawn Seiryu
	trade:isComplete();
	sky = Zone(0x82);
	sky:spawnMob("Seiryu",561,-70,-82,0x10,player:getId());
	player:showText(npc,SKY_SPEECH_OFFSET+9);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;