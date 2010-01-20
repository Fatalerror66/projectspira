-----------------------------------
--	Author: Tenjou
-- 	CHOCOBO RENTER: Amimi
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
	local event0x2714 = Event(0x2714);
	--Dynamic pricing.
	timer = os.time();
	baseprice = CHOCOBO_PRICE_WINDURST;
	lastprice = getGlobalVar("chocoboRentPrice-Windurst");
	lasttime = getGlobalVar("chocoboRentTime-Windurst");
	decay = CHOCOBO_PRICE_WINDURST_DECAY;
	decaytime = CHOCOBO_PRICE_WINDURST_DECAY_TIME;
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
	setGlobalVar("chocoboRentOffer-Windurst",price);
	--Possibility of offering quest "A Chocobo Riding Game."  For now it means a free chocobo.
	chocoquest = math.random();
	chocoquesttime = getGlobalVar("chocoboFreeRent-Windurst");
	if (chocoquest >= (1 - CHOCOBO_RIDING_GAME_WINDURST) and os.time() >= (chocoquesttime+604800)) then
		setGlobalVar("chocoboFreeRentOffer-Windurst",1);
		nation = math.random(0,6);
		if (nation == 2) then
			nation = math.random(0,1);
		elseif (nation == 6) then
			nation = math.random(3,5);
		end
		event0x2714:setParams(0xfffffffd,0,0,nation);
	else
		setGlobalVar("chocoboFreeRentOffer-Windurst",0);
		--Extend time for players level 20 and above.
		lvlblock = 1;
		if (level >= 20) then
			lvlblock = 0;
		end
		event0x2714:setParams(price,player:getCurrGil(),lvlblock); 
	end
	player:startEvent(event0x2714);
else
	player:startEvent(Event(0x2717));
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
	event0x2714 = Event(0x2714);
	event0x2714:setParams(0xffffffff);
	player:startEvent(event0x2714);
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(-122,-4,-520,0,0x74);
elseif (count == 1 and item2 and level >= 20 and license) then
	player:removeItem(0x5ea,1);
	event0x2714 = Event(0x2714);
	event0x2714:setParams(0xffffffff);
	player:startEvent(event0x2714);
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(-122,-4,-520,0,0x74);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 0x2714 and option == 0) then
	flux = CHOCOBO_PRICE_WINDURST_FLUX;
	price = getGlobalVar("chocoboRentOffer-Windurst");
	--print("PRICE:",price);
	freeoffer = getGlobalVar("chocoboFreeRentOffer-Windurst");
	
	if (freeoffer == 1) then
		--Record time.  This quest will not be offered for another week.
		setGlobalVar("chocoboFreeRent-Windurst",os.time());
	else
		--Charge player :/
		player:removeGil(price);
		setGlobalVar("chocoboRentPrice-Windurst",price+flux);
		setGlobalVar("chocoboRentTime-Windurst",os.time());
	end
	if (player:getMainLvl() >= 20) then
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
	else
		player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
	end
	player:setPos(-122,-4,-520,0,0x74);
end
end;