-----------------------------------
--	Author: Tenjou
-- 	CHOCOBO RENTER: Quelle
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
--Restrict to licensed players level 15 and above only.
license = player:hasKeyItem(0x8a);
level = player:getMainLvl();
if (license == 1 and level >= 15) then
	local event0x3f = Event(0x3f);
	--Dynamic pricing.
	timer = os.time();
	baseprice = CHOCOBO_PRICE_BASTOK;
	lastprice = getGlobalVar("chocoboRentPrice-Bastok");
	lasttime = getGlobalVar("chocoboRentTime-Bastok");
	decay = CHOCOBO_PRICE_BASTOK_DECAY;
	decaytime = CHOCOBO_PRICE_BASTOK_DECAY_TIME;
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
	setGlobalVar("chocoboRentOffer-Bastok",price);
	--Possibility of offering quest "A Chocobo Riding Game."  For now it means a free chocobo.
	chocoquest = math.random();
	chocoquesttime = getGlobalVar("chocoboFreeRent-Bastok");
	if (chocoquest >= (1 - CHOCOBO_RIDING_GAME_BASTOK) and os.time() >= (chocoquesttime+604800)) then
		setGlobalVar("chocoboFreeRentOffer-Bastok",1);
		nation = math.random(0,6);
		if (nation == 1) then
			nation = 2;
		elseif (nation == 6) then
			nation = math.random(3,5);
		end
		event0x3f:setParams(0xfffffffd,0,0,nation);
	else
		setGlobalVar("chocoboFreeRentOffer-Bastok",0);
		--Extend time for players level 20 and above.
		lvlblock = 1;
		if (level >= 20) then
			lvlblock = 0;
		end
		event0x3f:setParams(price,player:getCurrGil(),lvlblock); 
	end
	player:startEvent(event0x3f);
else
	player:startEvent(Event(0x42));
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
item1 = trade:hasItemQty(0x6fd,1);
item2 = trade:hasItemQty(0x5ea,1);
level = player:getMainLvl();
license = player:hasKeyItem(0x8a);
count = trade:getItemCount();
if (count == 1 and item1) then
	player:removeItem(0x6fd,1);
	event0x3f = Event(0x3f);
	event0x3f:setParams(0xffffffff);
	player:startEvent(event0x3f);
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(580,0,-305,0x40,0x6b);
elseif (count == 1 and item2 and level >= 20 and license) then
	player:removeItem(0x5ea,1);
	event0x3f = Event(0x3f);
	event0x3f:setParams(0xffffffff);
	player:startEvent(event0x3f);
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(580,0,-305,0x40,0x6b);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x3f and option == 0) then
	flux = CHOCOBO_PRICE_BASTOK_FLUX;
	price = getGlobalVar("chocoboRentOffer-Bastok");
	--print("PRICE:",price);
	freeoffer = getGlobalVar("chocoboFreeRentOffer-Bastok");
	
	if (freeoffer == 1) then
		--Record time.  This quest will not be offered for another week.
		setGlobalVar("chocoboFreeRent-Bastok",os.time());
	else
		--Charge player :/
		player:removeGil(price);
		setGlobalVar("chocoboRentPrice-Bastok",price+flux);
		setGlobalVar("chocoboRentTime-Bastok",os.time());
	end
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(580,0,-305,0x40,0x6b);
end
end;