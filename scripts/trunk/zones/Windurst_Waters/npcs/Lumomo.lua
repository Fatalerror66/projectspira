-----------------------------------
--	Author: Tenjou, Aurelias
-- 	Lumomo
-- 	Starts and ends quest "Eco-Warrior Windurst" (not implemented)
--	She starts the quest with event 0x332.  0x334 is during.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
wind = player:getVar("eco_warrior_wind")
sand = player:getVar("eco_warrior_sand")
bast = player:getVar("eco_warrior_bast")

if(wind == 0 and sand == 0 and bast == 0) then --makes sure no other eco warrior is active
player:startEvent(Event(0x0332));
else
if(bast >= 1) then
player:startEvent(Event(0x0337));
else
if(sand >= 1) then
player:startEvent(Event(0x0337));
else
if(wind == 1) then
player:startEvent(Event(0x0334));
else
if(player:hasKeyItem(0x1DA) == 1) then
player:startEvent(Event(0x0336));



else
end
end
end
end
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

if(csid == 0x0336 and option == 0) then
player:removeKeyItem(0x1DA);
player:addItem(4198);
player:addGil(GIL_RATE*5000);
player:specialMessage(GIL_OBTAINED,GIL_RATE*5000);
player:specialMessage(179,0x1066);
player:setVar("eco_warrior_wind",0)
player:completeQuest(2,84);
player:setTitle(292)
	else
	end

if(wind == 0 and sand == 0 and bast == 0) then
if(option == 1) then
player:setVar("eco_warrior_wind",1)
player:addQuest(2,84);
else
end
end
end;