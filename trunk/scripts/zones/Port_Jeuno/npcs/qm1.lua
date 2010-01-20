-----------------------------------
--	Author: ReaperX
-- 	???
-- 	For Borghertz Hands Quests
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");

OldGauntlets = 0xD2;
ShadowFlames = 0xD3;
GrimyOldBox = 0929; --"You find a grimy old box."

--[[
00003689 -- 13961 -- fighter's mufflers
0000368A -- 13962 -- temple gloves
0000368B -- 13963 -- healer's mitts
0000368C -- 13964 -- wizard's gloves
0000368D -- 13965 -- warlock's gloves
0000368E -- 13966 -- rogue's armlets
0000368F -- 13967 -- gallant gauntlets
00003690 -- 13968 -- chaos gauntlets
00003691 -- 13969 -- 0x gloves
00003692 -- 13970 -- choral cuffs
00003693 -- 13971 -- hunter's bracers
00003694 -- 13972 -- myochin kote
00003695 -- 13973 -- ninja tekko
00003696 -- 13974 -- drachen finger gauntlets
00003697 -- 13975 -- evoker's bracers
--]]

item_offset = 0x3688;

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(ShadowFlames) == 1) then
	player:startEvent(Event(0x30));
elseif (player:hasKeyItem(OldGauntlets) == 1) and (player:getVar("BORGHERTZ_QUEST") == 3) and (player:getVar("ORDER_CONSIGNED") == 0) then
	player:startEvent(Event(0x14));
elseif (player:hasKeyItem(OldGauntlets) == 1) and (player:getVar("BORGHERTZ_QUEST") == 3) and (player:getVar("ORDER_CONSIGNED") == 1) then
	player:startEvent(Event(0x31));
else 
	player:specialMessage(GrimyOldBox);
end; 
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID",csid);
--print("RESULT",option);
if (csid == 0x14) and (option == 1) then
	player:setVar("ORDER_CONSIGNED",1)
elseif (csid == 0x31) and (DEBUG_MODE) then
    player:setPos(75, -24, 20, 120, 0xA1);   -- to Dark Spark
elseif (csid == 0x30) then
	player:removeKeyItem(OldGauntlets);
	player:removeKeyItem(ShadowFlames);
	player:setVar("ORDER_CONSIGNED",0)
	job = player:getVar("AF_HANDS_JOB");
	player:addItem(item_offset + job);
	player:specialMessage(ITEM_OBTAINED,item_offset + job);
	player:completeQuest(3,43 + job);
	player:setVar("AF_HANDS_JOB",0);
end;
end;