-----------------------------------
--  Author: ChrisKara10 & Almendro
--  Michea
--  Start Quest "The Elvaan Goldsmith",also involved in Quest"Father Figure & Distant Loyalties" and Bastok Mission "1-3  & 9-2"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bf = player:getFame(1);
bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
TheElvaanGoldsmith = player:getQuestStatus(1,13);
	 FatherFigure  = player:getQuestStatus(1,29);
  DistantLoyalties = player:getQuestStatus(0,74);
--goldsmithorder = player:hasKeyItem(0xA7);
if( bflvl<2 or TheElvaanGoldsmith ~=2 )then
	if ( TheElvaanGoldsmith ==0 ) then
		player:startEvent(Event(0xD7)); -- Active the quest "The Elvaan Goldsmith"
	else
		player:startEvent(Event(0x7D)); -- General text
	end
elseif( bflvl >= 2 and FatherFigure == 0 and DistantLoyalties ~= 1) then
	player:startEvent(Event(0xF0)); -- Active the quest "Father Figure"
else
	player:startEvent(Event(0x7D));
end
end; 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
TheElvaanGoldsmith = player:getQuestStatus(1,13);
     FatherFigure  = player:getQuestStatus(1,29);
--  DistantLoyalties = player:getQuestStatus(0,74);
             count = trade:getItemCount();
               gil = trade:getGil();

 CopperIngot = 0x288; -- 648
CopperIngot1 = trade:hasItemQty(CopperIngot,1);
 SilverIngot = 0x2E8; -- 744
SilverIngot1 = trade:hasItemQty(SilverIngot,1);


if(CopperIngot1 and count == 1 and gil == 0 and ( TheElvaanGoldsmith ~=0 or FatherFigure == 2 ))then
	trade:isComplete();
	player:startEvent(Event(0xD8));
elseif(SilverIngot1 and count == 1 and gil == 0 and FatherFigure == 1 )then
	trade:isComplete();
	player:startEvent(Event(0xF1));
end
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xD7)then
	player:addQuest(1,13);
elseif(csid == 0xD8)then
	TheElvaanGoldsmith = player:getQuestStatus(1,13);
	if(TheElvaanGoldsmith == 1)then
		player:completeQuest(1,13);
		player:addFame(1,BAS_FAME*100);
	else
		player:addFame(1,BAS_FAME*10);
	end
	player:addGil(GIL_RATE*180);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*180);
elseif(csid == 0xF0)then
	player:addQuest(1,29);
elseif(csid == 0xF1)then
	player:completeQuest(1,29);
	player:addFame(1,BAS_FAME*120);
	player:addGil(GIL_RATE*2200);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*2200);
end
end;