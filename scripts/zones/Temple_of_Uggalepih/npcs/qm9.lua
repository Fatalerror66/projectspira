-----------------------------------
--	Author: Almendro
-- 	??? (qm9.lua)
-- 	??? Involved in the quest "Axe The Competition" http://wiki.ffxiclopedia.org/wiki/Axe_the_Competition
-- 08/19/2009 - Almendro
--  * Added spawnMob function to the quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
AnnalsofTruth = 0x159;

require("scripts/globals/settings");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if( player:getVar("AxetheCompetition") == 2 ) then
	if(os.time() <= getGlobalVar("YalleryBrownkilled") ) then
		player:addKeyItem(AnnalsofTruth);
		player:specialMessage(KEYITEM_OBTAINED,AnnalsofTruth);
		player:setVar("AxetheCompetition",4);
	else
		zone = Zone(player:getZone());
		zone:spawnMob("YalleryBrown",npc:getXPos(),npc:getYPos(),npc:getZPos(),npc:getRot(),player:getId());
	end
else
	player:specialMessage(34);
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