-----------------------------------
--	Author: ReaperX
--	no_name_10 (North Gustaberg at base of waterfall (north side), for stage 5 scythe  upgrade)
--  Trade Bec de Faucon + 1 R. Stripeshell to receive a CS, Apocalypse and 30 L. Jadeshells.

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
if (trade:hasItemQty(18305,1) and trade:hasItemQty(1451,1) and trade:getItemCount() == 2) then  
  player:addItem(18306)
  player:addItem(1450,30)
  player:setVar("RELIC_QUEST_STAGE",5);
  trade:isComplete();
  event = Event(0x00FE);
  event:setParams(18306)
  player:startEvent(event);  
end
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x00FE) then
   player:specialMessage(188,1450,30);
   player:specialMessage(182,18306);
end
end;