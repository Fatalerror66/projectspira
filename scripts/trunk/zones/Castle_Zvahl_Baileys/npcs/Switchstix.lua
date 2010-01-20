-----------------------------------
--	Author: ReaperX
--	Switchstix (Relic upgrader)
--  Accepts materials and ancient currency to upgrade relic weapons.

-- to do: thorough proofreading of the upgrade material and currency requirements.

-- not implemented: aborting relic quests, special dialog if you start a 2nd one.

-- possibly non-canonical behavior: Switchstix will respond to a stage 1 relic you
-- are carrying just when you click on him. I don't remember whether it was the same
-- on retail or you had to trade him the relic.

-----------------------------------

-----------------------------------
require("scripts/globals/settings");

-- Upgrade materials and currency amounts needed for each upgrade, indexed by the id of the item being upgraded.

item1 = {}
item2 = {}
item3 = {}
currency = {}
currency_amount = {}

--------- Spharai---------------------
item1[18260] = 1460 -- Koh-I-Noor
item2[18260] = 1459	-- square of griffon leather
item3[18260] = 665 --	adaman sheet
currency[18260] = 1456 -- one hundred byne bill
currency_amount[18260] = 4

item1[18261] = 16390 --	bronze knuckles
item2[18261] = 16392 --	metal knuckles
item3[18261] = 16396 --	koenigs knuckles
currency[18261] = 1453
currency_amount[18261] = 14

item1[18262] = 1556 --	attestation of might
currency[18262] = 1450
currency_amount[18262] = 61

item1[18263] = 1571 --	mystic fragment
item2[18263] = 1589 -- shard of necropsyche
currency[18263] = 1457 --	ten thousand byne bill
currency_amount[18263] = 1

---------- Mandau --------------------
item1[18266] = 4246 -- Cantarella
item2[18266] = 747	-- orichalcum ingot
item3[18266] = 4166	-- flask of deodorizer
currency[18266] = 1456 -- one hundred byne bill
currency_amount[18266] = 4

item1[18267] = 16449 -- brass dagger
item2[18267] = 16496 --	poison dagger
item3[18267] = 16452 --	misericorde
currency[18267] = 1453 -- M. Silverpiece
currency_amount[18267] = 14

item1[18268] = 1557 --attestation of celerity
currency[18268] = 1450 -- L. Jade shells
currency_amount[18268] = 61

item1[18269] = 1572 --	ornate fragment
item2[18269] = 1589 -- shard of necropsyche
currency[18269] = 1457 --	ten thousand byne bill
currency_amount[18269] = 1

---------- Excalibur --------------------
item1[18272] = 1460 -- Koh-I-Noor
item2[18272] = 763 --	orichalcum chain
item3[18272] = 931 --	cermet chunk
currency[18266] = 1453
currency_amount[18266] = 4

item1[18273] = 16535 --	bronze sword    
item2[18273] = 16537 --	mythril sword   
item3[18273] = 16542 --	wing sword      
currency[18273] = 1456 -- one hundred byne bill
currency_amount[18273] = 14

item1[18274] = 1558 --	attestation of glory 
currency[18274] = 1450 -- L. Jade shells
currency_amount[18274] = 61

item1[18275] = 1573 -- holy fragment
item2[18275] = 1589 -- shard of necropsyche
currency[18275] =  1454 --	Ranperre goldpiece
currency_amount[18275] = 1

---------- Ragnarok --------------------
item1[18278] = 1459 -- square of griffon leather
item2[18278] = 655 --	 adaman ingot
item3[18278] = 746 --	 platinum ingot
currency[18278] = 1453
currency_amount[18278] = 4

item1[18279] = 16583 -- claymore            
item2[18279] = 16584 -- mythril claymore    
item3[18279] = 16585 --	darksteel claymore  
currency[18279] = 1456 -- one hundred byne bill
currency_amount[18279] = 14

item1[18280] = 1559 --	attestation of righteousness
currency[18280] = 1450 --  L. Jade shells
currency_amount[18280] = 61

item1[18281] = 1574 --	intricate fragment
item2[18281] = 1589 -- shard of necropsyche
currency[18281] =  1454 --	Ranperre goldpiece
currency_amount[18281] = 1

