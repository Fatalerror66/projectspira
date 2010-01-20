-----------------------------------
--	Author: ReaperX
-- 	Cermet Door for Bastok Ambassador  
-- 	Bastok Mission 3.3 "Jeuno"
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

KeyitemDelkfuttKey = 0x457;
ItemDelkfuttKey = 0x225;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(1,12) == 1) and (player:getVar("mission_status") == 3) and (player:hasKeyItem(KeyitemDelkfuttKey) == 0) then
  player:specialMessage(159);
elseif (player:getMissionStatus(1,12) == 1) and (player:getVar("mission_status") == 3) and (player:hasKeyItem(KeyitemDelkfuttKey) == 1) then
	player:startEvent(Event(1)); -- saving Bastok ambassador 
else
  player:specialMessage(160);
end
if (player:getVar("mission_status") == 4) and (DEBUG_MODE) then
	toRuLudeEmbassyArea(player)
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 1) and (trade:hasItemQty(ItemDelkfuttKey,1)) and (player:getMissionStatus(1,12) == 1) and (player:getVar("mission_status") == 3) then
  trade:isComplete();
  player:startEvent(Event(1)); -- saving Bastok ambassador 
else 
  player:specialMessage(162);
end

end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 1) then
	if (player:hasKeyItem(KeyitemDelkfuttKey) == 0) then
		player:specialMessage(KEYITEM_OBTAINED, KeyitemDelkfuttKey);
		player:addKeyItem(KeyitemDelkfuttKey);
	end;
  player:setVar("mission_status",4);
  if (DEBUG_MODE) then
		player:setPos(0, 7, -23, 63, 0xF3);
	end;
end
end;