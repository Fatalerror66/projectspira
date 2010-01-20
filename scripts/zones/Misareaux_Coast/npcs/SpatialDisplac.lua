-----------------------------------
--	Author: ReaperX
--  Spatial Displacement
--  Teleports Player to Cape Riverne. 
--  0x226 offers to teleport player to Riverne Site #A01.
--  0x227 gives a choiec to port player to site #A01 or #B01.
--  No CoP mission checks implemented yet so we use 0x227 by default.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)
player:startEvent(Event(0x227));
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
if (csid == 0x227) and (option == 1) then -- player chose Riverne #A01
 player:setPos(734,-32,-505,101,0x1E);
elseif (csid == 0x227) and (option == 2) then -- player chose Riverne #A01
 player:setPos(729,-20,410,88,0x1D);
end;
end;

