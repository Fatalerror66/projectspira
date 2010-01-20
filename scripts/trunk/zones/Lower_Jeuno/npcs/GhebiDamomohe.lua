-----------------------------------
--	Author: Tenjou
-- 	Ghebi Damomohe
-- 	Involved in a few Tenshodo quests.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event0x6a = Event(0x6a);
--This event seems very complex and holds a range of CoP and Tenshodo quests in its arguments.
--Argument 1: Bitmask for her menu.
--Argument 2: Quest flags??
--Argument 3: Requested Item ID
tenshodo = player:getVar("tenshodoMembership");
if (tenshodo == 0) then
	event0x6a:setParams(4);
	player:startEvent(event0x6a);
elseif (tenshodo == 1) then
	event0x6a:setParams(0);
	player:startEvent(event0x6a);
elseif (tenshodo == 2) then
	tenshodoapp = player:getVar("tenshodoMe-Application");
	if (tenshodoapp == 0) then
		event0x6a:setParams(4);
		player:startEvent(event0x6a);
	elseif (tenshodoapp == 1) then
		--Complete Quest
		player:startEvent(Event(0x6b));
		player:setVar("tenshodoMembership",3);
		player:removeKeyItem(0x79);
		--Rewards
		player:addItem(0x224);
		player:addKeyItem(0x76);
	end
elseif (tenshodo == 3) then
	event0x6a:setParams(4);
	player:startEvent(event0x6a);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
tenshodo = player:getVar("tenshodoMembership");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x224,1);
--print("ITEM:",item1);
if (tenshodo ~= 3 and count == 1 and item1 == true) then
	player:startEvent(Event(0x6c));
	player:setVar("tenshodoMembership",3);
	--Forgot about fame lol
	player:addFame(3,NORG_FAME*30);
	--print(player:getName() .. "'s Norg fame raised by " .. (NORG_FAME*30) .. " (Total: " .. player:getFame(3) .. ").");
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
tenshodo = player:getVar("tenshodoMembership");
if (csid == 0x6a and option == 2 and tenshodo == 1) then
	player:setVar("tenshodoMembership",2);
end
end;