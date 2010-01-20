-----------------------------------
--	Author: ReaperX
--	no_name_13 (ZiTah H-8, for stage 5 club upgrade)
--  Trade Gullitani + 1 R. Goldpiece to receive a CS, Mjollnir and 30 M. Silverpieces.

----- former relic owners ---------
-- Capacucu : H2H
-- Putori-Tutori : dagger
-- Kilhwch : sword
-- Mieuseloir : great sword
-- Lhu Mhakaracca : axe  
-- Xonia : great axe
-- Fonove :  scythe
-- Dzhau Yaam : polearm
-- Kupalu-Harupalu : katana
-- Noillurie : great katana
-- Umon-Paumon : staff 
-- Ferreous Coffin : club
-- Ghebben : archery
-- Elrica : marksmanship
-- Terounalivet : horn
-----------------------------------
require("scripts/globals/settings");

function onTrade(player,npc,trade)
if (trade:hasItemQty(18323,1) and trade:hasItemQty(1454,1) and trade:getItemCount() == 2) then  
  player:addItem(18324)
  player:addItem(1453,30)
  player:setVar("RELIC_QUEST_STAGE",5);
  trade:isComplete();
  event = Event(0x00D8);
  event:setParams(18324)
  player:startEvent(event);  
end
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x00D8) then
   player:specialMessage(26,1453,30);
   player:specialMessage(20,18324);
end
end;