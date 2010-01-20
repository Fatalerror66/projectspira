-----------------------------------
--	Author: ChrisKara10 & Almendro
-- 	Elki
--	Quest "Hearts of Mythril" and "The Eleventh's Hour"
--	http://wiki.ffxiclopedia.org/wiki/Hearts_of_Mythril
--	http://wiki.ffxiclopedia.org/wiki/The_Eleventh%27s_Hour
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
-- Items
BouquetforthePioneers = 0x17;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
            bflv = player:getFameLevel(1);
 HeartsofMythril = player:getQuestStatus(1,6);
TheEleventhsHour = player:getQuestStatus(1,7);
      oldtoolbox = player:hasKeyItem(0x18);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (HeartsofMythril ~= 2) then
	if(HeartsofMythril == 0) then
		player:startEvent(Event(0x29));	
	elseif (HeartsofMythril == 1 and player:getVar("heartsOfMythril") == 2) then
		player:startEvent(Event(0x2A));
	end
elseif (HeartsofMythril == 2 and bflv >= 3 and TheEleventhsHour ~= 2 ) then
	if(TheEleventhsHour == 0) then
		player:startEvent(Event(0x2B));
    elseif(TheEleventhsHour == 1 and player:hasKeyItem(0x18) == 1 ) then
		player:startEvent(Event(0x2C));
		player:setVar("TheEleventhsHour",3);
	end
else	
	player:startEvent(Event(0x1F));
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
if(csid == 0x29)then
	player:setVar("heartsOfMythril",1);
	player:addKeyItem(0x17);
	player:addQuest(1,6);
elseif(csid == 0x2A) then
	player:addItem(0x3228);
	player:specialMessage(ITEM_OBTAINED,0x3228);
	player:setVar("heartsOfMythril",0);
	player:completeQuest(1,6);
	player:setTitle(84);
	player:addFame(1,BAS_FAME*80);
elseif(csid == 0x2B and option == 1) then
	player:addQuest(1,7);
	player:setVar("TheEleventhsHour",1);
end
end;