-----------------------------------
--       Author: Tenjou
--          NPC: Chumimi
-- Descripction: Gives BLM AF quests.  Her role in these quests should be complete.  i.e. if you give yourself the items,the quests should work with her.
--------------------------------------
-- Modifications:
--  * 07/11/2009
--      Almendro: Added some special messages: "Obtained X item" to onEventfinish
-- To be done: 
--      the interaction with "???" in toraimarai canal
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
 
local blmaf = player:getVar("blackMageArtifactQuests");
local blmafone = player:getVar("theThreeMagi");
local blmaftwo = player:getVar("recollections");
local blmafthree = player:getVar("theRootOfTheProblem");
local blmafthrees = player:getVar("theRootOfT-KoruMoruCS");
local blmafthreed = player:getVar("theRootOfTheProblemPartII");
job = player:getMainJob();
level = player:getMainLvl();
--Check which AF quest the player is on,if any,and which step of the quest they are on.--
if (blmaf == 1) then
	if (blmafone == 1) then
		local event0x105 = Event(0x105);
		event0x105:setParams(0,0,0,0,0,0x450);
		player:startEvent(event0x105);
	elseif (blmafone == 2 or blmafone == 3) then
		player:startEvent(Event(0x10c));
	else
		player:startEvent(Event(0x103));	
	end
elseif (blmaf == 2) then
	if (blmaftwo == 0) then
		if (job == 4 and level >= 50) then
			--Offer BLM AF2 quest-- 
			local event0x10e = Event(0x10e);
			event0x10e:setParams(0x451,0x451,0x451,0x451);
			player:startEvent(event0x10e);
			player:setVar("recollections",1);
			player:addQuest(2,67);
		else
			if (math.random() > 0.5) then
				player:startEvent(Event(0x10c));
			else
				player:startEvent(Event(0x103));
			end
		end
	elseif (blmaftwo == 1) then
		player:startEvent(Event(0x110));
	elseif (blmaftwo == 2) then
		local doll = player:hasKeyItem(0xb5);
		if (doll ~= 1) then
			player:startEvent(Event(0x111));
		else
			player:startEvent(Event(0x113));
			player:removeKeyItem(0xb5);
			--Complete quest,reward player--
			player:addItem(0x370c);
			player:setVar("recollections",3);
			player:completeQuest(2,67);
			player:addFame(2,WIN_FAME*AF2_FAME);
			--Unlock BLM AF3--
			player:setVar("blackMageArtifactQuests",3);
			player:setVar("theRootOfTheProblem",0);
		end
	elseif (blmaftwo == 3) then
		player:startEvent(Event(0x112));
	end
elseif (blmaf == 3) then
	if (blmafthree == 0) then
		if (job == 4 and level >= 50) then
			local event0x114 = Event(0x114);
			event0x114:setParams(0,0x33d);
			player:startEvent(event0x114);
			player:setVar("theRootOfTheProblem",1);
			player:addQuest(2,68);
		else
			if (math.random() > 0.5) then
				player:startEvent(Event(0x112));
			else
				player:startEvent(Event(0x103));
			end
		end
	elseif (blmafthree == 1) then
		if (blmafthrees == 1) then
			if (blmafthreed == 1) then
				player:startEvent(Event(0x118));
			else
				player:startEvent(Event(0x117));
				player:addKeyItem(0xb4);
				player:setVar("theRootOfTheProblemPartII",1);
			end
		else
			local event0x115 = Event(0x115);
			event0x115:setParams(0,0x33d);
			player:startEvent(event0x115);
		end
	elseif (blmafthree == 2) then
		local event0x119 = Event(0x119);
		event0x119:setParams(0xb6,0xb6,0xb6,0xb6,0xb6,0xb6,0xb6,0xb6);
		player:startEvent(event0x119);
		--Complete BLM AF3, reward player--
		player:addItem(0x3620);
		player:setVar("theRootOfTheProblem",3);
		player:completeQuest(2,68);
		player:setTitle(222);
		player:addFame(2,WIN_FAME*AF3_FAME);
	elseif (blmafthree == 3) then
		player:startEvent(Event(0x11a));
	end
else
	--try to start BLM AF1
	if (job == 4 and level >= 40) then
		local event0x104 = Event(0x104);
		event0x104:setParams(0,0x265,0,0,0x246,0x450);
		player:startEvent(event0x104);
		player:setVar("theThreeMagi",1);
		player:setVar("blackMageArtifactQuests",1);
		player:addQuest(2,66);
	else
		player:startEvent(Event(0x103));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local blmafone = player:getVar("theThreeMagi");
local blmaftwo = player:getVar("recollections");
local blmafthree = player:getVar("theRootOfTheProblem");
count = trade:getItemCount();
item1 = trade:hasItemQty(0x450,1);
item2 = trade:hasItemQty(0x451,1);
item3 = trade:hasItemQty(0x33d,1);
--Complete BLM AF1---
if (blmafone == 1 and item1 and count == 1) then
	trade:isComplete();
	--Complete quest,reward player.--
	local event0x10d = Event(0x10d);
	event0x10d:setParams(0x440f);
	player:startEvent(event0x10d);
	player:addItem(0x440f);
	player:setVar("theThreeMagi",3);
	player:completeQuest(2,66);
	player:addFame(2,WIN_FAME*AF1_FAME);
	--Unlock BLM AF2.--
	player:setVar("blackMageArtifactQuests",2);
	player:setVar("recollections",0);
elseif (blmaftwo == 1 and count == 1 and item2) then
	trade:isComplete();
	player:startEvent(Event(0x10f));
	player:setVar("recollections",2);
elseif (blmafthree == 1 and item3 and count == 1) then
	player:startEvent(Event(0x116));
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x104) then
	if (option == 1) then
		player:setTitle(187);
	elseif (option == 2) then
		player:setTitle(188);
	elseif (option == 3) then
		player:setTitle(189);
	end
elseif (csid == 0x10d) then
	player:specialMessage(761,0x440f);
elseif (csid == 0x113) then
	player:specialMessage(761,0x370c);
elseif (csid == 0x117) then
	player:specialMessage(764,0xb4);
elseif (csid == 0x119) then
	player:specialMessage(761,0x3620)
end
end;