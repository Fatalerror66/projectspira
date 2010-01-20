-----------------------------------
--	Author: Tenjou
-- 	CHOCOBO RENTER: Dahaaba
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
	local event0x10e = Event(0x10e);
	--Dynamic pricing.
	timer = os.time();
	baseprice = CHOCOBO_PRICE_AL_ZAHBI;
	lastprice = getGlobalVar("chocoboRentPrice-AlZahbi");
	lasttime = getGlobalVar("chocoboRentTime-AlZahbi");
	decay = CHOCOBO_PRICE_AL_ZAHBI_DECAY;
	decaytime = CHOCOBO_PRICE_AL_ZAHBI_DECAY_TIME;
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
	setGlobalVar("chocoboRentOffer-AlZahbi",price);
	event0x10e:setParams(price,player:getCurrGil()); 
	player:startEvent(event0x10e);
else
	player:startEvent(Event(0x10f));
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
	event0x10e = Event(0x10e);
	event0x10e:setParams(0xffffffff);
	player:startEvent(event0x10e);
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(610,-24,356,0x80,0x33);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x10e and option == 0) then
	flux = CHOCOBO_PRICE_AL_ZAHBI_FLUX;
	price = getGlobalVar("chocoboRentOffer-AlZahbi");
	player:removeGil(price);
	setGlobalVar("chocoboRentPrice-AlZahbi",price+flux);
	setGlobalVar("chocoboRentTime-AlZahbi",os.time());
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(610,-24,356,0x80,0x33);
end
end;