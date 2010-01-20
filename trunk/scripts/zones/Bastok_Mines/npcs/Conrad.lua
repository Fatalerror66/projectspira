require("scripts/globals/settings");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

guardnation = BASTOK;

-----------------------------------
-- Author: ReaperX (using Tenjou's research on input parameters)
-- Conrad (Regional Teleporter)
-- has 3 other events too that are seasonal variations of 245.
--argument 1: 
--argument 2: regional control bitmask for Bastok
--argument 3: 
--argument 4: 
--argument 5: 
--argument 6: 0x1 = only serves sandy, 0x100 = only serves bastok,0x201 = only serves windurst.
--argument 7: player's level
--argument 8: menu bitmask,0x3f4001f offers all actual regions,0x3fffffff offers no regions
-- set player variable SUPPLY_QUESTS_BAS to 12582880 to give yourself all OPs including Tu'lia.

----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
event = Event(0x245);
control = 0xFFFFFFFF-getControlBitmask(guardnation);
if (guardnation == player:getNation()) then
	event:setParams(0,control,0,0,0,0,player:getMainLvl(),0x3fffffff-player:getVar("SUPPLY_QUESTS_BAS"));
else
	event:setParams(0,control,0,0,0,0x100,player:getMainLvl(),0x3fffffff-player:getVar("SUPPLY_QUESTS_BAS"));
end;
player:startEvent(event);
end;

function onEventSelection(player,csid,option)
--print(csid,option);
-- param 1: player's gil
-- param 2: gil cost of transport
player:updateEvent(player:getCurrGil(),OP_TeleFee(player, option));
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (option >=5 and option <=23) then
	player:removeGil(OP_TeleFee(player, option));
	toOutpost(player, option)
end;
end;