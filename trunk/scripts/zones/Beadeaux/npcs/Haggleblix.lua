-----------------------------------
--	Author: ReaperX
--	Haggleblix (Beadeaux Dynamis vendor)
--  Sells timeless hourglass, exchanges different denominations of ancient Bastokan currency
--  Sells Dynamis crafting items.
--  Bug: addItem() seems to be able to add only up to 99 items at this time, so currency exchange of 1 Ten Thousand Byne 
--  -> 100 One Hundred Bynes returns only 99 One Hundred Bynes.
-----------------------------------

-----------------------------------
require("scripts/globals/settings");

-- items sold by Haggleblix and their prices

id = {}
id[1] = 4246 -- Cantarella
id[2] = 1460 -- Koh-I-Noor
id[3] = 1468 -- Marksman's Oil
id[4] = 576 -- Siren's Hair
id[5] = 1521 -- Slime Juice
id[6] = 1461 -- Wootz Ingot
id[7] = 1469 -- Wootz Ore

price = {}
price[1] = 12;
price[2] = 33;
price[3] = 20;
price[4] = 7;
price[5] = 8;
price[6] = 25;
price[7] = 9;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
  haggleblix_status = player:getVar("HAGGLEBLIX_STATUS");  -- has player talked to Haggleblix before?
  if (player:hasKeyItem(0x01EC) == 0) then
    event = Event(0x0082);
  else
    if (haggleblix_status == 0) then
      player:setVar("HAGGLEBLIX_STATUS",1);
      event = Event(0x0083);
      event:setParams(4236,TIMELESS_HOURGLASS_COST);
    else
      event = Event(0x0085);
      event:setParams(1455,100,1456,100,1457,0,4236,TIMELESS_HOURGLASS_COST);
    end
  end
  player:startEvent(event);
end;

----------Haggleblix events -----------------
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

if (trade:getItemQty(1455) == 100) then -- 100 One Byne Bills -> 1 One Hundred Byne Bill
  trade:isComplete()
  player:addItem(1456) 
  event = Event(0x0087);
  event:setParams(100);
  player:startEvent(event);
end

if (trade:getItemQty(1456) == 100) then -- 100 One Hundred Byne Bills -> 1 Ten Thousand Byne Bill
  trade:isComplete()
  player:addItem(1457) 
  event = Event(0x0088);
  event:setParams(100);
  player:startEvent(event);
end

if (trade:getItemQty(1457) == 1) then --  1 Ten Thousand Byne Bill -> 100 One Hundred Byne Bills 
  trade:isComplete()
  player:addItem(1456,100)  -- bugged:   only adds 99 pieces each
  event = Event(0x008A);  
  event:setParams(1457,1456,100);
  player:startEvent(event);
end

---------------------- item for currency trades -----------------

ms = trade:getItemQty(1456)
for i=1,7 do
  if (price[i] == ms) then
    trade:isComplete()
    player:addItem(id[i]) 
    event = Event(0x0089);
    event:setParams(1456,price[i],id[i]);
    player:setVar("LAST_HAGGLEBLIX_ITEM_BOUGHT",id[i]);
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
if (csid == 133) then
   
  if (option == 2) then  -- player asked about trades of 100 Byne Bills for items (page 1)
    player:updateEvent(price[1],id[1],price[2],id[2],price[3],id[3],price[4],id[4])
  
  elseif (option == 3) then  -- player asked about trades of 100 Byne Bills for items (page 2)
    player:updateEvent(price[5], id[5], price[6], id[6], price[7], id[7])
  
  elseif (option == 10) then -- "also" part of the Old Currencies info page: Ten Thousand Bynes -> 100 One Hundred Byne Bills
    player:updateEvent(1457,1456,100)
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
  player:specialMessage(20,1456);
elseif (csid ==136) then
  player:specialMessage(20,1457);
elseif (csid ==138) then
  player:specialMessage(26,1456,100);
elseif (csid ==137) then  -- needed a server variable workaround because option is always zero in this case for some reason
  player:specialMessage(20,player:getVar("LAST_HAGGLEBLIX_ITEM_BOUGHT"));
end
end;