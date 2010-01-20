-----------------------------------
--	Author: Tenjou
-- 	Mashuu-Ajuu
-- 	Starts and ends quest "Reap What You Sow."
--	Also starts and ends quest "Let Sleeping Dogs Lie" (incomplete)
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
local sow = player:getVar("reapWhatYouSow");
if (sow == 0) then
	local event0x1cf = Event(0x1cf)
	event0x1cf:setParams(0,0x11d5,0x11d6);
	player:startEvent(event0x1cf);
elseif (sow == 1) then
	local event0x1d0 = Event(0x1d0)
	event0x1d0:setParams(0,0x11d5,0x11d6);
	player:startEvent(event0x1d0);
elseif (sow == 2) then
	player:startEvent(Event(0x1dc));
	player:setVar("reapWhatYouSow",4);
elseif (sow == 3) then
	player:startEvent(Event(0x1de));
	player:setVar("reapWhatYouSow",4);
elseif (sow == 4) then
	local event0x1df = Event(0x1df)
	event0x1df:setParams(0,0x11d5,0x11d6);
	player:startEvent(event0x1df);
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local sow = player:getVar("reapWhatYouSow");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x11d5,1);
item2 = trade:hasItemQty(0x11d6,1);
if (count == 1 and item1 == true and (sow == 1 or sow == 4)) then
	player:removeItem(0x11d5,1);
	local event0x1db = Event(0x1db);
	event0x1db:setParams(500);
	player:startEvent(event0x1db);
	player:setVar("reapWhatYouSow",2)
	player:addGil(GIL_RATE*500);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*500);
	if (sow == 1) then
		player:addItem(0x83);
	end
	player:addFame(2,WIN_FAME*20);
	--print("Windurst fame adjusted for",player:getName(),"by 20 (Total:",player:getFame(2),").");
	player:completeQuest(2,29);
elseif (count == 1 and item2 == true and (sow == 1 or sow == 4)) then
	player:removeItem(0x11d6,1);
	local event0x1dd = Event(0x1dd);
	event0x1dd:setParams(700);
	player:startEvent(event0x1dd);
	player:setVar("reapWhatYouSow",3)
	player:addGil(GIL_RATE*700);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*700);
	if (sow == 1) then
		player:addItem(0x83);
	end
	player:addFame(2,WIN_FAME*20);
	--print("Windurst fame adjusted for",player:getName(),"by 20 (Total:",player:getFame(2),").");
	player:completeQuest(2,29);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("Option:",option);
if (csid == 0x1cf and option == 3 or csid == 0x1df and option == 3) then
	--Accept quest "Reap What You Sow."
	player:setVar("reapWhatYouSow",1);
	player:addItem(0x23c);
	player:addQuest(2,29);
end
end;