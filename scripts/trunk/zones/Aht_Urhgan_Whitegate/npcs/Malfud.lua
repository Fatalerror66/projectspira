-----------------------------------
--	Author: Arcanedemon
-- 	Malfud
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,5693);
shop = player:createShop(9);
stock = {0x0272,255,
	0x0279,16,
	0x03A8,16,
	0x08A5,12,
	0x1124,44,
	0x1126,40}
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