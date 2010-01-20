-----------------------------------
--	Author: Arcanedemon
-- 	Hortense
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,997);
shop = player:createShop(1);
stock = {0x1370,64,
	0x1371,441,
	0x1372,3960,
	0x1373,6912,
	0x137A,37,
	0x137B,321,
	0x137C,3240,
	0x137D,5940,
	0x138A,21,
	0x138B,1101,
	0x138C,5544}

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