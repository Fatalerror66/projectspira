-----------------------------------
--	Author: Tenjou
-- 	CHOCOBO RENTER: Plaiaude
-- 	Allows qualified players to rent chocobos.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--Restrict to licensed players level 20 and above only.
license = player:hasKeyItem(0x8a);
level = player:getMainLvl();
if (license == 1 and level >= 20) then
	local event0x38e = Event(0x38e);
	--Dynamic pricing.
	timer = os.time();
	baseprice = CHOCOBO_PRICE_KONSCHTAT;
	lastprice = getGlobalVar("chocoboRentPrice-Konschtat");
	lasttime = getGlobalVar("chocoboRentTime-Konschtat");
	decay = CHOCOBO_PRICE_KONSCHTAT_DECAY;
	decaytime = CHOCOBO_PRICE_KONSCHTAT_DECAY_TIME;
	--Decay price based on last rental time.
	while (lasttime < timer) do
		lastprice = lastprice - decay;
		lasttime = lasttime + decaytime;
		price = lastprice;
	end
	--Compensate for running the loop at least once.
	price = price+decay;
	--Raise above minimum base price.
	if (price < baseprice) then
		price = baseprice;
	end
	--Store the offered price for use in onEventFinish.
	setGlobalVar("chocoboRentOffer-Konschtat",price);
	event0x38e:setParams(price,player:getCurrGil()); 
	player:startEvent(event0x38e);
else
	player:startEvent(Event(0x38f));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
item1 = trade:hasItemQty(0x5ea,1);
level = player:getMainLvl();
license = player:hasKeyItem(0x8a);
count = trade:getItemCount();
if (count == 1 and item1 and level >= 20 and license) then
	player:removeItem(0x5ea,1);
	event0x38e = Event(0x38e);
	event0x38e:setParams(0xffffffff);
	player:startEvent(event0x38e);
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(245,24,300,0xc0,0x6c);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x38e and option == 0) then
	flux = CHOCOBO_PRICE_KONSCHTAT_FLUX;
	price = getGlobalVar("chocoboRentOffer-Konschtat");
	player:removeGil(price);
	setGlobalVar("chocoboRentPrice-Konschtat",price+flux);
	setGlobalVar("chocoboRentTime-Konschtat",os.time());
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(245,24,300,0xc0,0x6c);
end
end;