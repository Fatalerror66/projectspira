-----------------------------------
--	Author: Arcanedemon, Aurelias
-- 	Fhe Maksojha
-- 	Quest 'Not meant to be'
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
NotMeantToBe = player:getVar("NotMeantToBe");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(NotMeantToBe == 1) then
	player:startEvent(Event(0x127));
elseif(NotMeantToBe == 2) then
	player:startEvent(Event(0x126));
elseif(NotMeantToBe == 3) then
	player:startEvent(Event(0x128));
elseif(NotMeantToBe == 4) then
	player:startEvent(Event(0x128));
elseif(NotMeantToBe == 5) then
	player:startEvent(Event(0x128));
elseif(NotMeantToBe == 6)then
	player:startEvent(Event(0x129));
elseif(NotMeantToBe == 7)then
	player:startEvent(Event(0x12A));
else
	player:startEvent(Event(0x125));
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
if(csid == 0x125) then
	player:setVar("NotMeantToBe",1);
elseif(csid == 0x126) then
	player:setVar("NotMeantToBe",3);
elseif(csid == 0x129) then
	player:setVar("NotMeantToBe",7);
	player:specialMessage(20,2187);
	player:addItem(2187);
	player:addItem(2187);
	player:addItem(2187);
end
end;