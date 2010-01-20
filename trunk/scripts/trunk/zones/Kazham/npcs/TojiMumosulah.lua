-----------------------------------
--	Author: Arcanedemon
-- 	Toji Mumosulah
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,436);
shop = player:createShop(2);
stock = {0x137B,328,
	0x137C,3312,
	0x4266,36,
	0x338F,95,
	0x3409,1667,
	0x3314,3510,
	0x45D4,165,
	0x43C7,4747,
	0x03FD,450,
	0x1364,8726,
	0x4261,69,
	0x45D8,695,
	0x0070,456}
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