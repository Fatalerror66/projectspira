-- nation mission 5-2 by ReaperX

require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
if ( (player:getMissionStatus(0,15) == 1) or (player:getMissionStatus(1,15) == 1) or (player:getMissionStatus(2,15) == 1)) and (player:getVar("mission_status") == 2) then
  sendTellMsg("[pXI]Altana",player:getName(),"The Shadowlord BCNM is not scripted. You have obtained the key item Shadow Fragment.");
  player:addKeyItem(ShadowFragment);
  player:setVar("mission_status",3);
end;
return cs;
end;

 