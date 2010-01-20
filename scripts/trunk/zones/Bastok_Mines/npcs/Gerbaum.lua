-----------------------------------
--	Author: ChrisKara10, Almendro
-- 	Gerbaum
--	"Minesweeper", Involved in Lost Check and in mission 6-1
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- Initialization
ZeruhnSoot = 0x230; -- 560
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
        Minesweeper = player:getQuestStatus(1,39);
Minesweeper_tempVar = player:getVar("Minesweeper_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (Minesweeper == 0 or Minesweeper_tempVar == 0) then
	player:startEvent(Event(0x6C));
else
	rand = math.random(1,2);
	if(rand == 1)then
		player:startEvent(Event(0x16));
	else
		player:startEvent(Event(0x17));
	end
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
        Minesweeper = player:getQuestStatus(1,39);
Minesweeper_tempVar = player:getVar("Minesweeper_tempVar");

ZeruhnSoot3 = trade:hasItemQty(ZeruhnSoot,3);
      count = trade:getItemCount();
        gil = trade:getGil();

if( (Minesweeper == 1 or Minesweeper_tempVar == 1) and ZeruhnSoot3 and count == 3 and gil == 0) then
	trade:isComplete();
	player:startEvent(Event(0x6D));
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid ==0x6C)then
	player:addQuest(1,39);
	player:setVar("Minesweeper_tempVar",1);
elseif(csid == 0x6D)then
	Minesweeper = player:getQuestStatus(1,39);
	if(Minesweeper == 1)then
		player:completeQuest(1,39);
		player:addFame(1,BAS_FAME*75);
		player:setTitle(98);
	else
		player:addFame(1,BAS_FAME*8);
	end
	player:addGil(GIL_RATE*150);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*150);
	player:setVar("Minesweeper_tempVar",0);
end
end;