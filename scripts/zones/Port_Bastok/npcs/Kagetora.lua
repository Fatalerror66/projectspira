-----------------------------------
--	Author: Arcanedemon
-- 	Kagetora
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
ninQuestCS = player:getVar("ayameandkaede-CS");
ninQuest =player:getQuestStatus(1,60);
strangecoral = player:hasKeyItem(257);

if(ninQuestCS == 1 and ninQuest == 0) then
	player:startEvent(Event(0x00F1));
elseif(ninQuest == 1 and strangecoral == 1) then
	player:startEvent(Event(0x00F4));
else
	player:startEvent(Event(0x0017));
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
--print("CSID:",csid);
--print("RESULT:",option);

if(csid==F1) then
	player:setVar("ayameandkaede-CS",2);
end;
end;