------- Guttler -----------------------
item1[18284] = 1312 --	piece of angel skin
item2[18284] = 1463 --	Chronos tooth
item3[18284] = 13060 -- feather collar +1
currency[18284] = 1450 -- L. Jade shells
currency_amount[18284] = 3

item1[18285] = 16657 -- tabar          
item2[18285] = 16658 --	darksteel tabar
item3[18285] = 16659 --	tabarzin
currency[18285] = 1453 -- M. Silverpiece
currency_amount[18285] = 14

item1[18286] = 1560 --	attestation of bravery
currency[18286] = 1456 -- one hundred byne bill
currency_amount[18286] = 60

item1[18287] = 1574 --	intricate fragment
item2[18287] = 1589 -- shard of necropsyche
currency[18287] =  1451 --	Rimilala stripeshell
currency_amount[18287] = 1

-------  Bravura ---------------------
item1[18290] = 1461 -- wootz ingot
item2[18290] = 658 -- damascus ingot
item3[18290] = 720 -- piece of ancient lumber
currency[18290] = 1456 -- one hundred byne bill
currency_amount[18290] = 3

item1[18291] = 16704 -- butterfly axe
item2[18291] = 16705 -- greataxe
item3[18291] = 16724 -- heavy darksteel axe
currency[18291] = 1450 -- L. Jade shells
currency_amount[18291] = 16

item1[18292] = 1561 --	attestation of force
currency[18292] = 1453 -- M. Silverpiece
currency_amount[18292] = 60

item1[18293] = 1576 -- seraphic fragment
item2[18293] = 1589 -- shard of necropsyche
currency[18293] = 1457 --	ten thousand byne bill
currency_amount[18293] = 1
 
-------  Gungnir ---------------------
item1[18296] = 1462 -- piece of lancewood lumber
item2[18296] = 747 -- orichalcum ingot
item3[18296] = 1294 -- spool of Arachne thread
currency[18296] = 1450 -- L. Jade shells
currency_amount[18296] = 4

item1[18297] = 16834 -- brass spear 
item2[18297] = 16836 -- halberd     
item3[18297] = 16841 -- wyvern spear
currency[18297] = 1456 -- one hundred byne bill
currency_amount[18297] = 16

item1[18298] = 1563 -- attestation of fortitude
currency[18298] = 1453 -- M. Silverpiece
currency_amount[18298] = 61

item1[18299] = 1578 -- stellar fragment
item2[18299] = 1589 -- shard of necropsyche
currency[18299] = 1451 --	Rimilala stripeshell
currency_amount[18299] = 1

-------  Apocalypse ---------------------
item1[18302] = 1458 -- mammoth tusk
item2[18302] = 1117 -- square of manticore leather
item3[18302] = 13208 -- rainbow obi
currency[18302] = 1450 -- L. Jade shells
currency_amount[18302] = 5

item1[18303] = 16774 -- scythe         
item2[18303] = 16794 -- bone scythe    
item3[18303] = 16777 -- death scythe   
currency[18303] = 1453 -- M. Silverpiece
currency_amount[18303] = 16

item1[18304] = 1562 -- attestation of vigor
currency[18304] = 1456 -- one hundred byne bill
currency_amount[18304] = 62

item1[18305] = 1577 -- tenebrous fragment
item2[18305] = 1589 -- shard of necropsyche
currency[18305] = 1451 --	Rimilala stripeshell
currency_amount[18305] = 1

-------  Kikoku ---------------------
item1[18308] = 1467 -- chunk of relic steel
item2[18308] = 1276 -- Tarasque skin
item3[18308] = 1278 -- spool of twinthread
currency[18308] = 1456 -- one hundred byne bill
currency_amount[18308] = 4

item1[18309] = 16900 -- wakizashi
item2[18309] = 16903 -- Kabutowari
item3[18309] = 16902 -- Sakurafubuki
currency[18309] = 1450 -- L. Jade shells
currency_amount[18309] = 16

item1[18310] = 1564 -- attestation of legerity 
currency[18310] =  1453 -- M. Silverpiece
currency_amount[18310] = 61

item1[18311] = 1579 -- demoniac fragment
item2[18311] = 1589 -- shard of necropsyche
currency[18311] = 1457 --	ten thousand byne bill
currency_amount[18311] = 1

