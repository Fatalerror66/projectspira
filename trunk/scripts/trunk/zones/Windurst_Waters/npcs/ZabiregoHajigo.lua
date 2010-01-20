-----------------------------------
--	Author: Trin
-- 	Zabirego-Hajigo
-- 	Fame Checker
-----------------------------------


-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

fame = player:getFame(2);

if (fame < 200) then 
player:startEvent( Event(0x2b0));
end

if (fame >= 200 and fame < 500) then
player:startEvent( Event(0x2b1));
end

if (fame >= 500 and fame < 900) then
player:startEvent( Event(0x2b2));
end

if (fame >= 900 and fame < 1300) then
player:startEvent( Event(0x2b3));
end

if (fame >= 1300 and fame < 1700) then
player:startEvent( Event(0x2b4));
end

if (fame >= 1700 and fame < 1952) then
player:startEvent( Event(0x2b5));
end

if (fame >= 1952 and fame < 2200) then
player:startEvent( Event(0x2b6));
end

if (fame >= 2200 and fame < 2450) then
player:startEvent( Event(0x2b7));
end

if (fame >= 2450) then
player:startEvent( Event(0x310));
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