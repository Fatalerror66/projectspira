-----------------------------------
--	Author: ChrisKAra10
-- 	Ken/Marin
--	Involved in the quest "All by myself" Incomplete due to lock of functions	
-----------------------------------
-- *07/12/2009 - Almendro: quest "All by myselft" partially scripted
-- *07/13/2009 - Almendro: Added Bastok fame and modified gil reward to reflect GIL_RATE too. Corrected the LogID
-- *07/15/2009 - Almendro: Corrected some dialog events.
-- to be done:
--    * Verify the right order of dialogs after choosing diferent options with live version.
--    * Do this quest so it can be repeated after each tally.
--    * Do the Marin script in Dangruf Wadi.
--    * 0x16A - Unknown localization of the event
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

bflvl = player:getFameLevel(1); -- Bastok
--print("Fama bastok:",bflvl);
allbymyself = player:getVar("AllByMyself");
kensscortreward = player:hasKeyItem(0x3e1);
if(bflvl >= 2) then
	if (allbymyself == 0) then
		player:startEvent(Event(0x169));
	elseif (allbymyself == 1) then
		Rand = math.random();
		if(Rand >= 0.5) then
			player:startEvent(Event(0x16B));
		else
			player:startEvent(Event(0x16A));
		end
	elseif (allbymyself == 2) then
		if(kensscortreward == 1) then 
			player:startEvent(Event(0x16C));
		else
			player:startEvent(Event(0x16D));
		end
	else
	-- Player has already completed the quest
				
	end
else
	-- You don't have enough bastok fame
	player:startEvent(Event(0x16E));	
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
--print("CSID:",csid);
--print("RESULT:",option);
-- Refuse on the second menu saying "I don't like kids"
if (csid == 0x169 and option == 2) then	
	player:setVar("AllByMyself",1);
end
-- Acepting the quest normally
if (csid == 0x169 and option == 1) then	
	player:setVar("AllByMyself",2);
	player:addQuest(1,76);
end
-- Acepting quest after refusing.
if (csid == 0x16A and option == 1) then	
	player:setVar("AllByMyself",2);
	player:addQuest(1,76);
end
-- Acepting quest after refusing.
if (csid == 0x16B and option == 1) then	
	player:setVar("AllByMyself",2);
	player:addQuest(1,76);
end
if (csid == 0x16D and option == 1) then	
	player:setVar("AllByMyself",0);
	-- player:setQuestStatus(1,79,0) function not implemented. Abandon the quest
end
-- Quest Complete 
if (csid == 0x16C) then
	player:removeKeyItem(0x3e1);
	player:completeQuest(1,76);
	player:setVar("AllByMyself",3);
	player:addGil(GIL_RATE*1500);
	player:addFame(1,BAS_FAME*80);
	player:specialMessage(21,GIL_RATE*1500);
end
end;