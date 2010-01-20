-----------------------------------
--	Author: Tenjou
-- 	Isacio
-- 	Starts and ends quest "Elder Memories"
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
level = player:getMainLvl();
if (level < SUBJOB_QUEST_LEVEL) then
	player:startEvent(Event(0x77));
else
	lockout = player:getQuestStatus(4,10);
	if (SUBJOB_QUEST_LEVEL == 0 and lockout == 0) then
		player:addQuest(4,24);
		player:completeQuest(4,24);
	end	
	--Offer quest, if the player hasn't accepted The Old Lady in Mhaura.
	subjobquest = player:getVar("elderMemories");
	if (subjobquest == 0 and player:getQuestStatus(4,24) == 0) then
		if (lockout ~= 0) then
			--Quest not available; accepted in Mhaura.
			player:startEvent(Event(0x6e));
		else
			--Offer quest.
			event0x6f = Event(0x6f);
			event0x6f:setParams(0x21b,0,0,0,0,0,0,0);
			player:startEvent(event0x6f);
		end
	elseif (subjobquest == 1) then
		event0x70 = Event(0x70);
		event0x70:setParams(0x21b,0,0,0,0,0,0,0);
		player:startEvent(event0x70);
	elseif (subjobquest == 2) then
		event0x70 = Event(0x70);
		event0x70:setParams(0x21a,0,0,0,0,0,0,0);
		player:startEvent(event0x70);
	elseif (subjobquest == 3) then
		event0x70 = Event(0x70);
		event0x70:setParams(0x219,0,0,0,0,0,0,0);
		player:startEvent(event0x70);
	else
		--After quest completion.
		player:startEvent(Event(0x76));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
subjobquest = player:getVar("elderMemories");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x21b,1);
item2 = trade:hasItemQty(0x21a,1);
item3 = trade:hasItemQty(0x219,1);
if (subjobquest == 1 and count == 1 and item1) then
	event0x73 = Event(0x73);
	event0x73:setParams(0x21a,0,0,0,0,0,0,0);
	player:startEvent(event0x73);
	player:removeItem(0x21b,1);
	player:addItem(0);
	player:setVar("elderMemories",2);
elseif (subjobquest == 2 and count == 1 and item2) then
	event0x74 = Event(0x74);
	event0x74:setParams(0x219,0,0,0,0,0,0,0);
	player:startEvent(event0x74);
	player:removeItem(0x21a,1);
	player:addItem(0);
	player:setVar("elderMemories",3);
elseif (subjobquest == 3 and count == 1 and item3) then
	--Quest complete!
	player:startEvent(Event(0x75));
	player:removeItem(0x219,1);
	player:completeQuest(4,24);
	--Rewards!
	player:unlockSubjobs();
	--Clean database.
	player:setVar("elderMemories",0);
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x6f and option == 40) then
	--Accept quest, lockout Mhaura quest.
	player:setVar("subJobQuest-Lockout",1)
	player:setVar("elderMemories",1);
	player:addQuest(4,24);
end
end;