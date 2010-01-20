-----------------------------------
--	Author: Tenjou
-- 	Door: Priming Gate
-- 	Blocks access to Toraimarai Canal.  Players with a Rhinostery Certificate may enter.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

local certificate = player:hasKeyItem(0x10b);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (certificate ~= 1) then
	player:specialMessage(1086);
end
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