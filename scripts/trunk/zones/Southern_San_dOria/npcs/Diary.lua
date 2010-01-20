-----------------------------------
--	Author: Aly
-- 	NPC:	Diary (1st house in Watchdog Alley)
--  Quest: 	To Cure A Cough
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
------------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
CoughCure = player:getQuestStatus(0,20);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (CoughCure == 1 and player:getVar("DiaryPage") ==0)then
		player:startEvent(Event(0x27F));  -- see diary, option to read
	elseif (player:getVar("DiaryPage") == 1) then
		player:startEvent(Event(0x280));  -- diary page 2
	elseif (player:getVar("DiaryPage") >= 2) then
		player:startEvent(Event(0x281));  -- read page 3
	end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)

if (csid == 0x027F and option == 0 ) then
	player:setVar("DiaryPage",1);	-- has read page 1
elseif (csid == 0x280 and option == 1) then
	player:setVar("DiaryPage",1);	-- can read p2, but reads page 1 instead
elseif (csid == 0x280 and option == 2) then
	player:setVar("DiaryPage",2);	-- has read page 2
elseif (csid == 0x281) then
	player:setVar("DiaryPage",3);	-- has read page 3
end
	
end;

--print("CSID:",csid);
--print("RESULT:",option);
