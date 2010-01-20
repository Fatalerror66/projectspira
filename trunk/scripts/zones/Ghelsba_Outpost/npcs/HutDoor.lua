-----------------------------------
--	Author: ReaperX
--  Hut Door 
--  for Sandy Mission 1.3, NPC quest, BCNMs
--  clicking on this with mission 1.3 active will now just give you the CS and keyitem.
---------------------------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");

--[[ events: 

7D00 Which battlefield will you enter?
  
  Param 4 is a bitmask for the choice of battlefields in the menu:

    0: Save the Children
    1: The Holy Crest
    2: Wings of Fury
    3: Petrifying Pair
    4: Toadal Recall
    5: Mirror, Mirror
 	
 	Param 8 is a flag: 0 : menu, >0 : automatically enter
 
 7D01 BCNM exit event

--]]
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
--print(npc,npcname);
mission_status = player:getVar("mission_status");
if (player:hasKeyItem(OrcishHutKey) == 1) then
	if (player:getVar("repeat_mission") == 2) then
		event = Event(0x3); -- for repeat mission
	else
	  event = Event(0x37); -- for first completion
	end
	player:startEvent(event);
elseif ((player:getMissionStatus(0,2) == 1)  and (player:getVar("mission_status") == 2)) or
	   ((player:getVar("repeat_mission") == 2) and (player:getVar("mission_status") == 1)) then
	event = Event(0x7D00);
	event:setParams(0,0,0,1)
	player:startEvent(event);
else
	player:specialMessage(1447); -- This looks like an Orcish dwelling. The door is firmly shut.
end

if ((player:getMissionStatus(0,2) == 1) or (player:getVar("repeat_mission") == 2)) and (player:getVar("mission_status") == 4) and (DEBUG_MODE) then
	player:setPos(88, 1, -53, 32, 0xE6);     																	-- to Ambrotien
end
end;

function onEventSelection(player,csid,option)

	-- parameter 1: 0 or 1 = can't enter battlefield at present, 2 = can go in
	-- parameter 2: identifies the BC we are entering (to identify time record and play CS, if applicable. Not all BCs have CS.)
	-- parameter 4: current clear time record
	-- parameter 5: number of adventurers in clear time record
	-- parameter 6: 1 = offer menu to skip the event
	-- unknown: how to pass player name who holds time record to the event

	--print("onEventSelection")
	--print("onEventSelection - CSID:",csid);         
	--print("onEventSelection - option ===",option); 

	missionStatus = player:getVar("missionStatus");
	if (option == 0) then
		--print("Setting second set of update params.");
		player:updateEvent(2,0,-2,10,6,1); -- for Sandy mission 1-3
	elseif (option == 255) then
		--print("Setting first set of update params.");
		-- these don't seem to do anything.
	end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x7D01) then
	player:addKeyItem(OrcishHutKey);
	player:specialMessage(541,OrcishHutKey);
	player:setVar("mission_status",3);
elseif (csid == 0x37) or (csid == 0x3) then
	player:removeKeyItem(OrcishHutKey);
	player:setVar("mission_status",4);
	if (player:getVar("repeat_mission") == 0) then
		player:setVar("Sandy_1_3_optional_CS",1);
	end
elseif (csid == 0x7D00) then  
	loc = Zone(0x8c);
	-- approximate pop positions from http://www.youtube.com/watch?v=wKezHQYrf2Q
	loc:spawnMob("FodderchiefVok",-190, -10.6, 45,103,nil);
	loc:spawnMob("SureshotSnatga",-174, -10.6, 53.2, 110, nil); -- this one makes server crash.
	loc:spawnMob("StrongarmZodva",-183, -10.6, 59,92,nil); 
	setGlobalVar("GHELSBA_HUT",3) -- how many monsters need to be killed.
	setGlobalVar("GHELSBA_ENTER_TIME",os.time());
end
end

