-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Naji
-- 	Basic Chat Text + Bastok Missions
--  
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
require("scripts/globals/teleports");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");

KEYITEM_OBTAINED = 259; -- this is already defined in TextIDs.lua but for some reason it doesn't work.
				 
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--[[ Naji events --

02C6 final CS for "The Zeruhn Report"
02C7 final CS for "The Crystal Line"
02BC default message ("this is the president's office..")
02C9 opening CS for 2.3 "The Emissary"
02CA final CS for 2.3 "The Emissary" - rank 3!
02CB opening CS for 2.1 "The Four Musketeers"
02CD repeats instructions for 2.1
02D0 CS for 5.1 "Darkness Rising"
02D1 CS for 5.1 "Darkness Rising" (after you turned it down the first time)
02D2 final CS for 5.1 "Darkness Rising"
02EE final CS for WAR AF1 "The Doorman"
03F0 final CS for "Fetichism" - Rank 2!
03F1 final CS for "Fetichism" - Rank 2!
02F9 opening CS for 6.2 "The Pirate's Cove"
02FA final CS for 6.2 "The Pirate's Cove" - Rank 7!
030E final CS for 9.2."Where Two Paths Converge"- Rank 10!
(0325) Alois CS: final CS for quest "Faded Promises"
036D Says something about the multinational expedition (CoP Mission?)
03AA for "Jeuno"?
03AB Wajaoam Infiltration Operation (ToAU Mission?)
03AC mission with the king of hearts
03AD ToAU 
03AE ToAU

--]]
---------------------------------------

emissary_status = player:getMissionStatus(1,5)
mission_status = player:getVar("mission_status")

if (player:hasKeyItem(ZeruhnReport) == 1) then
  has_examined_report = player:seenKeyItem(ZeruhnReport)
  event = Event(0x02C6);
  if (has_examined_report == 0) then
    event:setParams(1);
  else
    event:setParams(0);
  end
  player:startEvent(event);
elseif (player:getMissionStatus(1,0) == 2) and (player:getMissionStatus(1,1) == 0) then
	player:showText(npc,1154) -- "Wow! Not many people get to speak to Sir Lucius after their first mission. "
	if (DEBUG_MODE) then
    player:setPos(130, 8.5, -1.6, 228, 0xEC);   -- to Argus
  end;
elseif (player:hasKeyItem(CLReport) == 1) then
  player:startEvent(Event(0x2C7));
elseif  (player:hasKeyItem(KindredReport) == 1) then  
  player:startEvent(Event(0x2CA));
elseif (player:getMissionStatus(1,10) == 1) and (mission_status == 1) then
	player:showText(npc,41)
elseif (emissary_status == 1) and (mission_status == 1) and (player:hasKeyItem(LetterToConsulsBastok) == 0) then
  player:startEvent(Event(0x2C9));
elseif (emissary_status == 1) and (mission_status == 1) and (player:hasKeyItem(LetterToConsulsBastok) == 1) then
  player:showText(npc,1261) -- "Good luck on your mission!"
elseif (player:hasKeyItem(BurntSeal) == 1) then 
  player:startEvent(Event(0x2D2));
elseif (player:hasKeyItem(MessageToJeunoBastok) == 1) then
  player:startEvent(Event(0x2D0))
elseif (player:getMissionStatus(1,14) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x2D1))
elseif (player:getMissionStatus(1,14) == 1) and (mission_status == 4) then
  player:showText(npc,1268)
  if (DEBUG_MODE) then
  	toFeiYin(player);
  end;
elseif (player:getMissionStatus(1,14) == 2) and (player:getMissionStatus(1,15) == 0) then
  player:showText(npc,1274)
elseif (player:getMissionStatus(1,15) == 1) and (mission_status == 1) then
  player:showText(npc,1994)
elseif (player:getMissionStatus(1,17) == 1) and (mission_status == 1) then
  player:startEvent(Event(0x2F9))
elseif (player:getMissionStatus(1,17) == 1) and (mission_status == 2) then
  player:showText(npc,2013)
  if (DEBUG_MODE) then
  	player:setPos(111, -7, -12, 255, 0xfc);     -- to Gilgamesh
  end;
elseif (player:getMissionStatus(1,17) == 1) and (mission_status == 4) then
  player:startEvent(Event(0x2FA))
else
  player:startEvent(Event(0x2BC));
end
end; 
 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x02C6) then
  player:completeMission(1,0);
  player:setVar("mission_status",0);
  player:removeKeyItem(1);
elseif (csid == 0x02C9) then
  player:addKeyItem(LetterToConsulsBastok);
  player:specialMessage(KEYITEM_OBTAINED,LetterToConsulsBastok); 
elseif (csid == 0x02CA) then
  player:removeKeyItem(KindredReport);
  player:completeMission(1,5);
  player:setVar("mission_status",0);
  player:addKeyItem(AdventurersCertificate);
  player:setTitle(CertifiedAdventurer)
  player:specialMessage(KEYITEM_OBTAINED,AdventurersCertificate); 
  player:addGil(GIL_RATE*3000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*3000); 
  player:rankUp()
elseif (csid == 0x02D0) then
  player:removeKeyItem(MessageToJeunoBastok);
  if (option == 0) then -- mission accepted
    player:addKeyItem(NewFeiYinSeal);
    player:specialMessage(KEYITEM_OBTAINED,NewFeiYinSeal); 
    player:setVar("mission_status",2); -- heard briefing and acceped mission;
    player:currentMission(1,14);
  end
elseif (csid == 0x02D1) then
  player:addKeyItem(NewFeiYinSeal); 
  player:specialMessage(KEYITEM_OBTAINED,NewFeiYinSeal); 
  player:setVar("mission_status",2); -- heard briefing and acceped mission;
elseif (csid == 0x02D2) then
  add_rank_points_for_mission(player)
  player:completeMission(1,14);
  player:removeKeyItem(BurntSeal);
  player:setVar("mission_status",0);
elseif (csid == 0x02F9) then
  player:setVar("mission_status",2);
elseif (csid == 0x02FA) then
  player:completeMission(1,17);
  player:addGil(GIL_RATE*40000)
  player:specialMessage(GIL_OBTAINED,GIL_RATE*40000); 
  player:setVar("mission_status",0);
  player:rankUp()
end;
end;