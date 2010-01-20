-----------------------------------
--	Author: ReaperX
-- 	Moon Spiral
-- 	Lets you enter and exit special battles.

-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/bcnm");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
require("scripts/zones/Full_Moon_Fountain/TextIDs");


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- events:
-- 7D00 : BC menu 
-- Param 4 is a bitmask for the choice of battlefields in the menu:

---- 0: The Moonlit Path
---- 1: Moon Reading (Windurst Mission 9-2)
---- 2: Waking the Beast
---- 3: Battaru Royale

-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

-- 7D01 : final BC event.
-- param 2: #time record for this mission
-- param 3: #clear time in seconds
-- param 4: #which mission (linear numbering as above)
-- 7D03 : stay/run away


-----------------------------------
X = player:getXPos();
Z = player:getZPos();
if (X>-310) and (X<-260) and (Z<-250) and (Z>-330) then -- we're on the outside circle, so need enter menu
  event = Event(0x7D00);
  bc_id = 0;
  if (player:getMissionStatus(2,23) == 1) and (player:getVar("mission_status") == 3) then
      bc_id = 2;                                                                         -- for Windy Mission 9-2 "Moon Reading"
  end;
  event:setParams(0,0,0,bc_id,0,0,0,0)  -- 
  if (bc_id > 0) then
	player:startEvent(event); 
  else
    player:specialMessage(1094); --A cursed seal has been placed upon this platform.
  end
else
  player:startEvent(Event(0x7D03));      -- inside circle: stay/run away menu.
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

mission_status = player:getVar("mission_status");

if (csid == 0x7D00) then
	if player:getMissionStatus(2,23) == 1 and mission_status == 3 then
		record = getGlobalVar("FMF_WINDURST_9_2_RECORD");	
		player:updateEvent(2,1,0,record,6,1);
	end;
end;
end
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
mission_status = player:getVar("mission_status");
if (csid == 0x7D00) and (option ~=0) then
	if (csid == 0x7D00) and player:getMissionStatus(2,23) == 1 and mission_status == 3 then
		loc = Zone(0xAA);
		loc:spawnMob("AceofSwords",338,47,-339,62 ,nil);
		loc:spawnMob("AceofCoins", 341,47,-339,66 ,nil);
		loc:spawnMob("AceofBatons",335,48,-341,63 ,nil);
		loc:spawnMob("AceofCups",  344,48,-341,66 ,nil);
		setGlobalVar("FULL_MOON_FOUNTAIN",4) -- how many monsters need to be killed.
		setGlobalVar("FMF_ENTER_TIME",os.time());
	end;
end;
end;