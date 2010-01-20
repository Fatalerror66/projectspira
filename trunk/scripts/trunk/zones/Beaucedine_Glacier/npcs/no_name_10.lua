-----------------------------------
--	Author: ReaperX
--	no_name_10 (Glacier G-10, for stage 5 GS upgrade)
--  Trade Valhalla + 1 R. Goldpiece to receive a CS, Ragnarok and 30 M. Silverpieces.

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
if (trade:hasItemQty(18281,1) and trade:hasItemQty(1454,1) and trade:getItemCount() == 2) then  
  player:addItem(18282)
  player:addItem(1453,30)
  player:setVar("RELIC_QUEST_STAGE",5);
  trade:isComplete();
  event = Event(0x008B);
  event:setParams(18282)
  player:startEvent(event);  
end
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x008B) then
   player:specialMessage(188,1453,30);
   player:specialMessage(182,18282);
end
end;