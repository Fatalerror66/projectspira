-----------------------------------
--	Author: Tenjou
-- 	Vera
-- 	Starts and ends quest "The Old Lady"
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
	player:startEvent(Event(0x85));
else
	lockout = player:getQuestStatus(4,24);
	if (SUBJOB_QUEST_LEVEL == 0 and lockout == 0) then
		player:addQuest(4,10);
		player:completeQuest(4,10);
	end		
	--Offer quest, if the player hasn't accepted Elder Memories in Selbina.
	subjobquest = player:getVar("theOldLady");
	if (subjobquest == 0 and player:getQuestStatus(4,10) == 0) then
		if (lockout ~= 0) then
			--Quest not available; accepted in Selbina.
			player:startEvent(Event(0x82));
		else
			--Offer quest.
			event0x83 = Event(0x83);
			event0x83:setParams(0x21e,0,0,0,0,0,0,0);
			player:startEvent(event0x83);
		end
	elseif (subjobquest == 1) then
		event0x84 = Event(0x84);
		event0x84:setParams(0x21e,0,0,0,0,0,0,0);
		player:startEvent(event0x84);
	elseif (subjobquest == 2) then
		event0x84 = Event(0x84);
		event0x84:setParams(0x21d,0,0,0,0,0,0,0);
		player:startEvent(event0x84);
	elseif (subjobquest == 3) then
		event0x84 = Event(0x84);
		event0x84:setParams(0x21c,0,0,0,0,0,0,0);
		player:startEvent(event0x84);
	else
		--After quest completion.
		player:startEvent(Event(0x8a));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
subjobquest = player:getVar("theOldLady");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x21e,1);
item2 = trade:hasItemQty(0x21d,1);
item3 = trade:hasItemQty(0x21c,1);
if (subjobquest == 1 and count == 1 and item1) then
	event0x87 = Event(0x87);
	event0x87:setParams(0x21d,0,0,0,0,0,0,0);
	player:startEvent(event0x87);
	player:removeItem(0x21e,1);
	player:addItem(0);
	player:setVar("theOldLady",2);
elseif (subjobquest == 2 and count == 1 and item2) then
	event0x88 = Event(0x88);
	event0x88:setParams(0x21c,0,0,0,0,0,0,0);
	player:startEvent(event0x88);
	player:removeItem(0x21d,1);
	player:addItem(0);
	player:setVar("theOldLady",3);
elseif (subjobquest == 3 and count == 1 and item3) then
	--Quest complete!
	player:startEvent(Event(0x89));
	player:removeItem(0x21c,1);
	player:completeQuest(4,10);
	--Rewards!
	player:unlockSubjobs();
	--Clean database.
	player:setVar("theOldLady",0);
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x83 and option == 40) then
	--Accept quest, lockout Selbina quest.
	player:setVar("subJobQuest-Lockout",1)
	player:setVar("theOldLady",1);
	player:addQuest(4,10);
end
end;