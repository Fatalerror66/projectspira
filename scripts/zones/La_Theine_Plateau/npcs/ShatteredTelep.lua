-----------------------------------
-- Author: ReaperX, Tenjou
-- Shattered Telepoint (Crag of Holla)
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
  event = Event(0x00C9)
  player:setVar("belowTheArks",2);
elseif (cop_status == 2) then
  event = Event(0x00CA);
end

player:startEvent(event);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if ((csid == 0x00C9) or (csid == 0x00CA)) and (option == 0 ) then
  player:setPos(-260,0,280, 0, 0x0E)
end
end;


 