-----------------------------------
--	Author: ReaperX
--	no_name_6 (Ru'Lude Gardens at fountain, for stage 5 GA upgrade)
--  Trade Abaddon Killer + 1 Ten Thousand Byne Bill to receive a CS, Bravura and 30 One Hundred Byne Bills

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
if (trade:hasItemQty(18293,1) and trade:hasItemQty(1457,1) and trade:getItemCount() == 2) then  
  player:addItem(18294)
  player:addItem(1456,30)
  player:setVar("RELIC_QUEST_STAGE",5);
  trade:isComplete();
  event = Event(0x2733);
  event:setParams(18294)
  player:startEvent(event);  
end
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x2733) then
   player:specialMessage(185,1456,30);
   player:specialMessage(179,18294);
end
end;