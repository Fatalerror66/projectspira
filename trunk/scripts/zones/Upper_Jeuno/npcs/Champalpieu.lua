-----------------------------------
--	Author: Arcanedemon
-- 	Champalpieu
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,449);
shop = player:createShop(5);
stock = {0x025D,180,
	0x110D,120,
	0x13C8,567,
	0x13CB,420,
	0x43A8,7,
	0x43B8,5};
i = 1;
while i <= (table.getn(stock)-1) do
	shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	i = i+2;
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