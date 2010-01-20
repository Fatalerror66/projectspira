-----------------------------------
--	Author: Arcanedemon, Bababooey
-- 	Laisrean
-- 	Sahagin Stash Quest NPC
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
norgfame = player:getFameLevel(3);
joblevel = player:getMainLvl();
sahaginStash = player:getQuestStatus(5,136)
sahaginStatue = player:hasKeyItem(296);
local freeslots = player:getFreeSlotCount(0);
pendingitem = player:getVar("Laisrean-pendingitem");

--print("Free slots:",freeslots);
--print("Pending item:",pendingitem);

--Check to see if a reward from quest is pending
--because inventory was full before.
if(freeslots > 0 and pendingitem == 1) then
	player:specialMessage(ITEM_OBTAINED,4946);
	player:addItem(4946);
	player:setVar("Laisrean-pendingitem",0);
else

if(norgfame >=4 and joblevel >= 5 and sahaginStash == 0) then
	player:startEvent(Event(0x0021));
elseif(sahaginStash == 1 and sahaginStatue == 0) then
	player:startEvent(Event(0x0022));
elseif(sahaginStash == 1 and sahaginStatue == 1) then
	player:startEvent(Event(0x0023));
else
	player:startEvent(Event(0x0053));
end;
end; 
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

if(csid == 0x21 and option == 1) then
	player:addQuest(5,136);
elseif(csid == 0x23) then
	player:completeQuest(5,136);
	player:removeKeyItem(296);
	player:setTitle(269);
	--Not sure if this is the amount of fame received for doing this quest
	player:addFame(3,NORG_FAME*17);
	
	local freeslots = player:getFreeSlotCount(0);
	if(freeslots > 0) then
		player:specialMessage(ITEM_OBTAINED,4946);
		player:addItem(4946);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,4946);
		player:setVar("Laisrean-pendingitem",1);
	end;
end;
end;