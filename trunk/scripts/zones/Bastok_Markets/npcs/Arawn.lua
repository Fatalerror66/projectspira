-----------------------------------
--  Author: ChrisKara10 & Almendro
--  Arawn
--  NPC that is involved with the quest "Stamp Hunt" & "Lure of the Wild Cat"(Almendro)
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------
-- Intilization
   StampSheet = 0x66;
LeatherGorget = 0x3319;
-----------------------------------
-----------------------------------
-- Documentation
--[[ "Stamp Hunt"
The 7 guards' bitmask is:

    * Bastok Markets 
001 	* Pavel D-11 (West Gate) 
    * Bastok Mines 
002     * Deadly Spider G-8 (2nd level of the Depot)
004     * Tall Mountain J-7 (Next to Alchemist Guild, guarding off limits area)
    * Metalworks 
008     * Romualdo K-9 (Southern Cannonry, near President's Office)
010     * Elayne G-8 (Stand between the elevators and face east, go down stairs to the temple) 
    * Port Bastok 
020     * Ehrhard G-5 (Standing on the northeast corner outside of Warehouse #1)
040     * Latifah J-8 (Just north of the Drawbridge) 

]]--
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-- Auxiliar function
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end

 BlueSentinelBadge = player:hasKeyItem(0x2E8);
      wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
          wildcatc = testflag(tonumber(wildcatcount),0x00800);

StampHunt = player:getQuestStatus(1,16);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	-- "Lure of the Wildcat (Bastok)"
	if(BlueSentinelBadge == 1 and wildcatc == false)then
		player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00800);
		player:startEvent(Event(0x1AD));
	-- "Stamp Hunt"
	elseif (StampHunt == 0) then
		player:startEvent(Event(0xE1));
	elseif (StampHunt == 1 and player:getVar("StampHunt-Counter") == 0x7F) then	
		player:startEvent(Event(0xE2));
	else
		player:startEvent(Event(0x72));
	end
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
if(csid == 0xE1)then
	player:addQuest(1,16);
	player:addKeyItem(StampSheet);
	player:specialMessage(KEYITEM_OBTAINED,StampSheet);
elseif(csid == 0xE2)then
	if(player:getFreeSlotCount(0)>=1) then	--Check if there is free space in the inventory
		player:addItem(LeatherGorget);
		player:specialMessage(ITEM_OBTAINED,LeatherGorget);
	    player:removeKeyItem(StampSheet);
		player:addFame(1,BAS_FAME*80);
		player:setTitle(88);
		player:completeQuest(1,16);
		player:setVar("StampHunt-Counter",0); -- Deletes variable from server
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,LeatherGorget);
	end
end
end;