-----------------------------------
--	Author: ChrisKara10 & Almendro
--  Nbu Latteh	
--  Involved in the Quest "Mom The Adventurer?" & "The Signpost Marks the Spot"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
LetterfromRohLatteh = 0x6B
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bflvl = player:getFameLevel(1);
Has_LetterfromRohLatteh = player:hasKeyItem(LetterfromRohLatteh);
Seen_LetterfromRohLatteh = player:seenKeyItem(LetterfromRohLatteh);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
                MomTheAdventurer = player:getQuestStatus(1,21);
         TheSignpostMarkstheSpot = player:getQuestStatus(1,22);
        MomTheAdventurer_tempVar = player:getVar("MomTheAdventurer_tempVar");

-- Trigger the quest "Mom the Adventurer" --
if(MomTheAdventurer == 0) then
	player:startEvent(Event(0xE6));
	-- After getting Letter from her daughter and user opened the letter --
elseif(MomTheAdventurer == 1 and Has_LetterfromRohLatteh == 1 and Seen_LetterfromRohLatteh == 1) then
	player:startEvent(Event(0xEA));		
	-- After getting Letter from her daughter to complete the quest--
elseif(MomTheAdventurer == 1 and Has_LetterfromRohLatteh == 1) then
	player:startEvent(Event(0xE9));
elseif(MomTheAdventurer == 1)then
	player:startEvent(Event(0xE7));
elseif (MomTheAdventurer == 2)then
	-- Player is able to repeat the quest because of fame level
	if(bflvl < 2)then
		if(MomTheAdventurer_tempVar == 0)then
			player:startEvent(Event(0xE6));
		elseif(MomTheAdventurer_tempVar == 1)then
			player:startEvent(Event(0xE7));
		elseif(MomTheAdventurer_tempVar ==2 and Has_LetterfromRohLatteh == 1 and Seen_LetterfromRohLatteh == 1)then
			player:startEvent(Event(0xEA));	
		elseif(MomTheAdventurer_tempVar ==2 and Has_LetterfromRohLatteh == 1)then
			player:startEvent(Event(0xE9));
		else
			player:startEvent(Event(0x7F)); -- Default text
		end
	elseif(bflvl >= 2 and MomTheAdventurer_tempVar == 0 and TheSignpostMarkstheSpot == 0)then
	    -- Offers "The Signpost Marks the Spot"
		player:startEvent(Event(0xEB));
		player:addQuest(1,22); -- "The Signpost Marks the Spot"
	else
		player:startEvent(Event(0x7F)); -- Default text
	end
else
	player:startEvent(Event(0x7F)); -- Default text
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
MomTheAdventurer = player:getQuestStatus(1,21);
if(csid == 0xE6)then
	if(MomTheAdventurer == 0)then
		player:addQuest(1,21);
	end
	player:addItem(0x1000); -- receive Fire Crystal --
	player:specialMessage(ITEM_OBTAINED,0x1000);
	player:setVar("MomTheAdventurer_tempVar",1);
elseif(csid == 0xEA)then	
	if(MomTheAdventurer == 1)then
		player:completeQuest(1,21);
		player:addFame(1,BAS_FAME*85);
		player:setTitle(92); -- Ringbearer 
	else
		player:addFame(1,BAS_FAME*15);
	end
	player:removeKeyItem(LetterfromRohLatteh);
	player:setVar("MomTheAdventurer_tempVar",3);
	player:addGil(GIL_RATE*100);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*100);	
elseif(csid == 0xE9)then
	if(MomTheAdventurer == 1)then
		player:completeQuest(1,21);
		player:addFame(1,BAS_FAME*85);
		player:setTitle(92); -- Ringbearer 
	else
		player:addFame(1,BAS_FAME*15);
	end
	player:removeKeyItem(LetterfromRohLatteh);
	player:setVar("MomTheAdventurer_tempVar",3);
	player:addGil(GIL_RATE*200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*200);
	
end
end;