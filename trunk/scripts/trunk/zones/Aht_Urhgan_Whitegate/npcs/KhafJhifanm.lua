-----------------------------------
--	Author: Arcanedemon
-- 	Khaf Jhifanm
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,5699);
shop = player:createShop(9);
stock = {0x08BB,320,
	0x13D3,4400,
	0x15BF,200,
	0x15C8,800,
	0x15D6,3750}
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