-- Auto-Generated Script from FFXImonV3 
-- By: Jax  
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
function onTrigger(player,npc)
RoseltheArmorer = player:getQuestStatus(0,2);
Reciept = 0x0077;
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (RoseltheArmorer == 1 and player:getVar("DeliveredtoGuilerme") == 1) then
		player:startEvent(Event(0x01fb));
	end
end;
----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	end 
end; 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x01fb and option == 0) then
		player:setVar("DeliveredtoGuilerme",2)
		player:setVar("Prince",1);
		player:removeKeyItem(Reciept);
	elseif (csid == 0x01fb and option == 1) then
		player:setVar("DeliveredtoGuilerme",2)
		player:setVar("Prince",2)
		player:removeKeyItem(Reciept);
	end
end;