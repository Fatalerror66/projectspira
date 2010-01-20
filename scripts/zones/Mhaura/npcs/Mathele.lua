-----------------------------------
--	Author: Tenjou
--	BARD: Mathele
--	As more missions and quests get added in, she will need to be able to play back the cutscenes.  This is a low priority.  Right now it is as if nothing has been completed,no matter what.
--argument 1: windurst mission CS bitmask
--argument 2: foreign mission CS bitmask
--argument 3: windurst quest 1 CS bitmask
--argument 4: windurst quest 2 CS bitmask
--argument 5: promathia mission CS bitmask
--argument 6: main menu,keep on 0xfffffffe,set the others to 0xfffffffe to block that option from the main menu
--argument 7: her charge
--argument 8: player's gil
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x130 = Event(0x130);
event0x130:setParams(0xfffffffe,0xfffffffe,0xfffffffe,0xfffffffe,0xfffffffe,0xfffffffe,10,player:getCurrGil());
player:startEvent(event0x130);
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