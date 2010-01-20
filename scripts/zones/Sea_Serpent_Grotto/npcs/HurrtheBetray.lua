-----------------------------------
--	Author: Bababooey
-- 	Hurr the Betrayer (302.9, 27.7, 233.1)
-- 	Part of the Ornamented Door (Sahagin key) mini-quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
SahaginKeyCSBou=player:getVar("SahaginKeyCS-Bou");
SahaginKeyCSHurr=player:getVar("SahaginKeyCS-Hurr");
SahaginKeyQuest=player:getVar("SahaginKeyQuest");
SahaginKey = player:hasItem(1197);

if(SahaginKeyQuest ~= 1) then
	if (SahaginKeyCSBou ~= 1) then
		player:startEvent(Event(0x0068));
	else
			player:startEvent(Event(0x0069));
	end;
else
	player:startEvent(Event(0x006A));
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

--First time quest is 1 Norg Shell and 3 Mythril Beastcoins
--Subsequent quests is 1 Norg Shell and 1 Gold Beastcoin

count = trade:getItemCount();
beastcoin = trade:hasItemQty(749,3);
gbeastcoin = trade:hasItemQty(748,1);
norgshell = trade:hasItemQty(1135,1);
SahaginKeyQuest = player:getVar("SahaginKeyQuest");
SahaginKey = player:hasItem(1197);

--Not sure if it displays the item as received in the chat dialog
if (SahaginKey ~= 1) then
	if(SahaginKeyQuest ~= 1 and count == 4 and beastcoin and norgshell) or
		(SahaginKeyQuest == 1 and count == 2 and gbeastcoin and norgshell) then
		player:startEvent(Event(0x006B));
		player:addItem(1197);
		trade:isComplete();
		player:setVar("SahaginKeyQuest",1);
	end;
end;
end;

 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;