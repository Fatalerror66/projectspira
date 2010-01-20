-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Honoi-Gomoi
-- 	Involved in quest "Hat in Hand."
--  CoP Mission 3-3B2, Comedy of Errors, Act II
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local hat = player:getVar("hatInHand");
local honoigomoi = player:getVar("hatInHand-HonoiGomoiCS");

cop_status = player:getMissionStatus(6,20);
comedy_of_errors_status = player:getVar("ComedyofErrors");

if (hat == 1 and honoigomoi == 0) then
	--NEEDS A PACKET 2A
	player:startEvent(Event(0x3b));
	player:setVar("hatInHand-HonoiGomoiCS",1);
elseif (cop_status == 1) and (comedy_of_errors_status == 3) then
  player:startEvent(Event(0x036A));
elseif (cop_status == 1) and (comedy_of_errors_status == 4) then
  player:startEvent(Event(0x036F));
else
	player:startEvent(Event(0x28a));
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
if (csid == 0x036A) then
  player:addKeyItem(0x245);
  player:specialMessage(182, 0x245);
  player:setVar("ComedyofErrors",4);  -- next : Yoran-Oran
end
end;