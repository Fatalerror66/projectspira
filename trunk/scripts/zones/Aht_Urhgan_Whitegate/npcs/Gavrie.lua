-----------------------------------
--	Author: Arcanedemon
-- 	Gavrie
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,5692);
shop = player:createShop(9);
stock = {0x1010,910,
	0x1020,4832,
	0x1034,316,
	0x1036,2595,
	0x1037,800,
	0x103B,22400,
	0x119D,12,
	0x492B,200,
	0x492C,500,
	0x492D,1000}
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