-- Auto-Generated Script from FFXImonV3 + Bastok Mission 2.3
-- By: Mana , ReaperX
-- 
-- problems: when exactly does the mission log update to "The Emissary (San d'Oria)"? When you talk to
-- the ambassador, or when you talk to Halver?

require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	end 
end; 

-- Helaku events :
-- 
-- 0x0218 Bastok Mission 2.3 "The Emissary" (Sandy->Windy)
-- 0x0219 Bastok Mission 2.3 "The Emissary" (Windy->Sandy)
-- 0x021D default greeting
-- 0x021E Mission 2.3 : after speaking to Halver in Chateau
-- 0x021F final event for Sandy leg ( Sandy->Windy )
-- 0x0221 final event for Sandy leg ( Windy->Sandy )
-- 0x022D reminder to get back to the homeland (after finishing 0x0221)
-- 0x025B well if it isn't {player name} (reaction after achieving rank 3?)
-- 0x02A4 tells you to go see his staff first (on 2.3)
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 

emissary_status = player:getMissionStatus(1,5);       -- The Emissary
emissary_status1 = player:getMissionStatus(1,6);      -- The Emissary (San d'Oria) (Sandy 1st path)
emissary_status2 = player:getMissionStatus(1,8);      -- The Emissary (San d'Oria) (Sandy 2nd path)

mission_status = player:getVar("mission_status");

if (emissary_status == 1) and (mission_status == 1) then
  player:startEvent(Event(0x2A4)) 
elseif (emissary_status == 1) and (mission_status == 2) then
  player:startEvent(Event(0x218)) 
elseif (emissary_status == 1) and (mission_status == 3) then
  player:showText(npc,1663)                                              -- repeats instructions how to get to the castle
elseif (emissary_status1 == 1) and (mission_status == 4) then
  player:startEvent(Event(0x21E))    															     -- "looks like Halver gave you your orders"  
elseif (emissary_status1 == 1) and (mission_status == 5) then 
  player:startEvent(Event(0x21F))                                       -- to Windurst next
elseif (emissary_status == 1) and (mission_status == 6) then 
  player:showText(npc,1671) 
  if (DEBUG_MODE) then
    player:setPos(-97, -5, 154, 225, 0xF0);  -- to Port Windurst
  end;
elseif (player:getMissionStatus(1,7) == 1) and ((mission_status == 15) or (mission_status == 16)) then -- coming from Windy first path
  player:startEvent(Event(0x219)) 
elseif (emissary_status2 == 1) and (mission_status == 17) then           -- ready to go to castle
  player:showText(npc,4199)
elseif (player:hasKeyItem(KindredCrest) == 1) then
  player:startEvent(Event(0x221));
elseif (emissary_status2 == 1) and (mission_status == 18) then 
  player:startEvent(Event(0x21E))                                       -- "looks like Halver gave you your orders"  
elseif (emissary_status == 1) and (mission_status == 19) then           
  player:startEvent(Event(0x22D))                                       -- reminder to go back to the homeland
else
  player:startEvent(Event(0x21D)) 
end
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x218) then
  player:setVar("mission_status",3);  -- go to castle now
elseif (csid == 0x219) then
  player:currentMission(1,8);         -- update mission to "The Emissary (San d'Oria)"
  player:setVar("mission_status",17); -- next go to castle
  player:removeKeyItem(LetterToConsulsBastok)
elseif (csid == 0x21E) and (DEBUG_MODE) then
	player:setPos(-509, 159, -210, 0, 0x8B);   -- to Horlais Peak
elseif (csid == 0x21F) then
  player:setVar("mission_status",6);  -- Sandy part done!  -> go to Windy
  player:currentMission(1,5);
elseif (csid == 0x221) then
  player:setVar("mission_status",19); -- Sandy part done! -> go back to Bastok
  player:addKeyItem(KindredReport) 
  player:specialMessage(KEYITEM_OBTAINED,KindredReport); 
  player:removeKeyItem(KindredCrest)
  player:currentMission(1,5);
elseif (csid == 0x22D) and (DEBUG_MODE) then
	player:setPos(64, -14, -8, 0, 0xED);   -- to Naji
end; 
end;