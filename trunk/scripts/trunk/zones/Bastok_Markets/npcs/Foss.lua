-----------------------------------
--	Author: ChrisKara10 & Almendro
--	Foss
--	"Buckets of Gold"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Initialization
RustyBucket = 0x5A; -- 90
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
BucketsofGold = player:getQuestStatus(1,41);	
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(BucketsofGold == 0) then
	player:startEvent(Event(0x10F));
elseif(BucketsofGold ~= 0) then
	player:startEvent(Event(0x10E));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
        count = trade:getItemCount();
          gil = trade:getGil();
BucketsofGold = player:getQuestStatus(1,41);
 RustyBucket5 = trade:hasItemQty(RustyBucket,5);
if (RustyBucket5 and count == 5 and gil == 0 and BucketsofGold ~= 0) then 
	trade:isComplete();
	player:startEvent(Event(0x110));
end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
BucketsofGold = player:getQuestStatus(1,41);
if (csid == 0x10F and option == 0) then
	player:addQuest(1,41);
elseif(csid == 0x110)then
	if(BucketsofGold == 1)then
		player:completeQuest(1,41);
		player:addFame(1,BAS_FAME*50);
	else
		player:addFame(1,BAS_FAME*5);
	end
	player:addGil(GIL_RATE*300);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*300);
end
end;