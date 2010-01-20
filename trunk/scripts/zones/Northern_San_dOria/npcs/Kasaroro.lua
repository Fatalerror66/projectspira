-- Auto-Generated Script from FFXImonV3 
-- By: Mana 
-- Windurst 2-3 code by ReaperX

require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

MISSION = 4243; -- Step right outside, and you'll see a big castle on the left. That's Chateau d'Oraguille..

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(FLYER_REFUSED) 
	end 
end; 

-- events

-- 0224 How may I help you?
-- 0222 2-3: opening CS for Sandy 1st path, tells you to go to Halver
-- 0225 2-3: after you've spoken to Halver
-- 0226 2-3: done with Sandy first path, now go to bastok
-- 0223 2-3: opening CS for Sandy 2nd path
-- 0227 2-3: done with Sandy 2nd path, now go back to Windurst
-- 022E 2-3: now, back home you go! I'm sure Lady Kupipi eagerly awaits your return.
-- 025C 2-3: Roguebender, right? You seem well-sweel! Feel free to hang around as long as you like!
-- 02A5 2-3: Hello there! You're the one with the introduction, eh? I'm bizzy-wizzy right now. Perhaps you'd like to talk to one of the staff.


----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
mission_status = player:getVar("mission_status");
if (player:getMissionStatus(2,5) == 1) and (mission_status == 2) then -- start of Sandy 1st path
	player:startEvent(Event(0x222)) 
elseif (player:getMissionStatus(2,5) == 1) and (mission_status == 6) then -- start of Sandy 2nd path
	player:startEvent(Event(0x223)) 
elseif (player:hasKeyItem(KindredReport) == 1) and  (player:getMissionStatus(2,8) == 1) then 
	player:startEvent(Event(0x22E));
elseif (player:hasKeyItem(KindredCrest) == 1) and  (player:getMissionStatus(2,8) == 1) then 
	player:startEvent(Event(0x227));
elseif (player:getMissionStatus(2,6) == 1) and (mission_status == 3) then
	player:showText(npc,MISSION);
elseif (player:getMissionStatus(2,6) == 1) and (mission_status == 4) then
	player:startEvent(Event(0x225)) 
elseif (player:getMissionStatus(2,6) == 1) and (mission_status == 5) then -- warchief dead
	player:startEvent(Event(0x226)) 
elseif (player:getMissionStatus(2,5) == 1) and (mission_status == 14) then
	player:showText(npc,MISSION+7); -- 4250:	Now all you have to do is get recognition from Bastok. Keep your wits about you, and you'll be finey-shiney!<Prompt>
	if DEBUG_MODE then
		
	end;
else
  player:startEvent(Event(0x224)) 
end; 
end;

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x222) then
	player:currentMission(2,6);        -- update mission to "The Three Kingdoms (San d'Oria)"
	player:setVar("mission_status",3); -- go to castle now
elseif (csid == 0x223) then
	player:removeKeyItem(LetterToConsulsWindy);
	player:currentMission(2,8);        -- update mission to "The Three Kingdoms (San d'Oria)"
	player:setVar("mission_status",17); -- go to castle now
elseif (csid == 0x226) then
	player:setVar("mission_status",14); -- Sandy part done!  -> go to Bastok
	player:currentMission(2,5);        -- update mission to "The Three Kingdoms"
elseif (csid == 0x227) then
	player:setVar("mission_status",20);  -- return to Windurst now
	player:currentMission(2,5);
	player:addKeyItem(KindredReport)
	player:specialMessage(KEYITEM_OBTAINED,KindredReport); 
	player:removeKeyItem(KindredCrest)
elseif (csid == 0x22E) and DEBUG_MODE then
	toKupipi(player);
end;
end;
