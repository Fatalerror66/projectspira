-----------------------------------
--	Author: Tenjou
-- 	??? (Genbu's Spawn)
-- 	Allows players to spawn the HNM Genbu with a Gem of the North and a Winterstone.
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
player:specialMessage(SKY_SPEECH_OFFSET);
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
item1 = trade:hasItemQty(0x590,1); --Gem of the North
item2 = trade:hasItemQty(0x591,1); --Winterstone
if (count == 2 and item1 and item2) then
	--Spawn Genbu
	trade:isComplete();
	sky = Zone(0x82);
	sky:spawnMob("Genbu",256,-70,512,0xb0,player:getId());
	player:showText(npc,SKY_SPEECH_OFFSET+5);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;