-------  Amanomurakumo ---------------------
item1[18314] = 1467 -- chunk of relic steel
item2[18314] = 1409 -- spool of Siren's macrame
item3[18314] = 657 -- lump of tama-hagane
currency[18314] = 1453 -- M. Silverpiece
currency_amount[18314] = 3

item1[18315] = 16966 -- tachi      
item2[18315] = 16967 -- mikazuki   
item3[18315] = 16972 -- kazaridachi
currency[18315] = 1450 -- L. Jade shells
currency_amount[18315] = 15

item1[18316] = 1565 -- attestation of decisiveness
currency[18316] = 1456 -- one hundred byne bill
currency_amount[18316] = 60

item1[18317] = 1580 -- divine fragment
item2[18317] = 1589 -- shard of necropsyche
currency[18317] = 1454 --	Ranperre goldpiece
currency_amount[18317] = 1

-------  Mjollnir ---------------------
item1[18320] = 1461 -- wootz ingot
item2[18320] = 746 -- platinum ingot
item3[18320] = 830 -- square of rainbow cloth
currency[18320] = 1453 -- M. Silverpiece
currency_amount[18320] = 5

item1[18321] = 17044 -- warhammer
item2[18321] = 17080 -- holy maul
item3[18321] = 17043 -- brass hammer
currency[18321] = 1456 -- one hundred byne bill
currency_amount[18321] = 16

item1[18322] = 1566 -- attestation of sacrifice
currency[18322] = 1450 -- L. Jade shells
currency_amount[18322] = 62

item1[18323] = 1581 -- heavenly fragment
item2[18323] = 1589 -- shard of necropsyche
currency[18323] = 1454 --	Ranperre goldpiece
currency_amount[18323] = 1

-------  Claustrum ---------------------
item1[18326] = 1462 -- piece of lancewood lumber
item2[18326] = 1271 -- pigeon's blood ruby	
item3[18326] = 1415 -- pot of urushi
currency[18326] = 1450 -- L. Jade shells
currency_amount[18326] = 5

item1[18327] = 17088 -- ash staff     
item2[18327] = 17090 -- elm staff     
item3[18327] = 17092 -- mahogany staff
currency[18327] = 1456 -- one hundred byne bill
currency_amount[18327] = 16

item1[18328] = 1567 -- attestation of virtue
currency[18328] = 1453 -- M. Silverpiece
currency_amount[18328] = 62

item1[18329] = 1582 -- celestial fragment
item2[18329] = 1589 -- shard of necropsyche
currency[18329] = 1451 --	Rimilala stripeshell
currency_amount[18329] = 1

-------  Annihilator ---------------------
item1[18332] = 1468 -- flask of marksman's oil
item2[18332] = 830 -- square of rainbow cloth
item3[18332] = 654 -- darksteel ingot
currency[18332] = 1456 -- one hundred byne bill
currency_amount[18332] = 5

item1[18333] = 17248 -- arquebus    
item2[18333] = 17251 -- hellfire    
item3[18333] = 17259 -- pirate's gun
currency[18333] = 1450 -- L. Jade shells
currency_amount[18333] = 15

item1[18334] = 1570 -- attestation of accuracy
currency[18334] = 1453 -- M. Silverpiece
currency_amount[18334] = 62

item1[18335] = 1585 -- ethereal fragment
item2[18335] = 1589 -- shard of necropsyche
currency[18335] = 1457 --	ten thousand byne bill
currency_amount[18335] = 1

------- Gjallarhorn ---------------------
item1[18338] = 1458 -- mammoth tusk
item2[18338] = 1463 -- Chronos tooth
item3[18338] = 13232 -- swordbelt +1
currency[18338] = 1450 -- L. Jade shells
currency_amount[18338] = 3

item1[18339] = 17352 -- horn     
item2[18339] = 17351 -- gemshorn 
item3[18339] = 17362 -- shofar   
currency[18339] = 1456 -- one hundred byne bill
currency_amount[18339] = 14

item1[18340] = 1569 -- attestation of harmony
currency[18340] = 1453 -- M. Silverpiece
currency_amount[18340] = 60

item1[18341] = 1584 -- mysterial fragment
item2[18341] = 1589 -- shard of necropsyche
currency[18341] =  1451 --	Rimilala stripeshell
currency_amount[18341] = 1

