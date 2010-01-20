-----------------------------------
--	Author: ReaperX
-- 	Gumbah
-- 	Involved in Bastok Missions, DRK job quest, Ground Strike quest
-----------------------------------
-- Initialization

LetterFromWerei = 0x122;

--[[          Gumbah events 

 0034 Werei was the oldest Galka around..
 0001 New Adventurer CS
 002D final CS for quest "The Eleventh's Hour"
 005D CS for quest "Rivals"
 005E final CS for quest "Rivals"
 0063 DRK job quest
 0082 opening CS for quest "Blade of Death"
 00AF about Werei's journey of Rebirth (new default response after some Bastok mission?)'
 00B0 final CS for 8-2
 00B1 player delivers letter from Werei (Bastok 7-2)
 00B6 final Cs for 6-1 "Return of the Talekeeper"
 00B7 after Gumbah becomes known as the Talekeeper (default response at rank 9 ?)
 00BE opens quest "Inheritance" (Ground Strike)
 00BF to abort quest or obtain new Sword of Trials
 00C0 not enough WS points
 00C1 gives you Annals of Truth
 00C2 you learn "Ground Strike"

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(LetterFromWerei) == 1) then  -- letter from Werei
  player:startEvent(Event(0xB1));
elseif (player:getMissionStatus(1,19) == 2) and (player:getMissionStatus(1,21) < 2) then
	player:startEvent(Event(0xAF));
elseif (player:getMissionStatus(1,21) == 2) then
  player:startEvent(Event(0xB7));
else
  player:startEvent(Event(0x34)); -- "Werei was the oldest Galka here"- seems ok for a default answer for now.
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
if (csid == 0xB1) then
  player:removeKeyItem(LetterFromWerei);
end
end;