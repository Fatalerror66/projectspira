-----------------------------------
--	Author: Arcanedemon
-- 	Ryoma
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
require("scripts/zones/Norg/TextIDs");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
ninQuestCS = player:getVar("ayameandkaede-CS");
ninQuest =player:getQuestStatus(1,60);
strangecoral = player:hasKeyItem(257);

if(ninQuestCS == 3 and ninQuest == 1 and strangecoral == 1) then
	player:startEvent(Event(0x005F));
else
	player:startEvent(Event(0x005E));
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

if(csid == 0x005F) then
	player:specialMessage(KEYITEM_OBTAINED,258);
	player:addKeyItem(258);
	player:removeKeyItem(257);
	player:setVar("ayameandkaede-CS",0);
end;
end;