------- Yoichinoyumi ---------------------
item1[18344] = 883 -- behemoth horn
item2[18344] = 1462 -- piece of lancewood lumber
item3[18344] = 932 -- loop of carbon fiber
currency[18344] = 1453 -- M. Silverpiece
currency_amount[18344] = 4

item1[18345] = 17161 -- power bow
item2[18345] = 17164 -- war bow
item3[18345] = 18142 -- shigeto bow
currency[18345] = 1453 -- M. Silverpiece
currency_amount[18345] = 15

item1[18346] = 1568 -- attestation of transcendence
currency[18346] = 1450 -- L. Jade shells
currency_amount[18346] = 61

item1[18347] = 1583 -- snarled fragment
item2[18347] = 1589 -- shard of necropsyche
currency[18347] = 1454 --	Ranperre goldpiece
currency_amount[18347] = 1

------- Aegis -----------------------
item1[15066] = 875 -- square of amaltheia leather
item2[15066] = 668 -- orichalcum sheet
item3[15066] = 720 --	piece of ancient lumber
currency[15066] = 0 -- this entry ignored for Aegis
currency_amount[15066] = 1 -- of each

item1[15067] = 12301 --	buckler
item2[15067] = 12295 --	round shield
item3[15067] = 12387 --	koenig shield
currency[15067] = 0 -- this entry ignored for Aegis
currency_amount[15067] = 4 -- of each

item1[15068] = 1821 --	attestation of invulnerability
currency[15068] = 0 -- this entry ignored for Aegis
currency_amount[15068] = 20 -- of each

item1[15069] = 1822 --	supernal fragment
item2[15069] = 1589 -- shard of necropsyche
currency[15069] = 1454 --	Ranperre goldpiece
currency_amount[15069] = 1



