-----------------------------------
--	Author: Arcanedemon
-- 	Yoyoroon
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,914);
shop = player:createShop(9);
stock = {0x08BF,4940,
	0x08C0,9925,
	0x08C2,9925,
	0x08C3,4940,
	0x08C6,4940,
	0x08C7,9925,
	0x08CA,9925,
	0x08CB,4940,
	0x08CE,4940,
	0x08CF,9925,
	0x08D2,4940,
	0x08D4,9925,
	0x08D6,4940,
	0x08D8,9925,
	0x08DA,4940,
	0x08DC,9925}
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