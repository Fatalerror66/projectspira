-----------------------------------
--	Author: Tenjou
-- 	Sigismund
-- 	Starts and ends quest "To Catch a Falling Star."  There may be additional requirements to this quest,however it is unclear at this time.
--	NOTE: The fame rewards will need to be changed once more information is gathered.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
starfall = player:getVar("toCatchAFallingStar");
if (starfall == 0) then
--quest not offered
	player:startEvent(Event(0x165));
	player:setVar("toCatchAFallingStar",1);
elseif (starfall == 1) then
--offer quest
	local event0xc4 = Event(0xc4);
	event0xc4:setParams(0,0x222);
	player:startEvent(event0xc4);
	player:setVar("toCatchAFallingStar",2);
	player:addQuest(2,53);
elseif (starfall == 2) then
--during quest
	local event0xc5 = Event(0xc5);
	event0xc5:setParams(0,0x222);
	player:startEvent(event0xc5);
elseif (starfall == 3) then
--after quest
	player:startEvent(Event(0xc8));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local starfall = player:getVar("toCatchAFallingStar");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x222,1);
if (starfall == 2 and count == 1 and item1 == true) then
	--Complete quest
	player:startEvent(Event(0xc7));
	player:removeItem(0x222,1);
	player:setVar("toCatchAFallingStar",3);
	--Give reward and fame
	player:addItem(0x301c);
	player:addFame(2,WIN_FAME*40);
	--print("Windurst fame adjusted for",player:getName(),"by 40 (Total:",player:getFame(2),").");
	player:completeQuest(2,53);
end
end; 
 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;