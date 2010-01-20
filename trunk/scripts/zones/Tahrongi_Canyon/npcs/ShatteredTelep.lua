-----------------------------------
-- Author: ReaperX, Tenjou
-- Shattered Telepoint (Crag of Mea)
-- Transports qualified to the Hall of Transference
--
-- Missing: response of shattered telepoint, if any, before player is qualified for transport.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
cop_status = player:getVar("belowTheArks");
--print("Below the Arks Status: ",cop_status)
if (cop_status == 1) then 
  event = Event(0x390)
  player:setVar("belowTheArks",2);
elseif (cop_status == 2) then
  event = Event(0x391);
end

player:startEvent(event);
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if ((csid == 0x0390) or (csid == 0x0391)) and (option == 0 ) then
  player:setPos(280,-80,-69 , 192, 0x0E)
end
end;

