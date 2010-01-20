-----------------------------------
--	Author: ReaperX
-- 	Fossil Rock 
--	Involved in Windurst Mission 2-1
--  messages need to be checked on retail.
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/teleports");
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
require("scripts/zones/Maze_of_Shakhrami/TextIDs");

FOSSIL_ROCK_BASE = 17588670; -- the first fossil rock. There are 14 of them.
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	lapiscoral = player:getVar("lapiscoral");
	npcid = npc:getId();
	n = npcid-FOSSIL_ROCK_BASE;
	--print("rocknumber",n);
	if (n == 8) then -- spawn Ichorous Ire
		if (os.time()-getGlobalVar("IchorousIreTOD") >= 600) then -- 10 minute respawn
			player:specialMessage(221) -- You are suddenly overcome with a sense of foreboding...
			maze = Zone(0xC6);
			maze:spawnMob("IchorousIre",-93,15,-105,210,player:getId()); -- exact pop position unverified
		else
			player:specialMessage(FOSSIL + 2); -- A large fossil has been excavated from here. The hole where it once sat is covered in something sticky.
		end;
	elseif (player:hasKeyItem(LapisCoral) == 1) and (lapiscoral == n) then
		player:specialMessage(FOSSIL + 5); -- There is no need to investigate it any further.
		if DEBUG_MODE then
			toCatBurglar(player);
		end;
	elseif (player:hasKeyItem(LapisMonocle) == 1) then
		if (lapiscoral == n) then
			player:specialMessage(FOSSIL + 7); -- Part of the rock glistens faintly.
			player:specialMessage(KEYITEM_OBTAINED,LapisCoral);
			player:addKeyItem(LapisCoral);
			player:removeKeyItem(LapisMonocle);
		else
			player:specialMessage(FOSSIL + 1); -- It looks like a rock with fossils embedded in it. Nothing out of the ordinary.
		end;
	else
		player:specialMessage(FOSSIL + 8); -- It is just a rock. There is no need to investigate it.
	end;
end;	
	
	
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
-----------------------------------
-- Trades go below.
-----------------------------------
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;