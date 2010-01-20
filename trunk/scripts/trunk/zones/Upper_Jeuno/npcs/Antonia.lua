-----------------------------------
--	Author: Arcanedemon
-- 	Antonia
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,430);
shop = player:createShop(5);
stock = {0x4186,10596,
	0x41C4,44550,
	0x4283,11232,
	0x428C,18048,
	0x4294,60333,
	0x42A5,6256,
	0x42CA,37440,
	0x43A8,7};
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