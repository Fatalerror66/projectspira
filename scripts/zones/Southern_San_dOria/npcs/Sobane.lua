-----------------------------------
-- Sobane
-- Area: Southern San d'Oria  (house at D-6)
-- By: ReaperX
-- PLD AF1 quest "Sharpening the Sword"

-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
 
end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)

if (player:getVar("sharpening_the_sword_status") == 1) or (player:getVar("sharpening_the_sword_status") == 2) then
  player:startEvent(Event(0x34));	 
end;
end;
 
 
--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,menuchoice)
--print("option =",option);
--print("Event ID =  ",csid);
if (csid == 0x34) then
  player:setVar("sharpening_the_sword_status",2);
end;
end;
