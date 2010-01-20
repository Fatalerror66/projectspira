-----------------------------------
--	Author: Arcanedemon
-- 	Layton
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,690);
shop = player:createShop(9);
stock = {0x1799,15750,
	0x179A,13325,
	0x179B,18375,
	0x179C,16450,
	0x179D,12675,
	0x179E,13975,
	0x179F,19875,
	0x17A0,19125,
	0x17A1,8060,
	0x17A2,6318,
	0x17A3,9100,
	0x17A4,8580,
	0x17A5,5200,
	0x17A6,6786,
	0x17A7,11440,
	0x17A8,10725};
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