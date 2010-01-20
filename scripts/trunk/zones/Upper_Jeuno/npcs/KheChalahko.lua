-----------------------------------
--	Author: Arcanedemon
-- 	Khe Chalahko
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,431);
shop = player:createShop(5);
stock = {0x3080,26311,
	0x3100,45208,
	0x3200,34776,
	0x320A,53130,
	0x3280,21859,
	0x328A,32637};
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