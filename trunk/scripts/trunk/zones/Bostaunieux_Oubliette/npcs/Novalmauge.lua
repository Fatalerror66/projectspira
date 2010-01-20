-----------------------------------
--	Author: Aly
-- 	NPC:	Novalmauge
--  Quest: 	The Rumor
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");
-----------------------------------
-- Initialization
beastVial = 930;
drainScroll = 4853;
------------------------------------
-- onTrigger Action
------------------------------------
function onTrigger(player,npc)
level = player:getMainLvl();
 fame = player:getFame(0);
Rumor = player:getQuestStatus(0,61);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if ((Rumor == 0) and (level >= 10) and (fame >= 3) and (player:getMissionStatus(0,03) >= 1)) or ((Rumor == 0) and (level >= 10) and (player:getMissionStatus(1,05) >= 1)) or ((Rumor == 0) and (level >= 10) and (player:getMissionStatus(2,05) >= 1)) then
	-- checks level, Sandy fame, and for rank 2 													-- checks level and Bastok's Mission_Level >=(2-3) for quest acceptance			-- checks level and Windy's Mission_Level >=(2-3) for quest acceptance
		player:startEvent(Event(0x0D));
	elseif(Rumor == 1) then
		player:startEvent(Event(0x0B));
	else
		player:startEvent(Event(0x0A));
	end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
	if (trade:hasItemQty(beastVial,1) == true and count == 1 and Rumor == 1) then
		event = Event(0xC);		-- gave Nova the beastVial
		event:setParams(1);
		trade:isComplete();
		player:startEvent(event);
	end
end; 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x0D and option == 0) then
	player:addQuest(0,61);
elseif (csid == 0xC) then
	player:addItem(drainScroll);
	player:specialMessage(ITEM_OBTAINED,drainScroll);
	player:completeQuest(0,61);
	player:addFame(0,SAN_FAME*30);
--elseif (csid == 0xC) then
--	player:additem(beastVial);
	end
end;