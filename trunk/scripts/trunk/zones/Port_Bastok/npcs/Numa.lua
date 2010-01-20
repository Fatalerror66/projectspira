-----------------------------------
--	Author: Arcanedemon
-- 	Numa
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,967);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x3129,7654,1,
	0x30A9,5079,1,
	0x32A9,3924,1,
	0x3229,6133,1,
	0x31A9,4212,1,
	0x3395,3825,1,
	0x02C0,132,2,
	0x30A8,759,2,
	0x3128,1145,2,
	0x32A8,584,2,
	0x3228,915,2,
	0x31A8,630,2,
	0x025D,180,3}

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