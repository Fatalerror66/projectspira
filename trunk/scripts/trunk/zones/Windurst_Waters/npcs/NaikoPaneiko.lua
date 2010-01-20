-----------------------------------
--	Author: Tenjou
-- 	Naiko-Paneiko
-- 	Starts and ends quest "Making Headlines"
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
local news = player:getVar("makingHeadlines");
if (news == 0) then
	--give quest
	player:startEvent(Event(0x299));
	player:setVar("makingHeadlines",1);
	player:addQuest(2,37);
elseif (news == 1) then
	--during quest
	player:startEvent(Event(0x29a));
elseif (news == 2) then
	--fail; possible no reward
	player:startEvent(Event(0x2a1));
	player:setVar("makingHeadlines",4);
	player:removeKeyItem(0x28);
	player:removeKeyItem(0x29);
	player:removeKeyItem(0x2a);
	player:removeKeyItem(0x2b);
	--I decided to give some fame for the effort.
	player:addFame(2,WIN_FAME*10);
	player:setTitle(126);
--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
elseif (news == 3) then
	--success
	player:startEvent(Event(0x2a2));
	player:setVar("makingHeadlines",4);
	player:removeKeyItem(0x28);
	player:removeKeyItem(0x29);
	player:removeKeyItem(0x2a);
	player:removeKeyItem(0x2b);
	player:addGil(GIL_RATE*560);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*560);
	player:addFame(2,WIN_FAME*50);
--print("Windurst fame adjusted for",player:getName(),"by 50 (Total:",player:getFame(2),").");
	player:completeQuest(2,37);
	player:setTitle(126);
elseif (news == 4 or news == 5) then	
	--after quest
	player:startEvent(Event(0x29f));
else
	--normal text
	player:startEvent(Event(0x297));
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
end;