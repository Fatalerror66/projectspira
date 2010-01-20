-----------------------------------
--	Author: ReaperX
--	no_name_0 (VoS north hole, for stage 5 horn upgrade)
--  Trade Millenium Horn + 1 R. Stripeshell to receive a CS, Gjallarhorn and 30 L. Jadeshells.

------ former relic owners ---------
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
------------------------------------------------------------
require("scripts/globals/settings");

function onTrade(player,npc,trade)
if (trade:hasItemQty(18341,1) and trade:hasItemQty(1451,1) and trade:getItemCount() == 2) then  
  player:addItem(18342)
  player:addItem(1450,30)
  player:setVar("RELIC_QUEST_STAGE",5);
  trade:isComplete();
  event = Event(0x000F);
  event:setParams(18342)
  player:startEvent(event);  
end
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x000F) then
   player:specialMessage(26,1450,30);
   player:specialMessage(20,18342);
end
end;