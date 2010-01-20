-----------------------------------
--	Author: ChrisKara10 & Almendro
-- 	Detzo
--	Quest "Rivals" also involved in other quest and mission.
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

--[[ 		Detzo events

0001 New Adventurer CS
001E default response, about Gumbah
005D CS for quest "Rivals"
005E final CS for quest "Rivals" 
00AB 2nd CS for "The Talekeeper's Gift" (WAR AF3)
03F2 To The Forsaken Mines Final CS (Bastok Mines version)
00B0 final CS for 8-2
00B4 first CS for 6.2
00B8 reacts to Gumbah being the Talekeeper, after obtaining rank 9
--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
bflvl = player:getFameLevel(1);
Rivals = player:getQuestStatus(1,20);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (bflvl >= 3 and Rivals == 0) then
	player:startEvent(Event(0x5D));
	player:addQuest(1,20);
elseif (player:getNation() == 1) and (player:getRank() >=9) then
  player:startEvent(Event(0xB8));
else	
	player:startEvent(Event(0x1E));
end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
Rivals = player:getQuestStatus(1,20);
MythrilSallet = 0x3081; -- 12417
MythrilSallet1 = trade:hasItemQty(MythrilSallet,1);
count = trade:getItemCount();
gil = trade:getGil();

if(Rivals == 1 and MythrilSallet1 and count == 1 and gil == 0)then
	player:startEvent(Event(0x5E));
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0x5E)then
	WolfGorget = 0x3321;
	player:addItem(WolfGorget);
	player:specialMessage(ITEM_OBTAINED,WolfGorget);
	player:setTitle(91);
	player:addFame(1,BAS_FAME*120);
	player:completeQuest(1,20);
end
end;