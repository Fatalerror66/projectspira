-----------------------------------
--	Author: Tenjou
-- 	Kohlo Lakolo
-- 	Starts several quests related to the Star Onion Brigade storyline.  For now,only the first two of at least seven quests will be added.
--	Level 5 is required for the second quest; fame level 2 is required for the third quest,and there may be other requirements.
--	NOTE: The fame rewards will need to be changed once more information is gathered.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

level = player:getMainLvl();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local onion = player:getVar("starOnionBrigadeQuests");
local oniontruth = player:getVar("truthJusticeAndTheOnionWay");
local onionknow = player:getVar("knowOnesOnions");
if (onion == 1) then
	--Check status of quest "Know One's Onions"
	if (onionknow == 0) then
		player:startEvent(Event(0x17b));
		player:setVar("knowOnesOnions",1);
	elseif (onionknow == 1 and level >= 5) then
		--Quest offered; events 0x183,0x184 and 0x185 would work too,but it is unclear how to decide which event to use.
		--NOTE: This quest may tie in with,or have a conflict with Windurst Mission 2-1.
		local event0x187 = Event(0x187);
		event0x187:setParams(0,0x1123);
		player:startEvent(event0x187);
		player:setVar("knowOnesOnions",2);
		player:addQuest(2,40);
	elseif (onionknow == 2) then
		--During part 1 of the quest
		local event0x188 = Event(0x188);
		event0x188:setParams(0,0x1123);
		player:startEvent(event0x188);
	elseif (onionknow == 3) then
		--During part 2 of the quest
		local event0x18f = Event(0x18f);
		event0x18f:setParams(0,0x1123);
		player:startEvent(event0x18f);
	elseif (onionknow == 4) then
		--End quest
		player:startEvent(Event(0x190));
		player:setVar("knowOnesOnions",5);
	elseif (onionknow == 5) then
		player:startEvent(Event(0x191));
	else
		player:startEvent(Event(0x17b));
	end
else
	--Check status of quest "Truth,Justice,and the Onion Way"
	if (oniontruth == 0) then
		--Quest not offered
		player:startEvent(Event(0x169));
		--There may be some other requirement,however it is unlikely.  It is unclear where to place the above event.
		player:setVar("truthJusticeAndTheOnionWay",1);
	elseif (oniontruth == 1) then
		--Offer quest
		player:startEvent(Event(0x170));
	elseif (oniontruth == 2) then
		--During quest
		player:startEvent(Event(0x173));
	elseif (oniontruth == 3) then
		--After quest
		player:startEvent(Event(0x17b));
		player:setVar("starOnionBrigadeQuests",1);
		--print("FAME:",player:getFame(2));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local oniontruth = player:getVar("truthJusticeAndTheOnionWay");
local onionknow = player:getVar("knowOnesOnions");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x115c,1);
item2 = trade:hasItemQty(0x1123,4);
if (oniontruth == 2 and count == 1 and item1) then
	--Complete quest "Truth,Justice,and the Onion Way"
	player:removeItem(0x115c,1);
	local event0x17a = Event(0x17a);
	event0x17a:setParams(0,0x115c,0x3325);
	player:startEvent(event0x17a);
	player:setVar("truthJusticeAndTheOnionWay",3);
	--Give rewards and fame
	player:addItem(0x3325);
	player:addFame(2,WIN_FAME*40);
	--print("Windurst fame adjusted for",player:getName(),"by 40 (Total:",player:getFame(2),").");
	player:completeQuest(2,36);
	player:setTitle(120);
elseif (onionknow == 2 and count == 4 and item2) then
	--Complete quest "Know One's Onions"
	player:removeItem(0x1123,4);
	local event0x18e = Event(0x18e);
	event0x18e:setParams(0,0x1123);
	player:startEvent(event0x18e);
	player:setVar("knowOnesOnions",3);
	--Give rewards and fame
	player:addItem(0x12f9);
	player:addFame(2,WIN_FAME*60);
	--print("Windurst fame adjusted for",player:getName(),"by 60 (Total:",player:getFame(2),").");
	player:completeQuest(2,40);
	player:setTitle(125);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x170) then
	if (option == 0 or option == nil) then
		--Accept quest "Truth, Justice, and the Onion Way."
		player:setVar("truthJusticeAndTheOnionWay",2);
		player:addQuest(2,36);
	end
end
end; 