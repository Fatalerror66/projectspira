-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Yin Pocanakhu
-- 	Basic Chat Text, gives hint for AF hands quests
-----------------------------------

NOMONEY = 1625 -- "Hey, what are you tryin' to pull? Get lost!"
OldGauntlets = 0xD2;

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(OldGauntlets) == 1) and (player:getVar("BORGHERTZ_QUEST") == 2) then
	player:setVar("oldbox",0);
	player:startEvent(Event(0xDC)); -- tells you about the toolbox.
else
	player:startEvent(Event(0xD1));
end;
end; 

function onEventSelection(player,csid,option) 
--print(csid,option);
if (csid == 0xDC) then
	if (player:getCurrGil() >= 1000) then -- onEventSelection is only called when player agrees to pay 1000 gil.
		player:updateEvent(1,1);
		player:setVar("oldbox",1000);
	else
		player:setVar("oldbox",-1); -- unknown: are there update params that trigger the dialog for this case?
	end; 
end;
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
--print("CSID*************",csid);
--print("RESULT*************",option);
if (csid == 0xDC)  then
	oldbox = player:getVar("oldbox");
	if (oldbox == 1000) then
		player:removeGil(1000)
		player:setVar("BORGHERTZ_QUEST",3); -- char now knows about the old toolbox and can skip these steps in the future.
	elseif (oldbox == -1) then
		player:showText(player:getTarget(),NOMONEY);
	end;
	player:setVar("oldbox",0);
end;
end;