-----------------------------------
--	Author: Arcanedemon
-- 	Leillaine
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,428);
shop = player:createShop(5);
stock = {0x1010,837,
	0x1020,4445,
	0x1034,290,
	0x1036,2387,
	0x1037,736,
	0x103B,22400,
	0x119D,10};
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