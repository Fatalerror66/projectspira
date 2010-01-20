-----------------------------------
--	Author: Arcanedemon
-- 	Mamerie
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,1019);
shop = player:createShop(2);
stock = {0x45C6,695,
	0x45CA,695,
	0x45C4,82,
	0x0348,7,
	0x13D1,50784,
	0x11C1,62,
	0x45C8,126,
	0x4278,11,
	0x4279,82}
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