-----------------------------------
--	Author: ReaperX
--  door at H-10 (left) on map 4 for Sandy mission 8-2 "Lightbringer

-- pops NMs Nio-Hum and Nio-A. Their pop positions are not authentic. 

-- none of these texts here are verified. I selected them because they seemed reasonable
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
require("scripts/zones/Temple_of_Uggalepih/TextIDs");


-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Sandy_8_2_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Sandy_8_2_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(0,21) == 1) and (mission_status == 3) then
	if (timesincelastclear < QM_RESET_TIME) then
		if (player:hasKeyItem(PieceOfABrokenKey1) == 1) and (player:hasKeyItem(PieceOfABrokenKey2) == 1) and (player:hasKeyItem(PieceOfABrokenKey3) == 1) then
			player:specialMessage(MISSIONS+4,CrystalDowser); -- The Crystal Dowser begins to quiver!
			player:startEvent(Event(0x41));
		else
			player:specialMessage(MISSIONS)  -- "you cannot open this door"
		end;
	elseif (mobsup == 0) then
		loc = Zone(0x9f);
		loc:spawnMob("Nio-A",-47, -17, -142,192,nil);
		loc:spawnMob("Nio-Hum",-52, -17, -142,192,nil);
		player:specialMessage(QM_DEFAULT+1)  -- "You are suddenly overcome with a sense of foreboding."
	  setGlobalVar("Sandy_8_2_Fight",2)
  else	
  	-- not implemented: depop the ??? until mobs die.
  end;
else
  player:specialMessage(MISSIONS); -- "you cannot open this door"
end;
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x41) then
  player:setVar("mission_status",5);
end;
end;