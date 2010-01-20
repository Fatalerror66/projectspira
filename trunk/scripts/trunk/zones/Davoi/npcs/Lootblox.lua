-----------------------------------
--	Author: ReaperX
--	Lootblox (Davoi Dynamis vendor)
--  Sells timeless hourglass, exchanges different denominations of ancient San d'Orian currency
--  Sells Dynamis crafting items.
--  Bug: addItem() seems to be able to add only up to 99 items at this time, so currency exchange of R. Gold -> 100 M. Silver
--  gives player only 99 M. Silver.
-----------------------------------

-----------------------------------
require("scripts/globals/settings");

-- items sold by Lootblox and their prices

id = {}
id[1] = 883 -- Behemoth Horn
id[2] = 1520 -- Goblin Grease
id[3] = 1516 -- Griffon Hide
id[4] = 1459 -- Griffon Leather
id[5] = 1458 -- Mammoth Tusk
id[6] = 1466 -- Relic Iron
id[7] = 1295 -- Twincoon

price = {}
price[1] = 25;
price[2] = 7;
price[3] = 8;
price[4] = 23;
price[5] = 28;
price[6] = 6;
price[7] = 5;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
  lootblox_status = player:getVar("LOOTBLOX_STATUS");  -- has player talked to Lootblox before?
  if (player:hasKeyItem(0x01EC) == 0) then
    event = Event(0x0082);
  else
    if (lootblox_status == 0) then
      player:setVar("LOOTBLOX_STATUS",1);
      event = Event(0x0083);
      event:setParams(4236,TIMELESS_HOURGLASS_COST);
    else
      event = Event(0x0085);
      event:setParams(1452,100,1453,100,1454,0,4236,TIMELESS_HOURGLASS_COST);
    end
  end
  player:startEvent(event);
end;

----------Lootblox events -----------------
-- 0082 turns player away for lack of key item "Vial of Shrouded Sand"
-- 0083 describes timeless hourglass and cost for first-time customers.
-- 0084 describes currency exchange
-- 0085 menu
-- 0086 confirms trade gil -> hourglass
-- 0087 confirms trade 100 NQs -> 1 HQ       
-- 0088 confirms trade 100 HQs -> 1 HQ2      
-- 0089 confirms hq currency for item trade. 
-- 008A confirms trade 1 HQ2 -> 100 HQ       
 
-----------------------------------
-- onTrade Action--
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getGil()==TIMELESS_HOURGLASS_COST) then 
  trade:isComplete()
  player:addItem(4236) 
  event = Event(0x0086);
  player:startEvent(Event(0x0086))
end;

---------------- ancient currency exchange ----------------------------

if (player:hasKeyItem(0x01EC) == 1) then

  if (trade:getItemQty(1452) == 100) then -- 100 O. Bronzepieces -> 1 M. Silverpiece
    trade:isComplete()
    player:addItem(1453) 
    event = Event(0x0087);
    event:setParams(100);
    player:startEvent(event);
  end
  
  if (trade:getItemQty(1453) == 100) then -- 100 M. Silverpieces -> 1 R. Goldpiece
    trade:isComplete()
    player:addItem(1454) 
    event = Event(0x0088);
    event:setParams(100);
    player:startEvent(event);
  end
  
  if (trade:getItemQty(1454) == 1) then -- R. Goldpiece -> 100 M. Silverpieces
    trade:isComplete()
    player:addItem(1453,100)  -- bugged:   only adds 99 pieces each
    event = Event(0x008A);  
    event:setParams(1454,1453,100);
    player:startEvent(event);
  end
  
  ms = trade:getItemQty(1453)  -- item for currency trades
  for i=1,7 do
    if (price[i] == ms) then
      trade:isComplete()
      player:addItem(id[i]) 
      event = Event(0x0089);
      event:setParams(1453,price[i],id[i]);
      player:setVar("LAST_LOOTBLOX_ITEM_BOUGHT",id[i]);
      player:startEvent(event);    
      break
    end
  end
end
end;
-----------------------------------------------------

function onEventSelection(player,csid,option)
--print("onEventSelection")
--print("onEventSelection - CSID:",csid);        
--print("onEventSelection - option ===",option); 
if (csid == 133) then
   
  if (option == 2) then  -- player asked about trades of M. Silverpieces for items (page 1)
    player:updateEvent(price[1],id[1],price[2],id[2],price[3],id[3],price[4],id[4])
  
  elseif (option == 3) then  -- player asked about trades of M. Silverpieces for items (page 2)
    player:updateEvent(price[5], id[5], price[6], id[6], price[7], id[7])
  
  elseif (option == 10) then -- "also" part of the Old Currencies info page: R. Gold -> M. Silver
    player:updateEvent(1454,1453,100)
  end
end
end

------------------------------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid ==134) then
  player:specialMessage(20,4236);
elseif (csid ==135) then
  player:specialMessage(20,1453);
elseif (csid ==136) then
  player:specialMessage(20,1454);
elseif (csid ==137) then  -- needed a server variable workaround because option is always zero in this case for some reason
  player:specialMessage(20,player:getVar("LAST_LOOTBLOX_ITEM_BOUGHT"));
elseif (csid ==138) then
  player:specialMessage(26,1453,100);
end
end;