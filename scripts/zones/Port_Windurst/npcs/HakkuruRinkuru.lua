-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Hakkuru-Rinkuru
-- 	Involved in parts of Windurst Mission 1-1.  Also starts and ends quest "Making Amends."
--	The quest should require fame level 2.
--	NOTE: The fame rewards will need to be changed once more information is gathered.
-----------------------------------

require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/zones/Port_Windurst/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

--[[ events

000B DEBUG MENU
0131 new adventurer CS
00E0 default response
005A Windurst mission 1-1
005B Windurst mission 1-1
005D Windurst mission 1-1
005E Windurst mission 1-1
0060 The minister is trying his best to reactive the mumbo-jumbo gizmos in the Horutoto Ruins.. (default response after mission 1-1?)
0093 mission 3-1
0094
0096
0103
0104
0109
010B
0112 broken wand quest
0113 broken wand quest
0115 ?
0116 broken wand quest
0119
0118
011A
011C
011D
01C8 CS for Windurst Mission 6-1 "Full Moon Fountain"
01C9 repeats instructions for 6-1
01CB
01CD
0225
0223
023B
0242
0245
0247                      

--]]                                 
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)


local glue = player:getVar("makingAmends");
mission_status = player:getVar("mission_status");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:getMissionStatus(2,0) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x5A));
elseif (player:getMissionStatus(2,0) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x5B));
elseif (player:getMissionStatus(2,0) == 1) and (mission_status == 3) and (player:hasKeyItem(CrackedManaOrb) == 0) then
	player:startEvent(Event(0x5D));
elseif (player:hasKeyItem(CrackedManaOrb) == 1) then
	event = Event(0x5E);
	event:setParams(0,CrackedManaOrb);
	player:startEvent(event);
elseif (player:getMissionStatus(2,10) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x93));
elseif (player:getMissionStatus(2,16) == 1) and (mission_status == 1) then
	event = Event(0x1C8);
	event:setParams(0,SouthwesternStarCharm);
	player:startEvent(event);
elseif (player:getMissionStatus(2,16) == 1) and (mission_status == 2) then
	player:startEvent(Event(0x1C9));
elseif (player:getMissionStatus(2,16) == 1) and (mission_status == 3) then
	player:startEvent(Event(0x1CB));
elseif (glue == 0) and (player:getFame(2) >= 200) then
  --Offer quest
  local event0x112 = Event(0x112);
	event0x112:setParams(0,0x3a9);
	player:startEvent(event0x112);
elseif (glue == 1) then
	--During quest
	local event0x113 = Event(0x113);
	event0x113:setParams(0,0x3a9);
	player:startEvent(event0x113);
elseif (player:getMissionStatus(2,0) == 2) then
	player:startEvent(Event(0x60));
elseif (glue == 2) then
	--After quest
	player:startEvent(Event(0x116));
else
  player:startEvent(Event(0xe0));
end;
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local glue = player:getVar("makingAmends");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x3a9,1);
if (glue == 1 and count == 1 and item1 == true) then
	--Complete quest "Making Amends"
	local event0x115 = Event(0x115);
	event0x115:setParams(1500);
	player:startEvent(event0x115);
	player:removeItem(0x3a9,1);
	player:setVar("makingAmends",2);
	--Give reward and fame
	player:setCurrGil(money+1500);
	player:addFame(2,WIN_FAME*50);
	--print("Windurst fame adjusted for",player:getName(),"by 50 (Total:",player:getFame(2),").");
	player:completeQuest(2,3);
	player:setTitle(122);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
print(csid);
if (csid == 0x112 and option == 1) then
	--Accept quest "Making Amends."
	player:setVar("makingAmends",1);
	player:addQuest(2,3);
elseif (csid == 0x5A) then
	player:setVar("mission_status",2);
elseif (csid == 0x5B) and DEBUG_MODE then
	toLilyTower(player);
elseif (csid == 0x5E) then
	player:setVar("mission_status",0);
	player:removeKeyItem(CrackedManaOrb);
	player:completeMission(2,0);
	toWindurstMissionOverseer(player);
elseif (csid == 0x93) and (DEBUG_MODE) then
	player:setPos(18, 0.247556, -15, 228, 0x97);
elseif (csid == 0x1C8) then
	player:addKeyItem(SouthwesternStarCharm);
	player:specialMessage(KEYITEM_OBTAINED,SouthwesternStarCharm);
	player:setVar("mission_status",2);
elseif (csid == 0x1C9) and (DEBUG_MODE) then
	toDahliaTower(player)
elseif (csid == 0x1CB) and DEBUG_MODE then
	player:setPos(-260, 4, -325, 188, 0xAA); -- to full moon fountain
end
end; 