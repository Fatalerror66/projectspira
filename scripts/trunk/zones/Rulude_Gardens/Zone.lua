-- CoP mission 3.2 CS added by ReaperX

require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone )
	cs = -1;

	return cs;
end;

function onInitialize(zone)
registerRegion(0xf3, 1, -4, 3, 1, 3 , 35, 46 );  -- for CoP 3-2: "A Vessel Without a Captain" CS 
end;

-- events triggered by approaching the stairs: --------------------
-- 0041 : final CS for CoP 3.2 "A Vessel Without a Captain"
-- 2740 : CS for CoP Mission 6.2 "A Place to Return "
-- 2742 : CS for CoP Mission 6.3 "More Questions than Answers"
-- 2743 : CS for CoP Mission 7.2 " Flames in the Darkness "
-- 007a : CS for CoP Mission 8.4 "Dawn"
-- 008e : opening CS for "Storms of Fate"
-- 008f : final CS for "Storms of Fate"
-- 00A1 : opening CS for "Shadows of the Departed"
-- 00A2 : final CS for "Shadows of the Departed"
-- 007b : opening CS for "Apocalypse Nigh"

function onRegionEnter(player, regionID)

cop_status = player:getMissionStatus(6,12);                               -- on CoP Mission 3.2 "A Vessel Without a Captain"?
vessel_without_a_captain_status = player:getVar("VesselWithoutACaptain"); -- 1 indicates player has seen Tenshodo CS

--print("Cop/VesselWithoutACaptain status = ",cop_status,vessel_without_a_captain_status);

if (regionID == 1) and (cop_status == 1) and (vessel_without_a_captain_status ==1) then
  player:startEvent(Event(0x41));
end;
end;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
--print("CSID ========================",csid);
if (csid == 0x41) then
  player:completeMission(6,12);  
  player:currentMission(6,13);
  player:setVar("VesselWithoutACaptain",0); -- cleanup
  --print("updating mission status");
end;
end;
