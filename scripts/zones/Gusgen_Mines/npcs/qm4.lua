-----------------------------------
--	Author: Almendro
--  ???
-- 	Normal Text right now. (spawns Wandering Ghost for mnk AF)
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
require("scripts/zones/Gusgen_Mines/TextIDs");
-----------------------------------
-- Initialization
pickaxe = 0x25D;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--player:specialMessage(941) message unknown
end; 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 pickaxe1 = trade:hasItemQty(pickaxe,1);
		  count = trade:getItemCount();
			gil = trade:getGil();
GhostsofthePast = player:getQuestStatus(1,51);

if(pickaxe1 and GhostsofthePast == 1)then
	trade:isComplete();
	zone = Zone(player:getZone());
	zone:spawnMob("WanderingGhost",npc:getXPos(),npc:getYPos(),npc:getZPos(),npc:getRot(),player:getId());
	-- should drop 100% Miner's Pendant
end
end;