-----------------------------------
--	Author: ChrisKara10 & Almendro
-- 	Roh Latteh
--	"The Signpost Marks the Spot" & "Mom The Adventurer?"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- Initialization
LetterfromRohLatteh = 0x6B
LinenRobe = 0x3139;
Paintingofawindmil = 0x6C;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
TheSignpostMarkstheSpot = player:getQuestStatus(1,22);
Has_Paintingofawindmil = player:hasKeyItem(Paintingofawindmil);

if (TheSignpostMarkstheSpot == 1 and Has_Paintingofawindmil == 1) then
	player:startEvent(Event(0x60));
else
	player:startEvent(Event(0x1D));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
MomTheAdventurer_tempVar = player:getVar("MomTheAdventurer_tempVar");
MomTheAdventurer = player:getQuestStatus(1,21);
CopperRing = 0x348E; -- 13454
CopperRing1 = trade:hasItemQty(CopperRing,1);
count = trade:getItemCount();
gil = trade:getGil();

if (CopperRing1 and count == 1 and gil == 0 and ( MomTheAdventurer_tempVar == 1 or MomTheAdventurer == 1)) then
	trade:isComplete();
	player:startEvent(Event(0x5F));
end
end;  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x5F)then
	player:addKeyItem(LetterfromRohLatteh);
	player:specialMessage(KEYITEM_OBTAINED,LetterfromRohLatteh);
	player:setVar("MomTheAdventurer_tempVar",2);
elseif(csid == 0x60)then
	player:completeQuest(1,22);
	player:removeKeyItem(Paintingofawindmil);
	player:addFame(1,BAS_FAME*180);
	player:setTitle(96); -- Treasure Scavenger 
	player:addItem(LinenRobe);
	player:specialMessage(ITEM_OBTAINED,LinenRobe);
end
end;