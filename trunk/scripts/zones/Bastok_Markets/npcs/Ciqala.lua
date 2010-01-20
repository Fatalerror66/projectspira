-----------------------------------
--	Author: Arcanedemon
-- 	Ciqala
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,966);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x4008,4818,1,
	0x4103,11285,1,
	0x4141,4186,1,
	0x4294,6033,1,
	0x4007,828,2,
	0x4101,1435,2,
	0x4140,618,2,
	0x4293,2129,2,
	0x4006,224,3,
	0x4100,290,3,
	0x4292,312,3,
	0x4299,47,3,
	0x42C0,57,3}

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