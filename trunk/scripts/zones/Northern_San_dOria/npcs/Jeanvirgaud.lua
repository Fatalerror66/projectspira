require("scripts/globals/settings");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

guardnation = SANDORIA;

-----------------------------------
--Author: ReaperX (using Tenjou's research on input parameters), OnTrade by Mana
--JeanVirgaud (Regional Teleporter)
--argument 1: regional control bitmask for San d'Oria
--argument 2: 
--argument 3: 
--argument 4: 
--argument 5: 
--argument 6: 0x1 = only serves sandy, 0x100 = only serves bastok,0x201 = only serves windurst.
--argument 7: player's level
--argument 8: menu bitmask,0x3f4001f offers all actual regions,0x3fffffff offers no regions
-- set player variable SUPPLY_QUESTS_SAN to 12582880 to give yourself all OPs including Tu'lia.

----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
event = Event(0x2cc);
control = 0xFFFFFFFF-getControlBitmask(guardnation);
--print("control = ",control);
--print("guard nation = ",guardnation);
if (guardnation == player:getNation()) then
	event:setParams(control,0,0,0,0,0,player:getMainLvl(),0x3fffffff-player:getVar("SUPPLY_QUESTS_SAN"));
else
	event:setParams(control,0,0,0,0,0x1,player:getMainLvl(),0x3fffffff-player:getVar("SUPPLY_QUESTS_SAN"));
end;
player:startEvent(event);
end;

function onEventSelection(player,csid,option)
--print(csid,option);
-- param 1: player's gil
-- param 2: gil cost of transport
player:updateEvent(player:getCurrGil(),OP_TeleFee(player, option));
end;

 
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(FLYER_REFUSED)
	end
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