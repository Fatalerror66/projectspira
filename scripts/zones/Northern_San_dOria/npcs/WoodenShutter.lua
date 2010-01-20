-- Area: Northern San d'Oria
--  NPC: Wooden Shutter
--  Zone-Line event to enter Carpenter's Landing 
-- By: Mana
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)

player:startEvent( Event(0x5))
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("RESULT:",option);
if option == 1 then
player:setPos(-480,-5.65,669,70,0x2)
end
end;