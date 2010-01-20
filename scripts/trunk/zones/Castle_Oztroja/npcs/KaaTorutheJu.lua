-----------------------------------
--	Author: ReaperX
--  Kaa Toru the Just
--  NPC for Windurst Mission 6-2
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:hasKeyItem(BalgaChampionCertificate) ==1) then
  event = Event(0x2d);
  event:setParams(0,HolyOnesOath);
  player:startEvent(event);
elseif (player:hasKeyItem(HolyOnesOath) ==1) then
	player:startEvent(Event(0x2E));
end
end;

 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x2D) then
  player:addKeyItem(HolyOnesOath);
  player:specialMessage(208,HolyOnesOath);
  player:addItem(AshuraNecklace);
  player:specialMessage(205,AshuraNecklace);
  player:removeKeyItem(BalgaChampionCertificate);
elseif (csid == 0x2E) and (DEBUG_MODE) then
	player:setPos(2, -45, -28, 180, 0xF2);
end;
end;