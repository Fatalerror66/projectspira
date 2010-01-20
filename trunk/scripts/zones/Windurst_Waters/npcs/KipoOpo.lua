-----------------------------------
--	Author: Tenjou
-- 	MASTER CHEF: Kipo-Opo
-- 	Provides advanced synthesis support (not implemented yet).
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--ARGUMENT 1: Charge for advanced support.
--ARGUMENT 3: Set to 1 for him to offer regular support, or 0 for advanced support.
--ARGUMENT 4: Set to 256 for him to offer any service at all.
--ARGUMENT 6: Set to 1 if the player already recieved synth support.
member = player:getVar("isGuildMember-Cooking");
rank = player:getSkillRank(56);
price = 30*rank;
advanced = 0;
support = 0;
local event0x271f = Event(0x271f)
event0x271f:setParams(price,0,advanced,member*256,0,support,0,0);
player:startEvent(event0x271f);
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