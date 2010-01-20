-----------------------------------
--	Author: ReaperX
-- 	Waughroon Shrine Burning Circle
-- 	Lets you enter and exit BCNMs.
--  to do: mark orbs as used (cracked) after they've been traded (server variables?)
--  BCs are empty for now.

--  To do: mark orbs as used (cracked) after they've been traded (server variables?)

-- Problem: no matter what choice you make in the menu event 7D00, the option variable
-- comes back with the same value in onEventSelection and onEventFinish.

-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/bcnm");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
require("scripts/zones/Waughroon_Shrine/TextIDs");


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

---- 0: Rank 2 Final Mission for Windy "The Three Kingdoms" and Sandy "Journey Abroad"
---- 1: The Worm's Turn (BCNM 40, Star Orb)
---- 2: Grimshell Shocktroopers (BCNM 60, Moon Orb)
---- 3: On My Way (Bastok Mission 7.2)
---- 4: A Thief in Norg!? (SAM AF3)
---- 5: 3, 2, 1... (BCNM 50, Comet Orb)
---- 6: Shattering Stars (RDM)
---- 7: Shattering Stars (THF)
---- 8: Shattering Stars (BST)
---- 9: Birds of a Feather (BCNM 30, Sky Orb)
---- 10: Crustacean Conundrum (BCNM 20, Cloudy Orb)
---- 11: Grove Guardians (BCNM 30, Sky Orb)
---- 12: The Hills are Alive (KSNM 99, Themis Orb)
---- 13: Royal Jelly (BCNM 30, Sky Orb)
---- 14: The Final Bout (BCNM 50, Comet Orb)
---- 15: Up in Arms (BCNM 60, Moon Orb)
---- 16: Copycat (KSNM 30, Clotho Orb)
---- 17: Operation Desert Swarm (KSNM 30, Lachesis Orb)
---- 18: Prehistoric Pigeons (KSNM 30, Atropos Orb)

-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

-- 7D01 : final BC event.
-- param 2: #time record for this mission
-- param 3: #clear time in seconds
-- param 4: #which mission (linear numbering as above)
-- 7D03 : stay/run away


-----------------------------------
X = player:getXPos();
Z = player:getZPos();
if (X>-346) and (X<-336) and (Z<-255) and (Z>-264) then -- we're on the outside circle, so need enter menu
  event = Event(0x7D00);
  bc_id = 0;
  if (player:getMissionStatus(1,19) == 1) and (player:getVar("mission_status") == 3) and (player:hasKeyItem(0x122) == 0) then
      bc_id = 8;                                                                         -- for Bastok Mission 7-2 "On My Way"
  elseif ((player:getMissionStatus(0,8) == 1) or (player:getMissionStatus(2,9) == 1)) and (player:getVar("mission_status") == 17) then
      bc_id = 1;                                                                         -- for Sandy and Windy missions 2-3
  end;
  event:setParams(0,0,0,bc_id,0,0,0,0)  -- 
  if (bc_id > 0) then
	player:startEvent(event); 
  else
    player:specialMessage(998); -- a cursed seal has been placed upon this platform.
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
  if ((player:getMissionStatus(0,8) == 1) or (player:getMissionStatus(2,9) == 1)) and (player:getVar("mission_status") == 17) then
    player:updateEvent(2,0,0,10,6,1);
  elseif (player:getMissionStatus(1,19) == 1) then
  	record = getGlobalVar("WAUGHROON_BASTOK7_2_RECORD");
  	player:updateEvent(2,3,0,record,6,1);
  elseif ((player:getMissionStatus(0,8) == 1) or (player:getMissionStatus(2,9) == 1)) and (player:getVar("mission_status") == 17) then
 		record = getGlobalVar("WAUGHROOM_RANK2_RECORD");
		player:updateEvent(2,0,0,record,6,1);
  end;
end;
end
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
-----------------------------------
-- Trades go below.
-----------------------------------
if (count == 1) and (npc:getId() == 17367305) then
  
  -- trades are not completed so that the orb doesn't get lost.
  
  event = Event(0x7D00);
  if (trade:hasItemQty(CloudyOrb,1)) then
    event:setParams(0,0,0, 1024, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(SkyOrb,1)) then
    event:setParams(0,0,0, 10752, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(StarOrb,1)) then
    event:setParams(0,0,0, 2, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(CometOrb,1)) then
    event:setParams(0,0,0, 16416, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(MoonOrb,1)) then
    event:setParams(0,0,0, 32772, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(ClothoOrb,1)) then
    event:setParams(0,0,0, 65536, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(LachesisOrb,1)) then
    event:setParams(0,0,0, 131072, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(AtroposOrb,1)) then
    event:setParams(0,0,0, 262144, 0, 0, 0, 0);
    player:startEvent(event);
  elseif (trade:hasItemQty(ThemisOrb,1)) then
    event:setParams(0,0,0, 4096, 0, 0, 0, 0);
    player:startEvent(event);
  end
end

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x7D00) and (option ~=0) then
	if (player:getMissionStatus(1,19) == 1) then
		loc = Zone(0x90);
		offset = 1.6; 
		-- mob positiosn from http://www.youtube.com/watch?v=BoK0usEmZ2A
		loc:spawnMob("Go_BhaSlaughte",-177.43-offset, 60.1, -142.1-offset, 128,nil);
		loc:spawnMob("Ku_JhuGranites",-177.43-offset, 60.1, -142.1+offset, 128,nil);
		loc:spawnMob("Da_ShuKnightsl",-177.43+offset, 60.1, -142.1-offset, 128,nil);
		loc:spawnMob("Sa_NhaSoulsave",-177.43+offset, 60.1, -142.1+offset, 128,nil);
		setGlobalVar("WAUGHROON_SHRINE",4) -- how many monsters need to be killed.
		setGlobalVar("WAUGHROON_ENTER_TIME",os.time());
	elseif (csid == 0x7D00) and  ((player:getMissionStatus(0,8) == 1) or (player:getMissionStatus(2,9) == 1)) then
		loc = Zone(0x90);
		loc:spawnMob("DarkDragon",-177.6,60,-142,128 ,nil);
		loc:spawnMob("Seeker",-173,60,-142,128 ,nil);
		setGlobalVar("WAUGHROON_SHRINE",2) -- how many monsters need to be killed.
		setGlobalVar("WAUGHROON_ENTER_TIME",os.time());
	end;
end;
end;