-----------------------------------
--	Author: Tenjou
-- 	CHEF: Hakeem
-- 	Provides synthesis support (not implemented yet).
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
member = player:getVar("isGuildMember-Cooking");
local event0x2721 = Event(0x2721);
player:startEvent(event0x2721);
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