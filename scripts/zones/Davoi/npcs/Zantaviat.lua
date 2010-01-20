-----------------------------------
-- Zantaviat
-- Davoi scout in Sandy mission 2-2 "The Davoi Report"
-- by ReaperX

-- speculative behavior: he introduces himself and explains his job for citizens of Sandy
-- who are not on the mission. He gives the cold shoulder to bastok and windurstian citizens.

package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");
require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-- 66: CS for Infiltrate Davoi
-- 69: CS for Infiltrate Davoi
-- 64: initial CS for The Davoi Report 
-- 72: initial CS for The Davoi Report(probably for repeat of the mission since this one is not documented on ffxi wiki.)
-- 73: found the page (with instructions to deliver it to Prince Pieuje, first completion)
-- 68: found the page (with instructions to deliver it to the gate guard, for repeat)

mission_status = player:getVar("mission_status"); 
repeat_mission  = player:getVar("repeat_mission"); 

if (player:getMissionStatus(0,4) == 1) and (mission_status == 1) then
  event = Event(0x72);
  event:setParams(TempleKnightsDavoiReport);
  player:startEvent(event);
elseif (repeat_mission == 10) and (mission_status == 1) then
	player:startEvent(Event(0x66));
elseif (player:hasKeyItem(EastBlockCode) == 1) and (player:hasKeyItem(NorthBlockCode) == 1) and (player:hasKeyItem(SouthBlockCode) == 1) then
	player:startEvent(Event(0x69));
elseif (player:getVar("repeat_mission") == 10) and (mission_status == 2) then
	player:showText(npc,SANDY_MISSION_OFFSET + 15);
elseif (player:getVar("repeat_mission") == 10) and (mission_status == 3) then
	player:showText(npc,SANDY_MISSION_OFFSET + 19);
	if (DEBUG_MODE) then
		player:setPos(88, 1, -53, 32, 0xE6); -- to Ambrotien
  end;
elseif (player:getMissionStatus(0,4) == 1) and (mission_status == 2) then
  player:showText(npc,SANDY_MISSION_OFFSET+80);
elseif (repeat_mission == 4) and (mission_status == 2) then
	player:showText(npc,SANDY_MISSION_OFFSET);
elseif (player:getMissionStatus(0,4) == 1) and (player:hasKeyItem(LostDocument) == 1) then
	event = Event(0x73);
	event:setParams(TempleKnightsDavoiReport);
	player:startEvent(event);
elseif (player:getVar("repeat_mission") == 4) and (player:hasKeyItem(LostDocument) == 1) then
	player:startEvent(Event(0x68));
elseif (player:hasKeyItem(TempleKnightsDavoiReport) == 1) then
  if (repeat_mission == 4) then 
  	player:showText(npc,SANDY_MISSION_OFFSET + 6); -- Give it to the lord knight at the gatehouse
  else
  	player:showText(npc,SANDY_MISSION_OFFSET + 83); -- Deliver it to Prince Pieuje	
  end;
  if (DEBUG_MODE) then
  	player:setPos(88, 1, -53, 32, 0xE6); -- to Ambrotien
  end;
elseif (player:getVar("repeat_mission") == 4) and (mission_status == 1) then
	event = Event(0x64);
	event:setParams(TempleKnightsDavoiReport);
	player:startEvent(event);
elseif (player:getNation() == 0) then
	player:startEvent(Event(0x65));
else
	player:showText(npc,SANDY_MISSION_OFFSET + 7);
end;
end

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x72) or (csid == 0x64) then
  player:setVar("mission_status",2);  
elseif (csid == 0x68) or (csid == 0x73) then
	player:removeKeyItem(LostDocument);
	player:addKeyItem(TempleKnightsDavoiReport);
	player:specialMessage(KEYITEM_OBTAINED,TempleKnightsDavoiReport);
elseif (csid == 0x66) then
	player:setVar("mission_status",2);
elseif (csid == 0x69) then
	player:setVar("mission_status",3);
	player:removeKeyItem(EastBlockCode);
	player:removeKeyItem(SouthBlockCode);
	player:removeKeyItem(NorthBlockCode);
	
end
end;