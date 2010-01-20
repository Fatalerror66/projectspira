-----------------------------------
--	Author: Aly
-- 	NPC:	Taumila
-- 	Quest:  Tiger's Teeth
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- Initialize
BTigerFang = 884;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    level = player:getMainLvl();
	 fame = player:getFame(0);
TigerTeeth = player:getQuestStatus(0,23);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (TigerTeeth == 0 and level >= 20 and fame >= 3) then
		player:startEvent(Event(0x23E));		-- start of fang quest
	elseif (TigerTeeth == 1 and player:getVar("repeat") == 0) then
		player:startEvent(Event(0x23F));		-- forgot your quest?
	elseif (player:getVar("repeat") == 1) then
		player:startEvent(Event(0x23B));		-- want more fangs

 end
end;
-----------------------------------
-- OnTrade Action
-----------------------------------

function onTrade(player,npc,trade)
count = trade:getItemCount();
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then
		player:specialMessage(1488);
	elseif (trade:hasItemQty(BTigerFang,3) == true and count == 3 and TigerTeeth == 1) then
		event = Event(0x23C);
		event:setParams(1);
		trade:isComplete();
		player:startEvent(event);
	elseif (trade:hasItemQty(BTigerFang,3) == true and count == 3 and player:getVar("repeat") == 1) then
		event = Event(0x23C);
		event:setParams(1);
		trade:isComplete();
		player:startEvent(event);
	end

end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x23E and option == 0) then
	player:addQuest(0,23); 
elseif (csid == 0x23C) then
	player:completeQuest(0,23);
	player:setTitle(61);  		-- "Fang Finder"
	player:addGil(GIL_RATE*2100);
	player:specialMessage(GIL_OBTAINED,2100);
	player:addFame(0,SAN_FAME*3);
	player:setVar("repeat",1);
end
end;

--------------------------------------
-- Self defined function that will be triggered on event 0x80073 finish.
--------------------------------------
function onEventXFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);


-- Used outside ALL loops to release NPC after event to prevent freezing. REQUIRED FUNCTION
--player:sendRelease()

end;

