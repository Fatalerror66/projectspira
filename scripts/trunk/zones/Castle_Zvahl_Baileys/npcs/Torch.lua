-----------------------------------
--	Author: ReaperX
-- 	Torch
-- 	For Borghertz Hands Quests, spawns Dark Spark
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");

ShadowFlames = 0xD3;
torches = 0983; -- "The torches burn eerily."

function onTrigger(player,npc)
if (player:hasKeyItem(ShadowFlames)==1) and (DEBUG_MODE) then
	player:setPos(-53, 8, -2, 64, 0xF6); -- to Port Jeuno
end;

mobsup = getGlobalVar("DARKSPARK_FIGHT");
if (player:getVar("ORDER_CONSIGNED") == 1) and (player:hasKeyItem(ShadowFlames) == 0) then
	ToD = getGlobalVar("DARKSPARK_TOD");
	if (os.time()-ToD <= 180) then
		player:addKeyItem(ShadowFlames);
		player:specialMessage(KEYITEM_OBTAINED, ShadowFlames);
	elseif (mobsup == 0) then
		loc = Zone(0xA1);
		loc:spawnMob("DarkSpark",56, -24, 19,0,player:getId());
		player:specialMessage(torches+1);
		setGlobalVar("DARKSPARK_FIGHT",1);
	else
		player:specialMessage(torches); -- not sure if the torch NPCs are clickable while Darkspark is up
	end;
else
	player:specialMessage(torches);
end; 
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID",csid);
--print("RESULT",option);
end;