-----------------------------------
--	Author: Almendro
-- 	Oggbi
-- 	MNK AF1 Quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------
-- Initialization
BeatCesti = 0x4446;
TempleGaiters = 0x370A;
MinersPendant = 0x3342;
SandOrianMartialArtsScroll = 0xC0;
LetterfromDalzakk = 0xBF;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
GhostsofthePast = player:getQuestStatus(1,51);
TheFirstMeeting = player:getQuestStatus(1,52);
justDoneMNK_AF1 = player:getVar("temp_justDoneMNK_AF1");
lvl = player:getMainLvl();
job = player:getMainJob();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(lvl >= 40 and job == 2 and GhostsofthePast == 0)then
	player:startEvent(Event(0xE7));
	player:addQuest(1,51);
elseif(lvl >= 50 and job == 2 and GhostsofthePast == 2 and justDoneMNK_AF1 ~= 1 and TheFirstMeeting == 0)then
	player:startEvent(Event(0xE9));
	player:addQuest(1,52);
elseif(TheFirstMeeting == 1 and player:getVar("temp_TheFirstMeeting") == 3)then
	player:startEvent(Event(0xEA));
else
	-- Default chat text
	player:startEvent(Event(0xE6));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
 MinersPendant1 = trade:hasItemQty(MinersPendant,1);
		  count = trade:getItemCount();
			gil = trade:getGil();
GhostsofthePast = player:getQuestStatus(1,51);
if(GhostsofthePast == 1 and MinersPendant1 and count == 1 and gil == 0)then
	trade:isComplete();
	player:startEvent(Event(0xE8));
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xE8)then
	player:completeQuest(1,51);
	player:addItem(BeatCesti);
	player:specialMessage(ITEM_OBTAINED,BeatCesti);
	player:addFame(1,BAS_FAME*150);
	player:setVar("temp_justDoneMNK_AF1",1);
elseif(csid == 0xEA)then
	if(player:getFreeSlotCount(0) >= 1)then
		player:completeQuest(1,52);
		player:removeKeyItem(LetterfromDalzakk);
		player:removeKeyItem(SandOrianMartialArtsScroll);
		player:addItem(TempleGaiters);
		player:specialMessage(ITEM_OBTAINED,TempleGaiters);
		player:addFame(1,BAS_FAME*250);
		player:setVar("temp_TheFirstMeeting",0);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,TempleGaiters);
	end
end
end;