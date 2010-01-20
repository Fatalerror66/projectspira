-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	JakohWahcondalo
-- 	Basic Chat Text, Zilart Mission 3
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
------------ events ----------

-- 0071 : default event "I'm the chieftainness and I make the rules."
-- 00A4 : touched a Rafflesia flower
-- 0072 : CS for ZM3 "Kazham's Chieftainess"
-- 0073 : followup event to 72
-- 002C
-- 002E
-- 002F
-- 0030
-- 0032
-- 0034
-- 0035
-- 0036
-- 0038
-- 0039
-- 006B
-- 006C
-- 006E
-- 006F
-- 0109
-- 0117
-- 0118
-- 0119
-- 011A
-- 011B
-- 011C
-- 0125
-- 0126


if (player:getMissionStatus(3,6) == 1) then
  player:startEvent(Event(0x0072));
elseif (player:getMissionStatus(3,8) == 1) then
  player:startEvent(Event(0x0073));
else
  player:startEvent(Event(0x0071));
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
if (csid == 0x72) then
  player:addKeyItem(0xEE);
  player:specialMessage(23,0xEE);
  player:completeMission(3,6)
  player:currentMission(3,8);
end
end;