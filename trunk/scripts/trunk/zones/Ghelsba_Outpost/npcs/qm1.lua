-----------------------------------
--	Author: ReaperX
--  ??? 
--  Escape point for Orcish Hut BCNM area
---------------------------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");

OrcishHutKey = 0x9D;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
--print(npc,npcname);
if (player:getZPos()<68.2) then
  player:startEvent(Event(0x7D03));
else
	player:specialMessage(733); -- "There is nothing out of the ordinary here."
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print(option);
if (option == 4) then
  player:setCurrGil(player:getCurrGil()-100);
end;
end

