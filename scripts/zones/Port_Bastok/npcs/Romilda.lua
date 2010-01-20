-----------------------------------
--	Author: Almendro
-- 	Romilda
-- 	"Forever to Hold" & "Till Death Do Us Part" Quests
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
ForevertoHold = player:getQuestStatus(1,17);
TillDeathDoUsPart = player:getQuestStatus(1,18);
bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl >= 3 and ForevertoHold == 2 and player:getVar("ForevertoHold") == 0 and TillDeathDoUsPart == 0)then
	player:startEvent(Event(0x80));
else
	player:startEvent(Event(0x22));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
BrassHairpin = 0x30D1; -- 12497
BrassHairpin1 = trade:hasItemQty(BrassHairpin,1);
CottonGloves = 0x31B1; -- 12721
CottonGloves1 = trade:hasItemQty(CottonGloves,1);
count = trade:getItemCount();
  gil = trade:getGil();
TillDeathDoUsPart = player:getQuestStatus(1,18);
if(player:getVar("ForevertoHold") == 2 and count == 1 and BrassHairpin1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0x7D));
	player:setVar("ForevertoHold",3);
elseif(TillDeathDoUsPart == 1 and count == 1 and CottonGloves1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0x81));
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x80)then
	player:addQuest(1,18);
elseif(csid == 0x81)then
	player:completeQuest(1,18);
	player:addFame(1,BAS_FAME*160);
	player:setTitle(90);
	player:addGil(GIL_RATE*2000);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*2000);
end
end;