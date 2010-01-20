-----------------------------------
--	Author: ChrisKara10 & Almendro
-- 	Parraggoh
--	Involved in Beauty & Galka and in mission 6-1
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
beautygalka = player:getVar("BeautyAndTheGalka");
keyitem = player:hasKeyItem(0x2);
-- if (beautygalka == 0) then
-- player:startEvent(Event(0x6));

if (beautygalka == -1) then
	player:startEvent(Event(0x7));
elseif (beautygalka == 1) then
	player:startEvent(Event(0x9));
elseif (beautygalka == 2 and keyitem == 1) then
	player:startEvent(Event(0xA));	
elseif (beautygalka == 2 and keyitem == 0) then
	player:startEvent(Event(0x8));	
elseif (player:getQuestStatus(1,1) == 2) then
	player:startEvent(Event(0xc));		
else
	player:startEvent(Event(0xb));
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
if (csid == 0x6 and option == 0) then
	player:setVar("BeautyAndTheGalka",2);
elseif (csid == 0x7 and option == 0) then
	player:setVar("BeautyAndTheGalka",2);
elseif(csid == 0xA) then
	player:removeKeyItem(0x2);
	player:addItem(0x4051);
	player:addFame(3,NORG_FAME*28); -- This fame is very accurate
	player:completeQuest(1,1);
	player:setVar("BeautyAndTheGalka",0);
	player:specialMessage(20,0x4051);
end
end;