-----------------------------------
--	Author: Aly
-- 	NPC:	Helbort
-- 	Quest:  A Purchase 0f Arms
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- Initialize
order = 0x61;
receipt = 0x62;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	 fame = player:getFame(0);
ArmsPurch = player:getQuestStatus(0,27);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (ArmsPurch == 0 and fame >= 2) then
		player:startEvent(Event(0x252));		-- start weaponsOrder quest
	else
		player:startEvent(Event(ox251));
	end
end;
-----------------------------------
-- OnTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then
		player:specialMessage(1488);
	end

end;

--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x252 and option == 0) then
	player:addKeyItem(order);		-- receive weaponsOrder
	player:specialMessage(KEYITEM_OBTAINED,order);
	player:addQuest(0,27);
elseif (csid == 0x25F) then
	player:removeKeyItem(receipt);
	player:addItem(elmStaff);		-- receive elm staff
	player:specialMessage(ITEM_OBTAINED,elmStaff);
	player:completeQuest(0,27);
	player:setTitle(73);  			-- "Arms Trader"
	player:addFame(0,SAN_FAME*30);
	end
end;
