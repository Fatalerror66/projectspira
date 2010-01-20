-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Patt-Pott
-- 	Basic Chat Text, Windurst Mission 2-3
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

MISSIONS = 1348 --	No matter. To work, then! Good luck! Come back when you're done!

MythrilSand = 599;

--[[ events

0FA default response
102 "good luck on your mission"
103 "good work! Tell the people in Windurst 'hi' when you get back."
0FE 2-3 opening CS for Bastok 1st path
0FF 2-3 receives mythril sand
100 2-3 opening CS for Bastok 2nd path  
101 2-3 closing CS for Bastok 2nd path  

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
mission_status = player:getVar("mission_status");

if player:getMissionStatus(2,5) == 1 and mission_status == 14 then
	player:startEvent(Event(0x100));
elseif player:getMissionStatus(2,5) == 1 and mission_status == 6 then
	player:startEvent(Event(0x103));
elseif player:getMissionStatus(2,5) == 1 and mission_status == 2 then
	player:startEvent(Event(0xFE));
elseif player:getMissionStatus(2,7) == 1 and mission_status == 3 then
	player:startEvent(Event(0x102));
elseif player:hasKeyItem(KindredReport) == 1 and mission_status == 1 then 
	player:startEvent(Event(0x103));
elseif player:hasKeyItem(KindredCrest) == 1 and mission_status == 1 then 
	player:startEvent(Event(0x101));
elseif player:getMissionStatus(2,9) == 1 then
	player:showText(npc,MISSIONS);
elseif player:getMissionStatus(2,5) == 1 and mission_status == 19 then
	player:showText(npc,MISSIONS + 13); -- Since you've visited both San d'Oria and Bastok, you may now make your triumphant return to Windurst!
	if DEBUG_MODE then
		toKupipi(player);
	end;
else
  player:startEvent(Event(0xFA));
end;
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
MythrilSand1 = trade:hasItemQty(MythrilSand,1)
if(count == 1 and MythrilSand1 and player:getMissionStatus(2,7) == 1 and player:getVar("mission_status") == 5)then
	trade:isComplete();
	player:startEvent(Event(0xFF));
end
end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x100) then
	player:setVar("mission_status",15);
	player:currentMission(2,9);
	player:removeKeyItem(LetterToConsulsWindy);
elseif (csid == 0x101) then
	player:setVar("mission_status",19); -- Bastok part done! -> go back to Windurst
	player:addKeyItem(KindredReport) 
	player:specialMessage(KEYITEM_OBTAINED,KindredReport); 
	player:removeKeyItem(KindredCrest)
	player:currentMission(2,5);
elseif (csid == 0xFE) then
	player:setVar("mission_status",3);
	player:currentMission(2,7);
elseif (csid == 0xFF) then
	player:setVar("mission_status",6);
	player:currentMission(2,5);
end; 
end;