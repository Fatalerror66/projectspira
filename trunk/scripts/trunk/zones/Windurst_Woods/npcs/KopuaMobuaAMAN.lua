-----------------------------------
--	Author: Tenjou
-- 	ADVENTURERS' MUTUAL AID NETWORK REPRESENTATIVE: Kopua-Mobua
--	Flags players for mentor status if they have enough playtime and are above level 30.  Not yet implemented,low priority.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:startEvent(Event(0x272a));
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
end;