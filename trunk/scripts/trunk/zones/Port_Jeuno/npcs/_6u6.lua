-----------------------------------
--	Author: Tenjou
-- 	DOOR: Arrivals Entrance (from Kazham)
-- 	Lets players into Jeuno from the Kazham airport,and blocks players from entering the airport.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x35));
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
--print("OPTION:",menuchoice);
end;