-----------------------------------
--	Author: Tenjou
-- 	Chamama
-- 	Starts and ends quest "In a Pickle."
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
local pickle = player:getVar("inaPickle");
if (pickle == 0) then
	player:startEvent(Event(0x28e));
elseif (pickle == 1 or pickle == 4) then
	local event0x28f = Event(0x28f);
	event0x28f:setParams(0,0x115c);
	player:startEvent(event0x28f);
elseif (pickle == 2) then
	player:startEvent(Event(0x294));
	player:setVar("inaPickle",3);
elseif (pickle == 3) then
	player:startEvent(Event(0x295));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local pickle = player:getVar("inaPickle");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x247,1);
if (pickle == 1 and count == 1 and item1 == true) then
	player:removeItem(0x247,1);
	math.randomseed(os.time());
	stone = math.random(); stone = math.random(); stone = math.random();
	--print("Stone:",stone);
	if (stone <= .66) then
		--quest failure
		local fail = math.random();
		--print("Fail:",fail);
		if (fail >= .5) then
			player:startEvent(Event(0x291));
		else
			player:startEvent(Event(0x292));
		end
	else
		--quest success
		local event0x293 = Event(0x293)
		event0x293:setParams(200,0x30d9);
		player:startEvent(event0x293);
		player:addItem(0x30d9);
		player:addGil(GIL_RATE*200);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
		player:setVar("inaPickle",2);
		player:addFame(2,WIN_FAME*30);
		--print("Windurst fame adjusted for",player:getName(),"by 40 (Total:",player:getFame(2),").");
		player:completeQuest(2,5);
	end
elseif (pickle == 4 and count == 1 and item1 == true) then
	player:removeItem(0x247,1);
	local stone = math.random();
	--print("Stone:",stone);
	if (stone <= .66) then
		--quest failure
		local fail = math.random();
		--print("Fail:",fail);
		if (fail >= .5) then
			player:startEvent(Event(0x291));
		else
			player:startEvent(Event(0x292));
		end
	else
		--quest success
		local event0x296 = Event(0x296)
		event0x296:setParams(200,0x30d9);
		player:startEvent(event0x296);
		player:addGil(GIL_RATE*200);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
		player:setVar("inaPickle",2);
		player:addFame(2,WIN_FAME*20);
		--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
	end
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x28e and option == 1) then
	--Accept quest "In a Pickle"
	player:setVar("inaPickle",1);
	player:addQuest(2,5);
elseif (csid == 0x295 and option == 1) then
	player:setVar("inaPickle",4);
end
end;