-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
  
  --debug code
  --player:setVar("RELIC_QUEST_STAGE",0);
  --player:setVar("RELIC_UPGRADE_STARTED",os.time());
  --player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",0);
  --player:setVar("HAS_TURNED_IN_MATERIALS",0);
  --player:setVar("CURRENTLY_UPGRADING",0);
  
  relic_quest_stage = player:getVar("RELIC_QUEST_STAGE");
  currently_upgrading = player:getVar("CURRENTLY_UPGRADING"); -- itemid of the item currently being upgraded 
  has_paid_for_current_upgrade = player:getVar("HAS_PAID_FOR_CURRENT_UPGRADE");
  has_turned_in_mats = player:getVar("HAS_TURNED_IN_MATERIALS");
  
  --print("relic_quest_stage",relic_quest_stage)
  --print("has_turned_in_mats",has_turned_in_mats)
  --print("has_paid_for_current_upgrade",has_paid_for_current_upgrade)
  --print("currently_upgrading",currently_upgrading)
  
  switch (relic_quest_stage): caseof {
---------------------------------
[0] = function (x)  
---------------------------------
	relic = 0;
  for i=18260,18344,6 do           -- go through the item ids of the stage 1 relics to find if player has one of them.
    if (player:hasItem(i) == 1) then
      relic = i;
      break;
    end
  end
  if (player:hasItem(15066) == 1) then  -- relic shield needs special treatment
    relic = 15066;
    --print("found shield");
  end
  if (relic > 0) then			         	 -- player has an item to upgrade
    event = Event(0x000E);
    --print(relic,item1[relic],item2[relic],item3[relic]);
    event:setParams(relic,item1[relic],item2[relic],item3[relic]);
  else
    event = Event(0x000A);           -- player has nothing to upgrade
  end
end,

---------------------------------
[1] = function (x)  
---------------------------------
   	-- Only consider the player a stage 1 upgrader once materials are turned in.
    if (has_paid_for_current_upgrade == 0) then
      event = Event(0x000C);                                -- player needs to pay fees
      
      if (currently_upgrading == 15066) then                  -- special treatment for relic shield
        event:setParams(currently_upgrading,1456,currency_amount[currently_upgrading],1453,currency_amount[currently_upgrading],1450,currency_amount[currently_upgrading],4);
      else
        event:setParams(currently_upgrading,currency[currently_upgrading],currency_amount[currently_upgrading],0,0,0,0,1);
      end
    
    else
    	upgrade_started = player:getVar("RELIC_UPGRADE_STARTED");
			time_elapsed = os.time()-upgrade_started;
      if (time_elapsed < RELIC_1ST_UPGRADE_WAIT_TIME) then -- should be :86400 for 1 RL day
        event = Event(0x000F);         -- player just needs to wait
      else
        event = Event(0x0010);         -- stage 2 relic complete!
        currently_upgrading = currently_upgrading+1;
        player:setVar("CURRENTLY_UPGRADING",currently_upgrading);
        player:addItem(currently_upgrading)
        event:setParams(currently_upgrading);
        player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",0);
        player:setVar("HAS_TURNED_IN_MATERIALS",0);
        player:setVar("RELIC_QUEST_STAGE",2);
      end
    end
end,

---------------------------------
[2] = function (x)  
---------------------------------
  if (has_turned_in_mats == 0) then
    event = Event(0x0011);
    event:setParams(currently_upgrading,item1[currently_upgrading], item2[currently_upgrading],  item3[currently_upgrading],currency[currently_upgrading],currency_amount[currently_upgrading],0,2);
  else 
    if (has_paid_for_current_upgrade == 0) then						  -- player needs to pay fees
      event = Event(0x000C);         					
      
      if (currently_upgrading == 15067) then                  -- special treatment for bulwark shield
        event:setParams(currently_upgrading,1456,currency_amount[currently_upgrading],1453,currency_amount[currently_upgrading],1450,currency_amount[currently_upgrading],5);
      else
        event:setParams(currently_upgrading,currency[currently_upgrading],currency_amount[currently_upgrading],0,0,0,0,2);
      end
            
    else
      upgrade_started = player:getVar("RELIC_UPGRADE_STARTED");
			time_elapsed = os.time()-upgrade_started;
      if (time_elapsed < RELIC_2ND_UPGRADE_WAIT_TIME) then -- should be 604800 for 1 RL week
        event = Event(0x0012);         -- player just needs to wait
      else
        event = Event(0x0013);         -- stage 3 relic complete!
        currently_upgrading = currently_upgrading+1;
        player:setVar("CURRENTLY_UPGRADING",currently_upgrading);
        player:addItem(currently_upgrading)
        event:setParams(currently_upgrading);
        player:setVar("RELIC_QUEST_STAGE",3);
        player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",0);
        player:setVar("HAS_TURNED_IN_MATERIALS",0);
      end
    end
  end
end,

---------------------------------
[3] = function (x)  
---------------------------------
if (has_turned_in_mats == 0) then
    event = Event(0x0032);
    event:setParams(currently_upgrading,item1[currently_upgrading], item2[currently_upgrading],  item3[currently_upgrading],currency[currently_upgrading],currency_amount[currently_upgrading],0,3);
  else 
    if (has_paid_for_current_upgrade == 0) then
      event = Event(0x000C);         -- player needs to pay fees
      
      if (currently_upgrading == 15068) then                  -- special treatment for dynamis shield
        event:setParams(currently_upgrading,1456,currency_amount[currently_upgrading],1453,currency_amount[currently_upgrading],1450,currency_amount[currently_upgrading],6);
      else
        event:setParams(currently_upgrading,currency[currently_upgrading],currency_amount[currently_upgrading],0,0,0,0,3);
      end
             
    else
      upgrade_started = player:getVar("RELIC_UPGRADE_STARTED");
			time_elapsed = os.time()-upgrade_started;
      if (time_elapsed < 50) then -- should be  295200 for 82 RL hours
        event = Event(0x0033);         -- player just needs to wait
      else
        event = Event(0x0034);         -- stage 4 relic complete!
        currently_upgrading = currently_upgrading+1;
        player:setVar("CURRENTLY_UPGRADING",currently_upgrading);
        player:addItem(currently_upgrading)
        event:setParams(currently_upgrading);
        player:setVar("RELIC_QUEST_STAGE",4);
        player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",0);
        player:setVar("HAS_TURNED_IN_MATERIALS",0);
      end
    end
  end
end,

---------------------------------
[4] = function (x)  
---------------------------------

if (currently_upgrading == 18263) then -- Caestus
  event = Event(0x0044); 
elseif (currently_upgrading == 18269) then -- Batardeau
  event = Event (0x0045);
elseif (currently_upgrading == 18275) then -- Caliburn
  event = Event (0x0046);
elseif (currently_upgrading == 18281) then -- Valhalla
  event = Event (0x0047);
elseif (currently_upgrading == 18287) then -- ogre killer
  event = Event (0x0048);
elseif (currently_upgrading == 18293) then -- Abaddon Killer
  event = Event (0x0049);
elseif (currently_upgrading == 18299) then --  Gae Assail
  event = Event (0x004B);
elseif (currently_upgrading == 18305) then --  bec de fauconl
  event = Event (0x004A);
elseif (currently_upgrading == 18311) then --  Yoshimitsu
  event = Event (0x004C);
elseif (currently_upgrading == 18317) then --  Totsukanotsurugi
  event = Event (0x004D);
elseif (currently_upgrading == 18323) then --  Gullintani
  event = Event (0x004E);
elseif (currently_upgrading == 18329) then --  Thyrus
  event = Event (0x004F);
elseif (currently_upgrading == 18335) then --  Ferdinand
  event = Event (0x0051);
elseif (currently_upgrading == 18341) then --  Millennium Horn
  event = Event (0x0052);
elseif (currently_upgrading == 18347) then --  Futatokoroto
  event = Event (0x0050);
elseif (currently_upgrading == 15069) then --  Ancile
  event = Event (0x0056);
end
--print("relic:",currently_upgrading);
  event:setParams(item1[currently_upgrading], item2[currently_upgrading], currency[currently_upgrading],currency_amount[currently_upgrading],currently_upgrading); 
  
end,}
player:startEvent(event);
end;

