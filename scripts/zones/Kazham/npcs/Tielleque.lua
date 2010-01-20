-----------------------------------
--	Author: Tenjou
-- 	CHOCOBO RENTER: Tielleque
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
	local event0x2720 = Event(0x2720);
	--Dynamic pricing.
	timer = os.time();
	baseprice = CHOCOBO_PRICE_KAZHAM;
	lastprice = getGlobalVar("chocoboRentPrice-Kazham");
	lasttime = getGlobalVar("chocoboRentTime-Kazham");
	decay = CHOCOBO_PRICE_KAZHAM_DECAY;
	decaytime = CHOCOBO_PRICE_KAZHAM_DECAY_TIME;
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
	setGlobalVar("chocoboRentOffer-Kazham",price);
	--Possibility of offering quest "A Chocobo Riding Game."  For now it means a free chocobo.
	chocoquest = math.random();
	chocoquesttime = getGlobalVar("chocoboFreeRent-Kazham");
	if (chocoquest >= (1 - CHOCOBO_RIDING_GAME_KAZHAM) and os.time() >= (chocoquesttime+604800)) then
		setGlobalVar("chocoboFreeRentOffer-Kazham",1);
		event0x2720:setParams(0xfffffffd,0,0,6);
	else
		setGlobalVar("chocoboFreeRentOffer-Kazham",0);
		event0x2720:setParams(price,player:getCurrGil()); 
	end
	player:startEvent(event0x2720);
else
	player:startEvent(Event(0x2721));
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
	event0x2720 = Event(0x2720);
	event0x2720:setParams(0xffffffff);
	player:startEvent(event0x2720);
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(-240,0,528,0x40,0x7b);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x2720 and option == 0) then
	flux = CHOCOBO_PRICE_KAZHAM_FLUX;
	price = getGlobalVar("chocoboRentOffer-Kazham");
	--print("PRICE:",price);
	freeoffer = getGlobalVar("chocoboFreeRentOffer-Kazham");
	if (freeoffer == 1) then
		--Record time.  This quest will not be offered for another week.
		setGlobalVar("chocoboFreeRent-Kazham",os.time());
	else
		--Charge player :/
		player:removeGil(price);
		setGlobalVar("chocoboRentPrice-Kazham",price+flux);
		setGlobalVar("chocoboRentTime-Kazham",os.time());
	end
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(-240,0,528,0x40,0x7b);
end
end;