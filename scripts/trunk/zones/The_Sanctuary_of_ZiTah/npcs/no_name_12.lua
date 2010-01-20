-----------------------------------
--	Author: ReaperX
--	no_name_12 (ZiTah L-10 at great tree, for stage 5 dagger upgrade)
--  Trade Batardeau + 1 Ten Thousand Byne Bill to receive a CS, Mandau and 30 One Hundred Byne Bills

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
--print("here")
if (trade:hasItemQty(18269,1) and trade:hasItemQty(1457,1) and trade:getItemCount() == 2) then  
  player:addItem(18270)
  player:addItem(1456,30)
  player:setVar("RELIC_QUEST_STAGE",5);
  trade:isComplete();
  event = Event(0x00CF);
  event:setParams(18270)
  player:startEvent(event);  
end
end

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x00CF) then
   player:specialMessage(26,1456,30);
   player:specialMessage(20,18270);
end
end;