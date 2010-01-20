-----------------------------------
--	Author: Tenjou
-- 	Kopuro-Popuro
-- 	Changes dialogue during Mission 1-2.  Also has a simple trade quest.
--	Note: If you have Lower Jeuno quest The Kind Cardian activated and have not turned in the Ten of Cups (Card) to Apururu,you will not be able to activate this quest. After trading Ten of Cups (Card) to Apururu,you will then be able to begin this quest. 
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

 
--Mission Flags--
windymission = player:getVar("windurstMissions");
windyonetwo = player:getVar("theHeartOfTheMatter");
windyonetwoa = player:getVar("theHeartOf-ApururuCS");

--Quest Flags--
ctwothousand = player:getVar("theAllNewC2000");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (windymission == 12) then
--check status of Windurst Mission 1-2 --
	if (windyonetwo == 1 and windyonetwoa == 1) then
		player:startEvent(Event(0x8c));
	elseif (windyonetwo == 2) then
		player:startEvent(Event(0x8c));
	elseif (windyonetwo == 3) then
		player:startEvent(Event(0x93));
	else
		player:startEvent(Event(0x114));
	end
else
--check status of his quests--
	if (ctwothousand == 0) then
		--Offer quest--
		local event0x11d = Event(0x11d);
		event0x11d:setParams(0,0x358,0x34e,0x1110);
		player:startEvent(event0x11d);
	elseif (ctwothousand == 1) then
		--During quest--
		local event0x120 = Event(0x120);
		event0x120:setParams(0,0x358,0x34e,0x1110);
		player:startEvent(event0x120);
	elseif (ctwothousand == 2) then
		--After quest--
		player:startEvent(Event(0x125));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local ctwothousand = player:getVar("theAllNewC2000");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x358,1);
item2 = trade:hasItemQty(0x34e,1);
item3 = trade:hasItemQty(0x1110,1);
--print(item1,item2,item3);
if (ctwothousand == 1 and count == 3 and item1 == true and item2 == true and item3 == true) then
	--Complete quest,take items
	player:removeItem(0x358,1);
	player:removeItem(0x34e,1);
	player:removeItem(0x1110,1);
	local event0x124 = Event(0x124);
	event0x124:setParams(200);
	player:startEvent(event0x124);
	player:setVar("theAllNewC2000",2);
	--Give rewards
	player:addGil(GIL_RATE*200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
	player:addFame(2,WIN_FAME*40);
	--print("Windurst fame adjusted for",player:getName(),"by 40 (Total:",player:getFame(2),").");
	player:completeQuest(2,24);
	player:setTitle(136);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x11d and option == 3) then
	--Accept quest "The All-New C-2000."
	player:setVar("theAllNewC2000",1);
	player:addQuest(2,24);
end
end;