---------- events -----------------
---------------------------------------------------
-- 0014 - 0031, 0035- 0043  0053--0055 player tells him he wants another relic weapon even though he can only hold 1
---------------------------------------------------

-- 000A -- introduces himself
-- 000B -- You got what I need? {param1} {param2} {param3}. Mentions currency fees of {param4} {param5}.
-- 000C -- Reforging the {param1} is gonna cost you {param3} {param2}.You pay me and I start working. See you when you get back with my fee.
-- 000D -- you brought me my {param3} {param2}? Right, time to get to work. My forge is hot and ready to go.
-- 000E -- is that a {param1} you're carrying? (..) The power behind that worn appearance is making my old Gobbie ears twitch.
--         To reforge that I'm gonna need a {param2}, a {param3} and a {param4}.
-- 000F -- tells you to wait
-- 0010 -- I'm done with your {param1}. So what do you think? You ain't gonna see too many weapons of this quality. (Returns item)


----------- stage 2 -> stage 3 upgrade ---------------------------------------------
-- 0011 -- That {param1} I worked on can still be improved. Asks for three weapons {param2} {param3} {param4} as payment.
-- 0012 -- tells you to wait a long time
-- 0013 -- gives you the upgrade. {param2}

----------- stage 3 -> stage 4 upgrade ---------------------------------------------

-- 0032 -- mentions next upgrade if you send his friend in an undisclosed location the current stage {param1} and attestation {param2} .
-- 0033 -- won't tell you where his buddy lives, tells you to wait, but not nearly as long as last time
-- 0034 -- gives you the finished stage 4 upgrade that arrived in the mail.

----------stage 4 -> stage 5 upgrade ---------------------------------------------
-- relic weapons speaks to you, asks for two items {param1} and {param2} for his body and soul (not always in this order). Those are 
-- the corresponding fragement and the shard of necropsyche. It also asks for payment in the form of {param4} many {param3} and reminds
-- you to bring the stage 4 relic {param5} with you and to come to a specific location.
--------------------------------------------------------------------

