-----------------------------------
-- Door: Papal Chambers
-- involved in Sandy Missions, quests
-- by ReaperX
-----------------------------------

-- Events:

--0032 Shamonde tells Pieuje that it was Eald'Narche who told him that Lightbringer opens the Gates to Paradise
--0007 opening CS for 7-1 "Prestige of the Papsque"
--0009 repeats instructions for 7-1
--0008 final CS for 7-1 "Prestige of the Papsque"
--02B7 The Davoi Report

require("scripts/globals/rankpoints");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
--print(npcid, npcname);

mission_status = player:getVar("mission_status");

if (player:getMissionStatus(0,4) == 1) and (player:hasKeyItem(TempleKnightsDavoiReport) == 1) then
  player:startEvent(Event(0x2B7))
elseif (player:getMissionStatus(0,18) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x7))
elseif (player:getMissionStatus(0,18) == 1) and (mission_status == 2) then
  player:startEvent(Event(0x9))
elseif (player:hasKeyItem(AncientSandOrianTablet) == 1) then
	player:startEvent(Event(0x8))
elseif (player:getVar("must_watch_shamonde_cs") == 1) then
	player:startEvent(Event(0x32)) 	
else
	player:specialMessage(4325); -- "It's locked."
end
end

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid, option = ",csid,option);
if (csid == 0x2B7) then													-- Davoi Report finish
	add_rank_points_for_mission(player);
	player:removeKeyItem(TempleKnightsDavoiReport);
 	player:completeMission(0,4);				
 	player:setVar("mission_status",0);
elseif (csid == 0x7) then
	player:setVar("mission_status",2);
elseif (csid == 0x9) and (DEBUG_MODE) then
	player:setPos(-710.2, -39.3, 20, 1, 0x64);	-- to West Ronfaure
elseif (csid == 0x8) then
	add_rank_points_for_mission(player);
	player:removeKeyItem(AncientSandOrianTablet);
 	player:completeMission(0,18);
 	player:setVar("mission_status",0); 
	if (DEBUG_MODE) then
 		player:setPos(88, 1, -53, 32, 0xE6);	-- to Ambrotien
 	end;
elseif (csid == 0x32) then
	player:setVar("must_watch_shamonde_cs",0);
end
end; 
