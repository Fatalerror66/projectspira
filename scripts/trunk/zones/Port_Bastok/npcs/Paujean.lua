-----------------------------------
--	Author: Almendro
-- 	Paujean
-- 	"Silence of the Rams" & "Lure of the Wildcat (Bastok)"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
RampagingHorn = 0x38F; -- 911
LumberingHorn = 0x38E; -- 910
   PurpleBelt = 0x3391;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x00004);
  SilenceoftheRams = player:getQuestStatus(1,48);
			 nflvl = player:getFameLevel(3);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00004);
	player:startEvent(Event(0x163));
elseif(SilenceoftheRams == 0 and nflvl >= 2)then
	player:startEvent(Event(0xC3));
	player:addQuest(1,48);
else
	player:startEvent(Event(0x19));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	SilenceoftheRams = player:getQuestStatus(1,48);
	RampagingHorn1 = trade:hasItemQty(RampagingHorn,1);
	LumberingHorn1 = trade:hasItemQty(LumberingHorn,1);
	count = trade:getItemCount();
	gil = trade:getGil(); 
if(SilenceoftheRams == 1 and RampagingHorn1 and LumberingHorn1 and count == 2 and gil == 0)then	
	trade:isComplete();
	player:startEvent(Event(0xC4));	
end
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xC4)then
	player:completeQuest(1,48);
	player:addItem(PurpleBelt);
	player:specialMessage(ITEM_OBTAINED,PurpleBelt);
	player:addFame(1,BAS_FAME*190);
	player:setTitle(106); -- Purple Belt
end
end;