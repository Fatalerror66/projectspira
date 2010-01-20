-----------------------------------
--	Author: Tenjou
-- 	Ranpi-Monpi
-- 	Starts and ends quest "The Dawn of Delectibility."  (interesting time loop)
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local dawn = player:getVar("theDawnOfDelectability");
if (dawn == 0) then
	player:startEvent(Event(0x75));
elseif (dawn == 1 or dawn == 2 or dawn == 3) then
	player:startEvent(Event(0x77));
elseif (dawn == 4) then
	player:startEvent(Event(0x76));
	player:removeKeyItem(0x3ba);
	player:setVar("theDawnOfDelectability",5);
	player:addKeyItem(0x3bb);
elseif (dawn == 5) then
	--He's pretty much done for this quest at this point.
	player:startEvent(Event(0x78));
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
if (csid == 0x75 and option == 0) then
	--Begin quest.
	player:setVar("theDawnOfDelectability",1);
end
end;