-----------------------------------
--	Author: Aurelias
--  Worn Book
-- 	Getting 'Old Rusty Key key item'
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
 soul = player:getVar("paintbrush_of_souls")
book1 = player:getVar("paintbrush_of_souls_book1")
book2 = player:getVar("paintbrush_of_souls_book2")
book3 = player:getVar("paintbrush_of_souls_book3")
		
if(book1 == 1 and book2 ==1 and book3 == 1) then
	player:specialMessage(894,0x111);
	player:specialMessage(23,0x111); -- Show Message
	player:addKeyItem(0x111); -- Adding 'Old Rusty Key'
	player:setVar("paintbrush_of_souls_book1",0);
	player:setVar("paintbrush_of_souls_book2",0);
	player:setVar("paintbrush_of_souls_book3",0);
	player:setVar("paintbrush_of_souls",1);
elseif(soul == 2) then
	player:specialMessage(880);
elseif(npcid == 17428908 and soul == 0) then
	player:startEvent(Event(0x003D)); --First Book
elseif(npcid == 17428909 and soul == 0) then
	player:startEvent(Event(0x003E)); --Second Book
elseif(npcid == 17428910 and soul == 0) then
	player:startEvent(Event(0x003F)); --Third Book
else
	player:specialMessage(880); --Quest Complete
end
end;
 


 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if(csid == 0x003d and option == 1) then
	player:setVar("paintbrush_of_souls_book1",1);
elseif(csid == 0x003e and option == 1) then
	player:setVar("paintbrush_of_souls_book2",1);
elseif(csid == 0x003f and option == 1) then
	player:setVar("paintbrush_of_souls_book3",1);
end
end;
 