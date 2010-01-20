-----------------------------------
--	Author: ReaperX
-- 	Oaken Box
-- 	for RDM AF quest, spawns Guardian Statue
-----------------------------------
NailPuller = 1094;

require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 4) then
  loc = Zone(0xC8);
	loc:spawnMob("GuardianStatue",-169,0,233,42,player);
	player:setVar("peace_for_the_spirit_status",5);
elseif (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 5) then
	player:specialMessage(917,NailPuller);
else
  player:specialMessage(916);
end; 
end;

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
if (player:getQuestStatus(0,86) == 1) and (player:getVar("peace_for_the_spirit_status") == 5) and (trade:hasItemQty(NailPuller,1)) and (trade:getItemCount() == 1) then
  trade:isComplete();
	player:startEvent(Event(0xE));
end;
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x11) then
  player:setVar("peace_for_the_spirit_status",2);
elseif (csid == 0xE) then
  player:setVar("peace_for_the_spirit_status",6);
end;
end;