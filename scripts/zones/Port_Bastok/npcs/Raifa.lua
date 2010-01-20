-----------------------------------
--	Author: Aurelias
-- 	Raifa
-- 	Eco-Warrior Bastok
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
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
player:startEvent(Event(0x0116));
else
if(wind >= 1) then
player:startEvent(Event(0x011B));
else
if(sand >= 1) then
player:startEvent(Event(0x011B));
else
if(bast == 1) then
player:startEvent(Event(0x0118));
else
if(player:hasKeyItem(0x1D9) == 1) then
player:startEvent(Event(0x011A));

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
if(csid == 0x011A and option == 0) then
	player:removeKeyItem(0x1D9);
	player:addItem(4198);
	player:addGil(GIL_RATE*5000);
	player:specialMessage(20,0x1066);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*5000);
	player:setVar("eco_warrior_bast",0)
	player:completeQuest(1,65);
	player:setTitle(291)
	else
	end
if(wind == 0 and sand == 0 and bast == 0) then
if(option == 1) then
player:setVar("eco_warrior_bast",1)
player:addQuest(1,65);
else
end
end
end;