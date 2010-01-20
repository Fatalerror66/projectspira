-----------------------------------
--	Author: Tenjou
-- 	MASTER BONEWORKER: Lih Pituu
-- 	Gives players advanced synthesis support (not yet implemented).
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local bone = player:getVar("bonecraftRank");
--print("Bone: ",bone);
player:startEvent(Event(0x2722));
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