-- 0044 -- Spharai, 0045 -- Mandau, 0046 -- Exalibur, 0047 -- Ragnarok, 0048 -- Guttler, 0049 -- Bravura, 004A -- Apocalypse
-- 004B -- Gungnir, 004C -- Kikoku, 004D -- Amanomurakumo, 004E -- Mjollnir, 004F -- Claustrum, 0050 -- Yoichinoyumi
-- 0051 -- Annihilator, 0052 -- Gjallarhorn, 0056 -- Aegis
----------------------------------------------------------------------
-- 0057 -- cancels	 an order
----------------------------------------------------------------------
-----------------------------------
-- onTrade Action--
-----------------------------------
function onTrade(player,npc,trade)

  relic_quest_stage = player:getVar("RELIC_QUEST_STAGE");
  has_paid = player:getVar("HAS_PAID_FOR_CURRENT_UPGRADE");   
  relic = player:getVar("CURRENTLY_UPGRADING"); -- itemid of the relic currently being upgraded 
  if (relic_quest_stage == 0) then
  	relic = 0;
    for i=18260,18344,6 do           -- go through the item ids of the stage 1 relics to find if player has traded one of them.
      if (trade:hasItemQty(i,1)) then
        relic = i;
        break;
      end
    end  
    if (trade:hasItemQty(15066,1)) then  -- special treatment for relic shield
      relic = 15066;
    end
    has_relic = trade:hasItemQty(relic,1)
    has_1st_item = trade:hasItemQty(item1[relic],1)
    has_2nd_item = trade:hasItemQty(item2[relic],1)
    has_3rd_item = trade:hasItemQty(item3[relic],1)
            
    if ((has_1st_item) and (has_2nd_item) and (has_3rd_item) and (trade:getItemCount() == 4)) then
      event=Event(0x00B);
      if (relic == 15066) then           -- special treatment for relic shield
        event:setParams(relic,item1[relic],item2[relic],item3[relic],currency[relic],currency_amount[relic],0,4);
      else  
        event:setParams(relic,item1[relic],item2[relic],item3[relic],currency[relic],currency_amount[relic]);
      end
  		trade:isComplete();
      player:setVar("CURRENTLY_UPGRADING",relic) 
      player:setVar("RELIC_QUEST_STAGE",1);
      player:setVar("HAS_TURNED_IN_MATERIALS",1);
      player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",0);
      player:startEvent(event);
    end	
  elseif (relic_quest_stage == 1) then

    -- only one thing to do here: pay.
    if (has_paid == 0) then -- still needs to pay
  	  	if (relic == 15066) then  -- special treatment for relic shield
  	  	  has_currency1 = trade:hasItemQty(1450,currency_amount[relic]);
  	  	  has_currency2 = trade:hasItemQty(1453,currency_amount[relic]);
  	  	  has_currency3 = trade:hasItemQty(1456,currency_amount[relic]);
  	  	  has_currency = has_currency1 and has_currency2 and has_currency3;
  	  	else
  	  	  has_currency = trade:hasItemQty(currency[relic],currency_amount[relic]);
  	  	end
  	  	if (has_currency) then
  	  	  event=Event(0x00D);
  	  	  if (relic == 15066) then
  	  	    event:setParams(relic, 1456,currency_amount[relic],1453,currency_amount[relic],1450,currency_amount[relic],4);
          else
            event:setParams(relic, currency[relic],currency_amount[relic],0,0,0,0,1);
          end
  			  trade:isComplete();
          player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",1);
          player:startEvent(event);
          player:setVar("RELIC_UPGRADE_STARTED",os.time());
        end
  	end
  elseif (relic_quest_stage ==2) then

    has_turned_in_mats = player:getVar("HAS_TURNED_IN_MATERIALS");
    has_paid = player:getVar("HAS_PAID_FOR_CURRENT_UPGRADE");
    
  	if (has_turned_in_mats == 0) then                
  	  has_relic = trade:hasItemQty(relic,1)
      has_1st_item = trade:hasItemQty(item1[relic],1)
      has_2nd_item = trade:hasItemQty(item2[relic],1)
      has_3rd_item = trade:hasItemQty(item3[relic],1)
    
      if ((has_1st_item) and (has_2nd_item) and (has_3rd_item) and (trade:getItemCount() == 4)) then
        event=Event(0x00B);
        
        
        if (relic == 15067) then           -- special treatment for bulwark shield
          event:setParams(relic,item1[relic],item2[relic],item3[relic],currency[relic],currency_amount[relic],0,5);
        else  
          event:setParams(relic,item1[relic],item2[relic],item3[relic],currency[relic],currency_amount[relic],0,2);
        end     
        
  		  trade:isComplete();
  		  player:setVar("HAS_TURNED_IN_MATERIALS",1);
        player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",0);
        player:startEvent(event);
      end
    elseif (has_paid == 0) then    -- check whether the trade contains the correct amount of currency
       
      if (relic == 15067) then  -- special treatment for Bulwark Shield
  	  	  has_currency1 = trade:hasItemQty(1450,currency_amount[relic]);
  	  	  has_currency2 = trade:hasItemQty(1453,currency_amount[relic]);
  	  	  has_currency3 = trade:hasItemQty(1456,currency_amount[relic]);
  	  	  has_currency = has_currency1 and has_currency2 and has_currency3;
  	  else
  	  	  has_currency = trade:hasItemQty(currency[relic],currency_amount[relic]);
      end
     
  	  if (has_currency) then
  	    event=Event(0x00D);
  	    
  	    if (relic == 15067) then
  	  	  event:setParams(relic, 1456,currency_amount[relic],1453,currency_amount[relic],1450,currency_amount[relic],5);
        else
          event:setParams(relic, currency[relic],currency_amount[relic],0,0,0,0,2);
        end
  	    
  			trade:isComplete();
        player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",1);
        player:startEvent(event);
        player:setVar("RELIC_UPGRADE_STARTED",os.time());
      end
    end
    
    elseif (relic_quest_stage ==3) then

    has_turned_in_mats = player:getVar("HAS_TURNED_IN_MATERIALS");
    has_paid = player:getVar("HAS_PAID_FOR_CURRENT_UPGRADE");
    
  	if (has_turned_in_mats == 0) then
  	  has_relic = trade:hasItemQty(relic,1)
      has_1st_item = trade:hasItemQty(item1[relic],1)
    
      if ((has_1st_item) and (trade:getItemCount() == 2)) then
        event=Event(0x00B); 
        if (relic == 15068) then -- special treatment for Dynamis Shield
          event:setParams(relic,item1[relic],0,0,currency[relic],currency_amount[relic],0,6);
        else
          event:setParams(relic,item1[relic],0,0,currency[relic],currency_amount[relic],0,3);
        end
  		  trade:isComplete();
  		  player:setVar("HAS_TURNED_IN_MATERIALS",1);
        player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",0);
        player:startEvent(event);
      end
    elseif (has_paid == 0) then
        	    	  
  	  if (relic == 15068) then  -- special treatment for Dynamis Shield
  	  	  has_currency1 = trade:hasItemQty(1450,currency_amount[relic]);
  	  	  has_currency2 = trade:hasItemQty(1453,currency_amount[relic]);
  	  	  has_currency3 = trade:hasItemQty(1456,currency_amount[relic]);
  	  	  has_currency = has_currency1 and has_currency2 and has_currency3;
  	  else
  	  	  has_currency = trade:hasItemQty(currency[relic],currency_amount[relic]);
      end
  	 
  	  if (has_currency) then
  	    event=Event(0x00D);
        if (relic == 15068) then  --- this needs verification
  	  	  event:setParams(relic, 1456,currency_amount[relic],1453,currency_amount[relic],1450,currency_amount[relic],6);
        else
          event:setParams(relic, currency[relic],currency_amount[relic],0,0,0,0,3);
        end
                
  			trade:isComplete();
        player:setVar("HAS_PAID_FOR_CURRENT_UPGRADE",1);
        player:startEvent(event);
        player:setVar("RELIC_UPGRADE_STARTED",os.time());
      end
    end
    
  end
