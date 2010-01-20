-----------------------------------
--	Author: ReaperX
--	Antiqix (Castle Oztroja Dynamis vendor)
--  Sells timeless hourglass, exchanges different denominations of ancient Windurstian currency
--  Sells Dynamis crafting items.
--  Bug: addItem() seems to be able to add only up to 99 items at this time, so currency exchange of 1 R. Stripeshell
--  -> 100 L. Jadeshells returns only 99 L. Jadeshells.
-----------------------------------

-----------------------------------
require("scripts/globals/settings");

-- items sold by Antiqix and their prices

id = {}
id[1] = 1312 -- Angel Skin
id[2] = 1463 -- Chronos Tooth
id[3] = 1518 -- Colossal Skull
id[4] = 658 -- Damascus Ingot
id[5] = 1464 -- Lancewood Log
id[6] = 1462 -- Lancewood Lumber
id[7] = 1467 -- Relic Steel

price = {}
price[1] = 7;
price[2] = 23;
price[3] = 8;
price[4] = 28;
price[5] = 9;
price[6] = 25;
price[7] = 24;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
  antiqix_status = player:getVar("ANTIQIX_STATUS");  -- has player talked to Antiqix before?
  if (player:hasKeyItem(0x01EC) == 0) then
    event = Event(0x0032);
  else
    if (antiqix_status == 0) then
      player:setVar("ANTIQIX_STATUS",1);
      event = Event(0x0033);
      event:setParams(4236,TIMELESS_HOURGLASS_COST);
    else
      event = Event(0x0035);
      event:setParams(1449,100,1450,100,1451,0,4236,TIMELESS_HOURGLASS_COST);
    end
  end
  player:startEvent(event);
end;

----------Antiqix events -----------------
-- 0032 turns player away for lack of key item "Vial of Shrouded Sand"
-- 0033 describes timeless hourglass and cost for first-time customers.
-- 0034 describes currency exchange
-- 0035 menu
-- 0036 confirms trade gil -> hourglass
-- 0037 confirms trade 100 NQs -> 1 HQ
-- 0038 confirms trade 100 HQs -> 1 HQ2
-- 0039 confirms hq currency for item trade.
-- 003A confirms trade 1 HQ2 -> 100 HQ
 
-----------------------------------
-- onTrade Action--
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getGil()==TIMELESS_HOURGLASS_COST) then 
  trade:isComplete()
  player:addItem(4236) 
  event = Event(0x0036);
  player:startEvent(Event(0x0036))
end;

---------------- ancient currency exchange ----------------------------

if (trade:getItemQty(1449) == 100) then -- 100 T. Whiteshells -> 1 L. Jadeshell
  trade:isComplete()
  player:addItem(1450) 
  event = Event(0x0037);
  event:setParams(100);
  player:startEvent(event);
end

if (trade:getItemQty(1450) == 100) then -- 100 L. Jadeshells -> 1 R. Stripeshell
  trade:isComplete()
  player:addItem(1451) 
  event = Event(0x0038);
  event:setParams(100);
  player:startEvent(event);
end

if (trade:getItemQty(1451) == 1) then --  1 R. Stripeshell -> 100 L. Jadeshells 
  trade:isComplete()
  player:addItem(1450,100)  -- bugged:   only adds 99 pieces each
  event = Event(0x003A);  
  event:setParams(1451,1450,100);
  player:startEvent(event);
end

---------------------- item for currency trades -----------------

ms = trade:getItemQty(1450)
for i=1,7 do
  if (price[i] == ms) then
    trade:isComplete()
    player:addItem(id[i]) 
    event = Event(0x0039);
    event:setParams(1450,price[i],id[i]);
    player:setVar("LAST_ANTIQIX_ITEM_BOUGHT",id[i]);
    player:startEvent(event);    
    break
  end
end

end;
-----------------------------------------------------

function onEventSelection(player,csid,option)
--print("onEventSelection")
--print("onEventSelection - CSID:",csid);        
--print("onEventSelection - option ===",option); 
if (csid == 53) then
   
  if (option == 2) then  -- player asked about trades of 100 Byne Bills for items (page 1)
    player:updateEvent(price[1],id[1],price[2],id[2],price[3],id[3],price[4],id[4])
  
  elseif (option == 3) then  -- player asked about trades of 100 Byne Bills for items (page 2)
    player:updateEvent(price[5], id[5], price[6], id[6], price[7], id[7])
  
  elseif (option == 10) then -- "also" part of the Old Currencies info page: R. Stripeshell -> 100 L. Jadeshells
    player:updateEvent(1451,1450,100)
  end
end
end

------------------------------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid ==54) then
  player:specialMessage(205,4236);
elseif (csid ==55) then
  player:specialMessage(205,1450);
elseif (csid ==56) then
  player:specialMessage(205,1451);
elseif (csid ==58) then
  player:specialMessage(211,1450,100);
elseif (csid ==57) then  -- needed a server variable workaround because option is always zero in this case for some reason
  player:specialMessage(205,player:getVar("LAST_ANTIQIX_ITEM_BOUGHT"));
end
end;