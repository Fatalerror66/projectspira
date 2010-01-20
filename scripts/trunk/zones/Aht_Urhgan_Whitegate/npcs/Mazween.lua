-----------------------------------
--	Author: Arcanedemon
-- 	Mazween
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,5700);
shop = player:createShop(9);
stock = {0x1316,19932,
	0x1313,11200,
	0x129C,33306,
	0x12E7,14000,
	0x1296,5160,
	0x12F6,45930,
	0x1315,22682,
	0x1292,25200,
	0x12DD,27744,
	0x12E1,39368,
	0x1303,27000,
	0x1311,44000,
	0x12A1,30780,
	0x12A6,18720}
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