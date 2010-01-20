-----------------------------------
--	Author: Arcanedemon
-- 	Proud Beard
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,1718);
shop = player:createShop(4);
stock = {0x31D6,165,
	0x3258,239,
	0x32D1,165,
	0x315D,276,
	0x32D2,165,
	0x31D8,165,
	0x32CD,165,
	0x31D2,165,
	0x3254,239,
	0x3253,239,
	0x3157,276,
	0x3158,276}
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