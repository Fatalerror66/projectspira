-----------------------------------
--	Author: ReaperX
-- 	??? In Sauromugue Champaign
-- 	For THF AF2 quest
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if player:getQuestStatus(2,70) == 1 and player:getVar("THF_AF2_TOWER") == 3 then
	loc = Zone(0x78);
	loc:spawnMob("ClimbpixHighri",415, 16, -137, 216,player:getId());
	player:specialMessage(COMEDOWN);
elseif player:getQuestStatus(2,70) == 2 or player:getVar("THF_AF2_TOWER") == 7 then
	player:specialMessage(COMEDOWN+20); -- "There is no longer any need to climb the tower." (verified on retail)
elseif player:getQuestStatus(2,70) == 1 then
	player:specialMessage(COMEDOWN+19); -- "It is impossible to climb this wall with your bare hands."
else
	player:specialMessage(COMEDOWN+18); -- "There is nothing out of the ordinary here."
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
--print("CSID:",csid);
--print("RESULT:",option);
end;