end;
-----------------------------------------------------

function onEventSelection(player,csid,option)
--print("onEventSelection")
--print("onEventSelection - CSID:",csid);        
--print("onEventSelection - option ===",option); 
if (csid == 11) and (option ==1) and (player:getVar("CURRENTLY_UPGRADING") == 15066) then  -- special handling for relic shield upgrade
  --print("Here");
  player:updateEvent(0,1450,currency_amount[15066],1456,currency_amount[15066],1453,currency_amount[15066]);
end

if (csid == 11) and (option ==2) and (player:getVar("CURRENTLY_UPGRADING") == 15067) then  -- special handling for bulwark shield upgrade
  --print("Here");
  player:updateEvent(0,1456,currency_amount[15067],1450,currency_amount[15067],1453,currency_amount[15067]);
end

if (csid == 11) and (option ==3) and (player:getVar("CURRENTLY_UPGRADING") == 15068) then  -- special handling for dynamis shield upgrade
  --print("Here");
  player:updateEvent(0,1456,currency_amount[15068],1450,currency_amount[15068],1453,currency_amount[15068]);
end

end

------------------------------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
currently_upgrading = player:getVar("CURRENTLY_UPGRADING");

if (csid == 16) or (csid == 19) or (csid == 52 ) then -- completed upgrade
   player:specialMessage(179,currently_upgrading);
end
end;