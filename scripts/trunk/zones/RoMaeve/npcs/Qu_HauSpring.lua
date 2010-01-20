-------------------------------------------------------
--	Author: ReaperX
--  Qu'Hau Spring
--  for Windurst Missions 7-2, 9-2, Zilart Missions
-------------------------------------------------------

require("/scripts/globals/common");
require("/scripts/globals/settings");
require("scripts/globals/rankpoints");
require("/scripts/zones/RoMaeve/TextIDs");

--[[ events:

0x2 Windurst 7-2 CS
0x4 Windurst 9-2 CS
0x7 you immerse the {} and the {} in the waters of the spring (Illuminink +  Parchment -> Ark Pentasphere)
0x8 you immerse the shards of the five Crystal Warriors, along with a chunk of light ore, in the waters of the spring (for 
-- obtaining another Divine Might reward earring.)

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getMissionStatus(2,20) == 1) and (player:getVar("mission_status") == 2) then
	player:startEvent(Event(0x2));
elseif (player:getMissionStatus(2,23) == 1) and (player:getVar("mission_status") == 2) and (player:hasKeyItem(AncientVerseOfRoMaeve) == 0) then
	player:startEvent(Event(0x4));
else
	player:specialMessage(MISSIONS); -- "The spring appears unchanged." (is this the correct default message?)
end;
end;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice)
if csid == 0x2 then
  player:setVar("mission_status",3);
elseif csid == 0x4 then
	player:addKeyItem(AncientVerseOfRoMaeve);
	player:specialMessage(KEYITEM_OBTAINED,AncientVerseOfRoMaeve);
end;
end;
