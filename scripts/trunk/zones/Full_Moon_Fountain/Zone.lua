-- Windurst mission CS 
-- by ReaperX

---------------------------------------------------------------
---   ZoneIn-code here ...   ----------------------------------
---------------------------------------------------------------

function onZoneIn(player,prevZone)
if player:getMissionStatus(2,16) == 1 and player:getVar("mission_status") == 3 then
	cs = 0x32; -- windurst mission 6-1
elseif player:getMissionStatus(2,22) == 1 and player:getVar("mission_status") == 10 then
	cs = 0x3D; -- windurst mission 9-1
else
	cs = -1;
end;
return cs;
end;



---------------------------------------------------------------------
-- onEventFinish Action
---------------------------------------------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x32) then
	add_rank_points_for_mission(player)
	player:completeMission(2,16);
	player:setVar("mission_status",0);	
elseif (csid == 0x3D) then
	add_rank_points_for_mission(player)
	player:completeMission(2,22);
	player:setVar("mission_status",0);	
end;
end;