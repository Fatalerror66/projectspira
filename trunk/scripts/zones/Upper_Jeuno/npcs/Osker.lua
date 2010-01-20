-----------------------------------
--	Author: Tenjou
-- 	Osker
-- 	Involved in quest "Chocobo's Wounds," among other things.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local wounds = player:getQuestStatus(3,4);      -- http://wiki.ffxiclopedia.org/wiki/Chocobo%27s_Wounds
	if (wounds == 0) then
		player:startEvent(Event(0x3e));
	elseif (wounds == 1) then
		--Check feeding status.
		local feed = player:getVar("chocobosWo-FeedingStatus");
		if (feed == 0) then
			player:startEvent(Event(0x67));
		elseif (feed == 1) then
			player:startEvent(Event(0x33));
		elseif (feed == 2) then
			player:startEvent(Event(0x34));
		elseif (feed == 3) then
			player:startEvent(Event(0x3b));
		elseif (feed == 4) then
			player:startEvent(Event(0x2e));
		elseif (feed == 5) then
			player:startEvent(Event(0x37));
		end
	elseif (wounds == 2) then
		player:startEvent(Event(0x37));
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