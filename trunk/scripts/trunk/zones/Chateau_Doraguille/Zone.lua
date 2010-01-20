-- by ReaperX

require("scripts/globals/rankpoints");

package.loaded["scripts/zones/Chateau_Doraguille/TextIDs"] = nil;
require("scripts/zones/Chateau_Doraguille/TextIDs");


function onInitialize()
registerRegion(0xe9, 1, -96, -91, 0, 1 , 76, 79 ); -- for CS in 6-1 and with princess between sandy missions 7-1 and 7-2
--print("Chateau Garden registered.")
end

function onRegionEnter(player, regionID)
if (regionID == 1) and (player:getRank() == 7) and (player:getMissionStatus(0,18) == 2) and (player:getMissionStatus(0,19) == 0) and (player:getVar("mission_status") == 1) then
	player:setVar("mission_status",2);
	player:startEvent(Event(Chateau_TheSecretWeapon))
elseif (regionID == 1) and (player:hasKeyItem(Dreamrose) == 1) then
	add_rank_points_for_mission(player);
 	player:completeMission(0,16);
 	player:removeKeyItem(Dreamrose);
 	player:setVar("mission_status",0); 
 	player:addKeyItem(PieceOfPaper);
	player:startEvent(Event(Chateau_LeautesLastWishes_Pt2))
end;
end

function onZoneIn(player,prevZone)
--print("onZoneIn function called-------------");
if (player:getMissionStatus(0,11) == 1) and (player:getVar("mission_status") == 2) then
  player:setVar("mission_status",3);
  cs = 0x22B;
elseif (player:getMissionStatus(0,20) == 1) and (player:getVar("mission_status") == 1) then
  player:setVar("mission_status",2);
  player:setVar("may_watch_coming_of_age_trion",1);
  player:setVar("may_watch_coming_of_age_pieuje",1);
  cs = Chateau_ComingOfAge_Pt1;
elseif (player:hasKeyItem(MessageToJeunoSandy) == 1) then
  player:removeKeyItem(MessageToJeunoSandy); -- in-between "mission" is now over, and mission 14 can be flagged.
  cs = Chateau_TheRuinsOfFeiYin_Pt1;         -- CS after returning from Magicite mission. 
  --print("cutscene:The Ruins of Fei'Yin, Part 1");
elseif (player:getMissionStatus(0,23) == 1) and (player:getVar("mission_status") == 2) then
	player:setVar("mission_status",3);
  cs = Chateau_TheHeirToTheLight_Pt1;
else
	cs = -1;
end;
--print("cs: ",cs);
return cs;
end;

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == Chateau_LeautesLastWishes_Pt2) then
 	player:specialMessage(KEYITEM_OBTAINED,PieceOfPaper);
	-- last time I tested, this statement didn't get executed because of a "Lua error: cannot open : Invalid argument". I don't know how to fix that.
end;
end;

