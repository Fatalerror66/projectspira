-----------------------------------
--	Author: Almendro
-- 	Qiji
-- 	"Forever to Hold" Quest
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
bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(bflvl>=2 and ForevertoHold == 0)then
	player:startEvent(Event(0x7B));
elseif(ForevertoHold== 1 and player:getVar("ForevertoHold") == 3) then
	player:startEvent(Event(0x7E));
else
	-- General Text
	player:startEvent(Event(0x21));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
BrassHairpin = 0x30D1; -- 12497
BrassHairpin1 = trade:hasItemQty(BrassHairpin,1);
count = trade:getItemCount();
  gil = trade:getGil();
if( player:getVar("ForevertoHold") == 1 and count == 1 and BrassHairpin1 and gil == 0)then
	player:startEvent(Event(0x7C));
	player:setVar("ForevertoHold",2);
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x7B)then
	player:addQuest(1,17);
	player:setVar("ForevertoHold",1);
elseif(csid == 0x7E)then
	player:completeQuest(1,17);
	player:addFame(1,BAS_FAME*80);
	player:setTitle(89);
	player:addGil(GIL_RATE*300);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*300);
end
end;