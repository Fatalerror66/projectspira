-----------------------------------
--	Author: Tenjou
-- 	Hiwon-Biwon
-- 	Involved in Shantotto's three curses quests,and in the newspaper quest.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local curses = player:getVar("cursesFoiledAgain");
local news = player:getVar("makingHeadlines");
local watersscoop = player:hasKeyItem(0x28);
local wallsscoop = player:hasKeyItem(0x29);
local portscoop = player:hasKeyItem(0x2a);
local woodscoop = player:hasKeyItem(0x2b);
--Check status of quest "Curses,Foiled Again!"
if (curses == 0) then
	--Check status of quest "Making Headlines"
	if (news == 1) then
		if (wallsscoop ~= 1) then
			player:startEvent(Event(0x119));
			player:addKeyItem(0x29);
			if (watersscoop == 1 and portscoop == 1 and woodsscoop == 1) then
				player:setVar("makingHeadlines",2);
			end
		else
			player:startEvent(Event(0x11a));
		end
	else
		--normal text
		--Quest not activated.  Not sure what the difference is between events 0x131,0xa8 and 0xa9.
		player:startEvent(Event(0x131));
	end
elseif (curses == 1) then
	--During quest
	--Check status of quest "Making Headlines"
	if (news == 1) then
		if (wallsscoop ~= 1) then
			player:startEvent(Event(0x119));
			player:addKeyItem(0x29);
		else
			player:startEvent(Event(0x11a));
		end
	else
		player:startEvent(Event(0xaa));
	end
elseif (curses == 2) then
	--After quest
	--Check status of quest "Making Headlines"
	if (news == 1) then
		if (wallsscoop ~= 1) then
			player:startEvent(Event(0x11b));
			player:addKeyItem(0x29);
		else
			player:startEvent(Event(0x11c));
		end
	else
		player:startEvent(Event(0xaf));
	end
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