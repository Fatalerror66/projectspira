-----------------------------------
--	Author: Arcanedemon
-- 	Areebah
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,449);
shop = player:createShop(5);
stock = {0x027C,119,
	0x03AD,80,
	0x03B4,60,
	0x03B5,96,
	0x03B7,110,
	0x03BC,120,
	0x03BD,120,
	0x03BE,120};
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