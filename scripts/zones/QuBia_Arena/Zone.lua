-- nation mission 5-1 by ReaperX

require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");

---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
---------------------------------
-- "The First Meeting" Quest. Zone check
if(player:getQuestStatus(1,52) == 1 and player:getVar("temp_TheFirstMeeting") == 0)then
	player:setVar("temp_TheFirstMeeting",1);
end
---------------------------------

cs = -1;
return cs;
end;

 