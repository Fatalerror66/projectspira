-----------------------------------
--	Author: ChrisKara10 & Almendro
--  Horatius
--  Give Quest "Breaking Stone" and also involved in "Lure of the Wildcats - Bastok"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end
              bflv = player:getFameLevel(1);
    BreakingStones = player:getQuestStatus(1,10);
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x01000);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x01000);
	player:startEvent(Event(0x64));
-- "Breaking Stone"
elseif(bflv>=2 and BreakingStones~=2 )then
	player:startEvent(Event(0x64));
else
	player:startEvent(Event(0x6E));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
DangrufStone = 0x229;
DangrufStone1 = trade:hasItemQty(DangrufStone,1);
count = trade:getItemCount();
  gil = trade:getGil(); 
BreakingStones = player:getQuestStatus(1,10);
if (BreakingStones~=0 and count == 1 and DangrufStone1 and gil == 0) then
	player:startEvent(Event(0x65));
	trade:isComplete();
end
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	if (csid == 0x64 and option == 0) then
		player:addQuest(1,10);
		player:setVar("BreakingStones",1);
	elseif(csid == 0x65)then
		BreakingStones = player:getQuestStatus(1,10);
		if(BreakingStones == 1)then
			player:completeQuest(1,10);
			player:addFame(1,BAS_FAME*100);
			player:addGil(GIL_RATE*400);
			player:specialMessage(GIL_OBTAINED,GIL_RATE*400);
		else
			player:addFame(1,BAS_FAME*50);
			player:addGil(GIL_RATE*400);
			player:specialMessage(GIL_OBTAINED,GIL_RATE*400);
		end
		player:setVar("BreakingStones",0); -- Deleting var from server
	end
end;