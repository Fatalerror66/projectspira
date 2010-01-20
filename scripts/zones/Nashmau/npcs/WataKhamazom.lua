-----------------------------------
--	Author: Arcanedemon
-- 	Wata Khamazom
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,913);
shop = player:createShop(9);
stock = {0x4300,44,
	0x4301,536,
	0x4302,7920,
	0x4308,492,
	0x430A,21812,
	0x4341,6,
	0x43A6,4,
	0x43A8,8,
	0x43A9,18,
	0x43AA,140,
	0x4752,248}
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