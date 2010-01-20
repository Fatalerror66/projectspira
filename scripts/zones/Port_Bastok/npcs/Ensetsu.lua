-----------------------------------
--	Author: Arcanedemon
-- 	Ensetsu
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
sealeddagger = player:hasKeyItem(258);

--print("Quest:",ninQuest);
--print("Coral:",strangecoral);

if(ninQuestCS == 2 and ninQuest == 0) then
	player:startEvent(Event(0x00F2));
elseif(ninQuest == 1 and strangecoral == 1) then
	player:startEvent(Event(0x00F5));
	ninQuestCS = player:setVar("ayameandkaede-CS",3);
elseif(ninQuest == 1 and sealeddagger == 1) then
	player:startEvent(Event(0x00F6));
else
	player:startEvent(Event(0x001B));
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

if(csid == 0x00F2) then
	player:setVar("ayameandkaede-CS",0);
	player:addQuest(1,60);
elseif(csid == 0x00F6) then
	player:unlockJob(13);
	player:specialMessage(1779);
	player:completeQuest(1,60);
	player:setTitle(191);
	player:removeKeyItem(258);
	player:addFame(3,NORG_FAME*17);
end;
end;