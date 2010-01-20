-----------------------------------
--	Author: ReaperX
--  Heavy Stone Door
--  for Sandy Mission 6.2
--  pop positions have been transcribed from http://video.google.com/videoplay?docid=-5305045780141186159#
--  and are more or less authentic. Pop message "you sense something evil" is also verified.
--
-- questionable behavior: does this door normally open when you click on it? Right now it does.
-- 
-- needs verification: I'm assuming 0x5 is the 2nd KRT CS for 6.2 since it is the only CS that fits the story.
-- But I could find no online transcripts of this mission to confirm it, and I never did Sandy missions on retail.
---------------------------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
require("scripts/zones/King_Ranperres_Tomb/TextIDs");

-- events:

-- 0x5 Sandy mission 6.2 "Ranperre's Final Rest"
-- 0x6 Enter through the door?
-- 0x7 Leave through the door?
-- 0xE Sandy mission 9.2 (?) With Ranperre taking Lightbringer back

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
mission_status = player:getVar("mission_status");
mobsup = getGlobalVar("Sandy_6_2_Fight");                           -- how many mobs are still up
timesincelastclear = os.time()-getGlobalVar("Sandy_6_2_LastClear"); -- how long ago they were last killed.

if (player:getMissionStatus(0,17) == 1) and (mission_status == 2) then
  if (timesincelastclear < QM_RESET_TIME) then
		player:setVar("mission_status",3);
		player:startEvent(Event(0x6));
	elseif (mobsup == 0) then
    loc = Zone(0xBE);
		loc:spawnMob("CorruptedSoffe",-37.3, 7.5, 21.8,0,nil);
		loc:spawnMob("CorruptedUlbri",-37.3, 7.5, 17.8,0,nil);
		loc:spawnMob("CorruptedYorgo",-37.3, 7.5, 19.8,0,nil);
		player:specialMessage(SANDY_MISSION_OFFSET-1); -- "you sense something evil"
	  setGlobalVar("Sandy_6_2_Fight",3)
  else	
  	-- not implemented: depop the ??? until mobs die.
  end;
elseif (player:getMissionStatus(0,17) == 1) and (mission_status == 7) then
	player:startEvent(Event(0x5)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 7) then
	player:startEvent(Event(0xE)) 	
elseif (player:getXPos()>=-38) then
  --player:startEvent(Event(0x6)) 	
  player:specialMessage(SANDY_MISSION_OFFSET); --- "It is a solid stone door."
  if (DEBUG_MODE) and ((player:hasKeyItem(AncientSandOrianBook) == 1)  or ((player:getMissionStatus(0,17) == 1) and (mission_status == 8)))then
  	player:setPos(88, 1, -53, 32, 0xE6);	-- to Ambrotien
  end;
else
	player:startEvent(Event(0x7)) 	
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0xE) or (csid == 0x5) then
	player:setVar("mission_status",8);
end
end