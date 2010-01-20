-----------------------------------
--	Author: Arcanedemon
-- 	Chayaya
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,1079);
shop = player:createShop(9);
stock = {0x1565,68000,
	0x1566,22400,
	0x1567,5000,
	0x1568,108000,
	0x1569,62000,
	0x156A,50400,
	0x156B,90750,
	0x156C,2205,
	0x156D,26600,
	0x156E,12780,
	0x156F,1300,
	0x1577,63375,
	0x1578,68250,
	0x439B,10,
	0x439C,60,
	0x43A1,1204,
	0x43A8,8}
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