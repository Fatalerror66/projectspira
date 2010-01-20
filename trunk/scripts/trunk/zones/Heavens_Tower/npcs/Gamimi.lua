-----------------------------------
--	Author: Tenjou
-- 	GOLD WORLD PASS ARBITER: Gamimi
-- 	She gives adventurers gold world passes.  This is an irrelevant service in pXI.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Block other options.  pXI will most likely not make use of gold world passes.  It is possible to construct your character with server commands on other servers.
local event0x2710 = Event(0x2710);
event0x2710:setParams(0,0,0,0,0,0,0xfe,0);
player:startEvent(event0x2710);
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