-----------------------------------
--	Author: Arcanedemon
-- 	Zemedars
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,988);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x300D,31544,1,
	0x3224,23316,1,
	0x32A2,14484,1,
	0x3299,3162,1,
	0x3219,5003,1,
	0x32A1,1140,2,
	0x3221,1840,2,
	0x3298,309,2,
	0x3218,493,2,
	0x300C,11076,2,
	0x32A0,117,3,
	0x3220,191,3,
	0x3208,11592,3,
	0x3288,7120,3,
	0x3001,110,3}

i = 1;
while i <= (table.getn(stock)-1) do
	if (stock[i+2] == 1) then
		if (nation == 1 and conquest == 1) then
			shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		end
	elseif (stock[i+2] == 2) then
		if (conquest <= 2) then
			shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		end
	else
		shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	end
	i = i+3;
	if (i >= table.getn(stock)) then 
		break; 
	end
end
player:sendShop(shop);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;