-----------------------------------
--	Author: Arcanedemon
-- 	Dwago
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,5697); --5717 is what my latest FFXImon capture shows
shop = player:createShop(9);
stock = {0x45C6,695,
	0x43F4,3,
	0x43F3,9,
	0x4278,11,
	0x4279,82}
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