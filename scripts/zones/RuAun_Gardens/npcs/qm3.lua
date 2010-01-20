-----------------------------------
--	Author: Tenjou
-- 	??? (Byakko's Spawn)
-- 	Allows players to spawn the HNM Byakko with a Gem of the West and an Autumnstone.
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
player:specialMessage(SKY_SPEECH_OFFSET+2);
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
item1 = trade:hasItemQty(0x58e,1); --Gem of the West
item2 = trade:hasItemQty(0x58f,1); --Autumnstone
if (count == 2 and item1 and item2) then
	--Spawn Byakko
	trade:isComplete();
	sky = Zone(0x82);
	sky:spawnMob("Byakko",-405,-70,394,0x90,player:getId());
	player:showText(npc,SKY_SPEECH_OFFSET+11);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;