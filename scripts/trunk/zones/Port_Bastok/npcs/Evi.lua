-----------------------------------
--	Author: Almendro
-- 	Evi
-- 	"Past Perfect"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
TatteredMissionOrders = 0x6D;
ScaleMail = 0x3110;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
PastPerfect = player:getQuestStatus(1,23);
bflvl = player:getFameLevel(1);
Has_TatteredMissionOrders = player:hasKeyItem(TatteredMissionOrders);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 2 and PastPerfect == 0)then
	player:startEvent(Event(0x82));
	player:addQuest(1,23);
elseif(PastPerfect == 1 and Has_TatteredMissionOrders ==1)then
	player:startEvent(Event(0x83));
elseif(PastPerfect == 1)then
	player:startEvent(Event(0x68));
else
	player:startEvent(Event(0x15));
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
if(csid == 0x83)then
	player:completeQuest(1,23);
	player:removeKeyItem(TatteredMissionOrders);
	player:addFame(1,BAS_FAME*110);
	player:addItem(ScaleMail);
	player:specialMessage(ITEM_OBTAINED,ScaleMail);
end
end;