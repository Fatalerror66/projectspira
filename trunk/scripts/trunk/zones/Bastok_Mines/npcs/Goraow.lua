-----------------------------------
--	Author: Almendro
-- 	Goraow
--	"Lure of the Wild Cat", "Vengeful Wrath"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- Initialization
QuadavHelm = 0x1F5; -- 501
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x10000);
	
	    VengefulWrath = player:getQuestStatus(1,32);
VengefulWrath_tempVar = player:getVar("VengefulWrath_tempVar");
	            bflvl = player:getFameLevel(1);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x10000);
	player:startEvent(Event(0x1FA));
elseif(bflvl >= 3 and VengefulWrath == 0)then
	player:startEvent(Event(0x6A));	
elseif(VengefulWrath == 2 and VengefulWrath_tempVar == 0)then
	player:startEvent(Event(0x6A));	
else
	-- General chat text
	player:startEvent(Event(0x69));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
        VengefulWrath = player:getQuestStatus(1,32);
VengefulWrath_tempVar = player:getVar("VengefulWrath_tempVar");
          QuadavHelm1 = trade:hasItemQty(QuadavHelm,1);
                count = trade:getItemCount();
	              gil = trade:getGil();

if((VengefulWrath == 1 or VengefulWrath_tempVar == 1) and QuadavHelm1 and count == 1 and gil == 0 )then
	trade:isComplete();
	player:startEvent(Event(0x6B));
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x6A)then
	VengefulWrath = player:getQuestStatus(1,32);
	if(VengefulWrath == 0)then
		player:addQuest(1,32);
	end
	player:setVar("VengefulWrath_tempVar",1);
elseif(csid == 0x6B)then
	VengefulWrath = player:getQuestStatus(1,32);
	if(VengefulWrath == 1)then
		player:completeQuest(1,32);
		player:addFame(1,BAS_FAME*120);
		player:setTitle(95);
	else
		player:addFame(1,BAS_FAME*12);
	end
	player:addGil(GIL_RATE*900);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*900);
	player:setVar("VengefulWrath_tempVar",0); -- Deletes from server
end
end;