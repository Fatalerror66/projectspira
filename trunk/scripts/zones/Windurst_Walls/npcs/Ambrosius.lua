-----------------------------------
--	Author: Tenjou
-- 	Ambrosius
-- 	Starts and ends quest "The Postman Always K.O.s Twice"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
require("scripts/zones/Windurst_Walls/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local mail = player:getVar("thePostmanAlwaysKOsTwice");
if (mail == 0) then
	player:startEvent(Event(0x30));
elseif (mail == 1) then
	player:startEvent(Event(0x31));
elseif (mail == 2 or mail == 3) then
	player:startEvent(Event(0x38));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
local mail = player:getVar("thePostmanAlwaysKOsTwice");
local mailquan = 0;
local reward = 0;
local wf = player:getFame(2);

item1 = trade:hasItemQty(0x248,1);
item2 = trade:hasItemQty(0x249,1);
item3 = trade:hasItemQty(0x24a,1);
item4 = trade:hasItemQty(0x24b,1);
if (item1) then mailquan = mailquan+1; player:removeItem(0x248,1); 
end
if (item2) then mailquan = mailquan+1; player:removeItem(0x249,1); 
end
if (item3) then mailquan = mailquan+1; player:removeItem(0x24a,1); 
end
if (item4) then mailquan = mailquan+1; player:removeItem(0x24b,1); 
end
reward = mailquan;


if (reward == 1 and count == 1) then
	if (mail == 1) then
		local event0x34 = Event(0x34);
		event0x34:setParams(50);
		player:startEvent(event0x34);
	elseif (mail == 2) then
		local event0x39 = Event(0x39);
		event0x39:setParams(50);
		player:startEvent(event0x39);
	end
	player:addGil(GIL_RATE*50);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*50);
	player:addFame(2,WIN_FAME*10);
	--print("Windurst fame adjusted for",player:getName(),"by 10 (Total:",player:getFame(2),").");
	player:setVar("thePostmanAlwaysKOsTwice",2);
	player:completeQuest(2,19);
elseif (reward == 2 and count == 2) then
	if (mail == 1) then
		local event0x35 = Event(0x35);
		event0x35:setParams(150,2);
		player:startEvent(event0x35);
	elseif (mail == 2) then
		local event0x3a = Event(0x3a);
		event0x3a:setParams(150);
		player:startEvent(event0x3a);
	end
	player:addGil(GIL_RATE*150);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*150);
	player:addFame(2,WIN_FAME*20);
	--print("Windurst fame adjusted for",player:getName(),"by 20 (Total:",player:getFame(2),").");
	player:setVar("thePostmanAlwaysKOsTwice",2);
	player:completeQuest(2,19);
elseif (reward == 3 and count == 3) then
	if (mail == 1) then
		local event0x36 = Event(0x36);
		event0x36:setParams(250,3);
		player:startEvent(event0x36);
	elseif (mail == 2) then
		local event0x3b = Event(0x3b);
		event0x3b:setParams(250);
		player:startEvent(event0x3b);
	end
	player:addGil(GIL_RATE*200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
	player:addFame(2,WIN_FAME*30);
	--print("Windurst fame adjusted for",player:getName(),"by 30 (Total:",player:getFame(2),").");
	player:setVar("thePostmanAlwaysKOsTwice",2);
	player:completeQuest(2,19);
elseif (reward == 4 and count == 4) then
	if (mail == 1) then
		local event0x37 = Event(0x37);
		event0x37:setParams(500);
		player:startEvent(event0x37);
	elseif (mail == 2) then
		local event0x3c = Event(0x3c);
		event0x3c:setParams(500);
		player:startEvent(event0x3c);
	end
	player:addGil(GIL_RATE*500);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*500);
	player:addFame(2,WIN_FAME*50);
	--print("Windurst fame adjusted for",player:getName(),"by 50 (Total:",player:getFame(2),").");
	player:setVar("thePostmanAlwaysKOsTwice",2);
	player:completeQuest(2,19);
end
end; 

 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x30 and option == 0) then
	--Accept quest "The Postman Always KOs Twice."
	player:setVar("thePostmanAlwaysKOsTwice",1);
	player:addQuest(2,19);
end
end;