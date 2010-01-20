require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice)
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)

--- flag Zilart missions when above rank 6 in nation and entering a Zilart expansion area
if (player:getRank() >= 6) and (player:getMissionStatus(3,0) == 0) then
  player:currentMission(3,0)
end;
cs = -1;
if (player:hasKeyItem(StarSeeker) == 1) and (player:getVar("mission_status") == 2) then
	cs = 0x3; -- talking doll
end;
if (player:getMissionStatus(1,18) == 1) and (player:getVar("mission_status") == 2) then
  sendTellMsg("[pXI]Altana",player:getName(),"??? and NM fight for 7-1 have not been implemented. You now have the key item Reinforced Cermet.");
  player:addKeyItem(ReinforcedCermet);
  player:setVar("mission_status",3);
end;
return cs;
end;
 

---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(currZone)
end;

