-----------------------------------
--	Author: Almendro
-- 	Raibaht
-- 	Basic Chat Text & "Lure of the Wildcat (Bastok)", "The Usual"
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
-----------------------------------
-- Initialization
SteamingSheepInvitation = 0x7F;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x00020);
	
	      TheUsual = player:getQuestStatus(1,27);
  TheUsual_tempVar = player:getVar("TheUsual_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00020);
	player:startEvent(Event(0x3A5));
-----------------------------------
-- "The Usual"
elseif(TheUsual == 1 and player:hasKeyItem(SteamingSheepInvitation) == 1)then
	player:startEvent(Event(0x1FE));	
	player:removeKeyItem(SteamingSheepInvitation);
	player:setVar("TheUsual_tempVar",3);
--------------------------------------
-- General chat text
else
	player:startEvent(Event(0x1F5));
end
--------------------------------------
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
--print("CSID:",csid);
--print("RESULT:",option);
end;