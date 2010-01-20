-----------------------------------
--	Author: JesseJames, Aurelias
-- 	Norejaie
-- 	Eco-Warrior San d'Oria
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
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
player:startEvent(Event(0x02A5));
else
if(wind >= 1) then
player:startEvent(Event(0x02AA));
else
if(bast >= 1) then
player:startEvent(Event(0x02AA));
else
if(sand == 1) then
player:startEvent(Event(0x02A7));
else
if(player:hasKeyItem(0x1D8) == 1) then
player:startEvent(Event(0x02A9));
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
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

if(csid == 0x02A9 and option == 0) then
player:removeKeyItem(0x1D8);
player:addItem(4198);
player:addGil(GIL_RATE*5000);
player:specialMessage(45,0x1066);
player:specialMessage(GIL_OBTAINED,GIL_RATE*5000);
player:setVar("eco_warrior_sand",0)
player:completeQuest(0,97);
player:setTitle(290)
else
end
if(wind == 0 and sand == 0 and bast == 0) then
if(option == 1) then
player:setVar("eco_warrior_sand",1)
player:addQuest(0,97);
end
end
end;