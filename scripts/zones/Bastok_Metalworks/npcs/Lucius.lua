-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Lucius
-- 	Basic Chat Text + Bastok Mission 3.3 "Jeuno"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
KEYITEM_OBTAINED = 259; -- this is already defined in TextIDs.lua but for some reason it doesn't work.
-- Initialization

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
jeuno_status = player:getMissionStatus(1,12);          -- Jeuno
mission_status =  player:getVar("mission_status");

--[[ Lucius events
02C6 (Zeruhn report)
0140 default event
02C9 The Emissary open CS
02CA The Emissary closing CS
0142 opening CS for "Jeuno"
02D0
02D1
02D2
025B
03F0
03F1
03F2
0308
030E
--]]

if (jeuno_status == 1) and (mission_status == 1) then
  player:startEvent(Event(0x0142));
elseif (jeuno_status == 1) and (mission_status == 2) then
  player:showText(npc, 1426)   -- "Good luck. I am counting on you."
  if (DEBUG_MODE) then
		player:setPos(0, 7, -23, 63, 0xF3); -- to Ru'Lude Gardens
	end;
else
  player:startEvent(Event(0x0140));
end;
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
if (csid == 0x0142) then
  player:addKeyItem(LetterToTheAmbassador);
  player:specialMessage(KEYITEM_OBTAINED,LetterToTheAmbassador); 
  player:setVar("mission_status",2);
end 
end;