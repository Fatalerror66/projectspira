-----------------------------------
--	Author: Arcanedemon
-- 	Coumuna
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,430);
shop = player:createShop(5);
stock = {0x400F,15488,
	0x401C,29760,
	0x404C,11128,
	0x4053,14560,
	0x4086,31000,
	0x40B7,85250,
	0x40CD,13926,
	0x4141,4186};
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